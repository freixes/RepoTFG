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

    
}
