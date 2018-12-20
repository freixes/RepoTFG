using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;

public class EnemyAgent : Agent {

    public EnemyController enemy;
    public PlayerController player;
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
        enemy.transform.position = initPos;
    }

    public override void CollectObservations()
    {
        Vector3 relativePosition = player.transform.position - enemy.transform.position;

        //relative pos to player
        //floor plane 100x100
        AddVectorObs(relativePosition.x / 50);
        AddVectorObs(relativePosition.y / 50);

        //
        AddVectorObs(enemy.curHP);
        AddVectorObs(player.curHP);


    }

    public override void AgentAction(float[] vectorAction, string textAction)
    {
        float distToPlayer = Vector3.Distance(enemy.transform.position,
                                                player.transform.position);

        if(distToPlayer < 1)
        {
            AddReward(0.3f);
            Done();
        }
    }
}
