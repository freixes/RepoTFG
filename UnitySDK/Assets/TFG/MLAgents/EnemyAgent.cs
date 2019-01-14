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

    Vector3 initPos;
    // Start is called before the first frame update
    void Start()
    {
        initPos = enemy.transform.position;
      
    }

    public override void AgentReset()
    {
        enemy.curHP = enemy.maxHP;
        player.curHP = player.maxHP;
        prevHP = enemy.maxHP;
        enemy.transform.position = initPos;
    }

    public override void CollectObservations()
    {
        Vector3 relativePosition = player.transform.position - enemy.transform.position;

        //relative pos to player
        //floor plane 100x100
        AddVectorObs(relativePosition.x / 50);
        AddVectorObs(relativePosition.y / 50);

        //Own stats
        AddVectorObs(enemy.curHP);
        AddVectorObs(enemy.currStam);
        AddVectorObs(player.curHP);
        


    }

    public override void AgentAction(float[] vectorAction, string textAction)
    {
        float distToPlayer = Vector3.Distance(enemy.transform.position,
                                                player.transform.position);
        /*
        if(distToPlayer < 1)
        {
            AddReward(0.3f);
            Done();
        }*/

        //own damage penalty
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
