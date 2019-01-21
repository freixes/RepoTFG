using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;


public class EnemyAgent : Agent {

    public EnemyController enemy;
    public EnemyController player;
    float prevHP;
    float prevPlayerHP;
    public float prevDistance;
    float delta;
    public float angle;
    int max = 20, min = -20;
    float reward = 0;


    Vector3 initPos;
    Vector3 playerInitPos;
    // Start is called before the first frame update
    void Start()
    {
        initPos = enemy.transform.position;
        playerInitPos = player.transform.position;

    }

    private void Update()
    {
        
    }

    public override void AgentReset()
    {
        enemy.curHP = enemy.maxHP;
        player.curHP = player.maxHP;
        prevHP = enemy.curHP;

        //agent new pos
        float x = Random.Range(min, max);
        float z = Random.Range(min, max);     
        enemy.transform.position = new Vector3(x,enemy.transform.position.y, z);
        float newAngle = Random.Range(0, 360);
        enemy.trans.rotation = Quaternion.Euler(0, newAngle, 0);

        //player new pos
        x = Random.Range(min, max);
        z = Random.Range(min, max);
        player.transform.position = new Vector3(x, player.transform.position.y, z);
        
        //new distance
        prevDistance = Vector3.Distance(enemy.transform.position,
                                                player.transform.position);
    }

    public override void CollectObservations()
    {
        Vector3 relativePosition = player.transform.position - enemy.transform.position;
        Vector3 lookDir = enemy.transform.right;
        float lookDirAngle = Vector3.Angle(lookDir, relativePosition);
       
        //own position
        AddVectorObs(transform.position.x);
        AddVectorObs(transform.position.z);
        //player pos
        AddVectorObs(player.transform.position.x);
        AddVectorObs(player.transform.position.z);
        //enemy rotation
        AddVectorObs(enemy.transform.rotation.y);
        //look direction
        AddVectorObs(lookDir.x);
        AddVectorObs(lookDir.z);
        //look angle diference
        AddVectorObs(lookDirAngle);


        //relative pos to player
        //floor plane 100x100
        //AddVectorObs(relativePosition.x / 50);
        //AddVectorObs(relativePosition.y / 50);

        //stats
        AddVectorObs(enemy.curHP);
        AddVectorObs(enemy.currStam);
        AddVectorObs(enemy.isBlocking);
        AddVectorObs(player.curHP);
        AddVectorObs(player.isBlocking);




    }

    public override void AgentAction(float[] vectorAction, string textAction)
    {
        delta = Time.fixedDeltaTime;
        float distToPlayer = Vector3.Distance(enemy.transform.position,
                                                player.transform.position);
        
        Vector3 lookDir = enemy.transform.right;
        Vector3 lookAtPlayer = player.transform.position - enemy.transform.position;

        angle = Vector3.Angle(lookDir, lookAtPlayer);
        
        
        //actions to enemy stats
        enemy.horizontal = vectorAction[0]; //movement
        enemy.vertical = vectorAction[1];   //movement
        enemy.rt = vectorAction[2] == 1.0f ? true : false; //heavy attack
        enemy.rb = vectorAction[3] == 1.0f ? true : false; //light attack
        enemy.lb = vectorAction[4] == 1.0f ? true : false; //block
        enemy.c_h = vectorAction[5];  //rotation

        //if (vectorAction[0] == 1) enemy.horizontal = 1;
        //if (vectorAction[0] == -1) enemy.horizontal = -1;
        //if (vectorAction[1] == 1) enemy.vertical = 1;
        //if (vectorAction[1] == -1) enemy.vertical = -1;
        //if (vectorAction[2] == 1) enemy.rt = true;
        //if (vectorAction[2] == 0) enemy.rt = false;
        //if (vectorAction[3] == 1) enemy.rb = true;
        //if (vectorAction[3] == 0) enemy.rb = false;
        //if (vectorAction[4] == 1) enemy.lb = true;
        //if (vectorAction[4] == 0) enemy.lb = false;
        //if (vectorAction[5] == 1) enemy.c_h = 1;
        //if (vectorAction[5] == -1) enemy.c_h = -1;

        //prevDistance = distToPlayer;
        prevHP = enemy.curHP;
        prevPlayerHP = player.curHP;


        enemy.FixedTick(delta);
        //distToPlayer = Vector3.Distance(enemy.transform.position,
        //                                       player.transform.position);
        

        //Rewards and punishments

        //damage
        if (prevHP > enemy.curHP)
        {
            AddReward(-1.0f);
            reward += -1;
            prevHP = enemy.curHP;
            //Done();
        }
        //damage player reward
        if(prevPlayerHP > player.curHP)
        {
            AddReward(100.0f);
            reward += 1;
            prevPlayerHP = player.curHP;
            //Done();
        }
        //getting closer reward
        if (prevDistance > distToPlayer)
        {
            AddReward(10.0f);
            reward += 10;
            prevDistance = distToPlayer;
            //Done();
            
        }
        //punish for getting farther
        if(prevDistance < distToPlayer)
        {
            AddReward(-2.0f);
            reward += -2;
            prevDistance = distToPlayer;
            //Done();
        }
        /*
        if(distToPlayer < 2)
        {
            AddReward(3.0f);
            //Done();
        }
        */
        //objective reached
        if(player.curHP <= 0)
        {
            AddReward(5.0f);
            reward += 5;
            Done();
        }

        if(enemy.curHP <= 0)
        {
            AddReward(-5.0f);
            reward += 5;
            Done();
        }
        angle = Mathf.Abs(angle);
        
        if(angle < 20)
        {
            AddReward(3.0f);
            reward += 3;
            //Done();
        }
        else
        {
            AddReward(-4.0f);
            reward += -4;

        }
        
    }
}
