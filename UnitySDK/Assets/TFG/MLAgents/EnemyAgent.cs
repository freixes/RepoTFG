using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;


public class EnemyAgent : Agent {

    public EnemyController enemy;
    public BaseCharacter player;
    public GameObject Arena;

    float prevHP;
    float prevPlayerHP;
    public float prevDistance;
    float delta;
    public float angle;
    public float moveAmount;
    int max = 20, min = -20, area= 23;
    public float score = 0;


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
        enemy.isDead = false;
        player.isDead = false;
        score = 0;

        //agent new pos
        float x = Random.Range(Arena.transform.position.x + min, Arena.transform.position.x + max);
        float z = Random.Range(Arena.transform.position.z + min, Arena.transform.position.z + max);
        enemy.transform.position = new Vector3(x,enemy.transform.position.y, z);
        float newAngle = Random.Range(0, 360);
        enemy.trans.rotation = Quaternion.Euler(0, newAngle, 0);

        //player new pos
        x = Random.Range(Arena.transform.position.x + min, Arena.transform.position.x + max);
        z = Random.Range(Arena.transform.position.z + min, Arena.transform.position.z + max);
        player.transform.position = new Vector3(x, player.transform.position.y, z);
        
        //new distance
        prevDistance = Vector3.Distance(enemy.transform.position,
                                                player.transform.position);
    }

    public override void CollectObservations()
    {
        Vector3 relativePosition = player.transform.position - enemy.transform.position;
        Vector3 lookDir = enemy.transform.forward;
        float lookDirAngle = Vector3.SignedAngle(lookDir, relativePosition, Vector3.up);
       
        //own position
        //AddVectorObs(transform.position.x);
        //AddVectorObs(transform.position.z);
        //player pos
        //AddVectorObs(player.transform.position.x);
        //AddVectorObs(player.transform.position.z);
        //enemy rotation
        //AddVectorObs(enemy.transform.rotation.y);
        //look direction
        //AddVectorObs(lookDir.x);
        //AddVectorObs(lookDir.z);
        //look angle diference
        AddVectorObs(lookDirAngle);


        //relative pos to player
        //floor plane 100x100
        AddVectorObs(relativePosition.x / area);
        AddVectorObs(relativePosition.z / area);

        //stats
        AddVectorObs(enemy.curHP);
        AddVectorObs(enemy.currStam);
        AddVectorObs(enemy.isBlocking);
        AddVectorObs(enemy.moveAmount);

        AddVectorObs(player.curHP);
        AddVectorObs(player.isBlocking);
        AddVectorObs(prevHP);
        AddVectorObs(prevPlayerHP);




    }

    public override void AgentAction(float[] vectorAction, string textAction)
    {
        delta = Time.fixedDeltaTime;
        float distToPlayer = Vector3.Distance(enemy.transform.position,
                                                player.transform.position);
        
        Vector3 lookDir = enemy.transform.forward;
        Vector3 lookAtPlayer = player.transform.position - enemy.transform.position;

        angle = Vector3.SignedAngle(lookDir, lookAtPlayer, Vector3.up);
        
        
        //actions to enemy stats
        enemy.horizontal = vectorAction[0]; //movement
        enemy.vertical = vectorAction[1];   //movement
        enemy.rt = vectorAction[2] == 1.0f ? true : false; //heavy attack
        enemy.rb = vectorAction[3] == 1.0f ? true : false; //light attack
        enemy.lb = vectorAction[4] == 1.0f ? true : false; //block
        enemy.c_h = vectorAction[5];  //rotation
        //if(vectorAction[5] < 0.05f && vectorAction[5] > -0.05f)
        //{
        //    enemy.c_h = 0;
        //}

        moveAmount = Mathf.Clamp01(Mathf.Abs(vectorAction[0]) + Mathf.Abs(vectorAction[1]));
       

        //prevDistance = distToPlayer;
        prevHP = enemy.curHP;
        prevPlayerHP = player.curHP;


        enemy.FixedTick(delta);
        
        //score and punishments

        //getting hit
        if (prevHP > enemy.curHP)
        {
            AddReward(-.8f);
            score += -.8f;
            prevHP = enemy.curHP;
            //Done();
        }
        //hitting player
        if(prevPlayerHP > player.curHP)
        {
            AddReward(.8f);
            score += .8f;
            prevPlayerHP = player.curHP;
            //Done();
        }

        //if(prevPlayerHP == player.curHP)
        //{
        //    AddReward(-.001f);
        //    score += -.001f;
        //}


        //distance
        //getting closer reward
        if(distToPlayer > 1.5f)
        {
            if (prevDistance > distToPlayer)
            {
                AddReward(.5f);
                score += .5f;
                prevDistance = distToPlayer;
                //Done();

            }
            //punish for getting farther
            if (prevDistance < distToPlayer)
            {
                AddReward(-.55f);
                score += -.55f;
                prevDistance = distToPlayer;
                //Done();
            }
        }
        else
        {
            AddReward(.001f);
            score += .001f;
        }
       
        //if(distToPlayer < enemy.slowingRadius)
        //{
        //    AddReward(0.1f);
        //    score += 0.1f;
        //}
        //else
        //{
        //    AddReward(-0.01f);
        //    score += -0.01f;
        //}



        //speed
        if (distToPlayer < enemy.slowingRadius)
        {
            if (distToPlayer < enemy.stopRadius)
            {
                if (moveAmount < .2f)
                {
                    AddReward(0.1f);
                    score += .1f;
                }
                else
                {
                    AddReward(-0.001f);
                    score += -.001f;
                }
            }
            else
            {
                if(moveAmount < .8f && moveAmount > .2f)
                {
                    AddReward(0.1f);
                    score += .1f;
                }
                else
                {
                    AddReward(-0.001f);
                    score += -.001f;
                }
            }
        }

        //angle = Mathf.Abs(angle);
        if(angle < 20 && angle > -20)
        {
            AddReward(.3f);
            score += .3f;
            //Done();
        }
        else
        {
            AddReward(-.4f);
            score += -.4f;

        }


        //objective reached
        if (player.curHP <= 0)
        {
            AddReward(1.0f);
            score += 1.0f;
            Done();
        }
        //Death
        if (enemy.curHP <= 0)
        {
            AddReward(-1.0f);
            score += -1.0f;
            Done();
        }

    }
}
