using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;

public class EnemyAgent : Agent {

    public EnemyController enemy;
    public PlayerController player;
    float prevHP;
    float prevPlayerHP;
    float prevDistance;
    float delta;
    

    Vector3 initPos;
    // Start is called before the first frame update
    void Start()
    {
        initPos = enemy.transform.position;
      
    }

    private void Update()
    {
        
    }

    public override void AgentReset()
    {
        enemy.curHP = enemy.maxHP;
        player.curHP = player.maxHP;
        prevHP = enemy.curHP;
        enemy.transform.position = initPos;
        prevDistance = Vector3.Distance(enemy.transform.position,
                                                player.transform.position);
    }

    public override void CollectObservations()
    {
        Vector3 relativePosition = player.transform.position - enemy.transform.position;
        Vector3 lookDir = enemy.transform.forward;
        float angle = Vector3.Angle(lookDir, relativePosition);
       
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
        AddVectorObs(angle);


        //relative pos to player
        //floor plane 100x100
        AddVectorObs(relativePosition.x / 50);
        AddVectorObs(relativePosition.y / 50);

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
        Vector3 lookDir = enemy.transform.forward;
        Vector3 lookAtPlayer = player.transform.position - enemy.transform.position;

        float angle = Vector3.Angle(lookDir, lookAtPlayer);
        
        
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

        enemy.FixedTick(delta);


        //Rewards and punishments
        
        //damage
        if (prevHP > enemy.curHP)
        {
            AddReward(-0.3f);
            prevHP = enemy.curHP;
        }
        //damage player reward
        if(prevPlayerHP > player.curHP)
        {
            AddReward(0.3f);
            prevPlayerHP = player.curHP;
        }
        //getting closer reward
        if (prevDistance > distToPlayer)
        {
            AddReward(0.01f);
            prevDistance = distToPlayer;
        }
        //punish for getting farther
        if(prevDistance < distToPlayer)
        {
            AddReward(-0.02f);
            prevDistance = distToPlayer;
        }
        //objective reached
        if(player.curHP <= 0)
        {
            AddReward(2.0f);
            Done();
        }

        if(enemy.curHP <= 0)
        {
            AddReward(-5.0f);
            Done();
        }
        
        if(angle < 10)
        {
            AddReward(0.05f);
        }
        else
        {
            AddReward(-0.08f);
        }
        
    }
}
