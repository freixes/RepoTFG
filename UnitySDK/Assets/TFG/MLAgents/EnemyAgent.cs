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

        //own position
        AddVectorObs(transform.position);
        //player pos
        AddVectorObs(player.transform.position);

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
        /*
        if(distToPlayer < 1)
        {
            AddReward(0.3f);
            Done();
        }*/

        //own damage penalty
        enemy.horizontal = vectorAction[0];
        enemy.vertical = vectorAction[1];
        enemy.rt = vectorAction[2] == 1.0f ? true : false; //heavy attack
        enemy.rb = vectorAction[3] == 1.0f ? true : false; //light attack
        enemy.lb = vectorAction[4] == 1.0f ? true : false; //block

        /*
        if (vectorAction[0] == 1) enemy.horizontal = 1;
        if (vectorAction[0] == -1) enemy.horizontal = -1;
        if (vectorAction[1] == 1) enemy.vertical = 1;
        if (vectorAction[1] == -1) enemy.vertical = -1;
        if (vectorAction[2] == 1) enemy.rt = true;
        if (vectorAction[3] == 1) enemy.rb = true;
        if (vectorAction[4] == 1) enemy.lb = true;
        */

        enemy.FixedTick(delta);

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
            AddReward(1.0f);
            Done();
        }
    }
}
