using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;


public class EnemyAgent : Agent
{

    public EnemyController self;
    public BaseCharacter rival;
    public GameObject Arena;

    float prevHP, prevStam;
    float prevPlayerHP;
    public float prevDistance;
    float delta;
    public float moveAmount;
    int max = 20, min = -20, area = 40;
    public float score = 0;
    float lookDirAngle;

    Vector3 initPos;
    Vector3 playerInitPos;
    float distToPlayer;
    // Start is called before the first frame update
    void Start()
    {
        initPos = self.transform.position;
        playerInitPos = rival.transform.position;

    }

    private void Update()
    {

    }

    public override void AgentReset()
    {
        self.curHP = self.maxHP;
        rival.curHP = rival.maxHP;
        prevHP = self.curHP;
 
        score = 0;

        //agent new pos
        float x = Random.Range(Arena.transform.position.x + min, Arena.transform.position.x + max);
        float z = Random.Range(Arena.transform.position.z + min, Arena.transform.position.z + max);
        self.transform.position = new Vector3(x, self.transform.position.y, z);
        float newAngle = Random.Range(0, 360);
        self.trans.rotation = Quaternion.Euler(0, newAngle, 0);

        //rival new pos
        x = Random.Range(Arena.transform.position.x + min, Arena.transform.position.x + max);
        z = Random.Range(Arena.transform.position.z + min, Arena.transform.position.z + max);
        rival.transform.position = new Vector3(x, rival.transform.position.y, z);

        //new distance
        prevDistance = Vector3.Distance(self.transform.position,
                                                rival.transform.position);

    }

    public override void CollectObservations()
    {
        Vector3 relativePosition = rival.transform.position - self.transform.position;
        Vector3 lookDir = self.transform.forward;
        lookDirAngle = Vector3.SignedAngle(lookDir, relativePosition, Vector3.up);
        distToPlayer = Vector3.Distance(self.transform.position,
                                                rival.transform.position);

        //look angle diference
        AddVectorObs(lookDirAngle);

        //relative pos to rival
        AddVectorObs(relativePosition.x / area);
        AddVectorObs(relativePosition.z / area);
        AddVectorObs(distToPlayer);
        //stats
        AddVectorObs(self.curHP);
        AddVectorObs(prevHP);
        AddVectorObs(self.currStam);
        AddVectorObs(prevStam);
        
        
        AddVectorObs(rival.curHP);
        AddVectorObs(prevPlayerHP);
        AddVectorObs(rival.isBlocking);
        AddVectorObs(rival.inAction);
        
        
    }

    public override void AgentAction(float[] vectorAction, string textAction)
    {
        delta = Time.fixedDeltaTime;
        
        //actions to self stats
        self.horizontal = vectorAction[0]; //movement
        self.vertical = vectorAction[1];   //movement
        self.rt = vectorAction[2] == 1.0f ? true : false; //heavy attack
        self.rb = vectorAction[3] == 1.0f ? true : false; //light attack
        self.lb = vectorAction[4] == 1.0f ? true : false; //block
        self.c_h = vectorAction[5];  //rotation
        
        moveAmount = Mathf.Clamp01(Mathf.Abs(vectorAction[0]) + Mathf.Abs(vectorAction[1]));


        //prevDistance = distToPlayer;
        prevHP = self.curHP;
        prevPlayerHP = rival.curHP;


        self.FixedTick(delta);

        //score and punishments

        
        //hitting rival
        if (prevPlayerHP > rival.curHP)
        {
            AddReward(.8f);
        }
        //getting hit
        if (prevHP > self.curHP)
        {
            AddReward(-.6f);
        }
        //block


        //distance
        //getting closer reward
        if (distToPlayer > 2.0f)
        {
            if (prevDistance > distToPlayer)
            {
                AddReward(.015f);

                
            }
            //punish for getting farther
            if (prevDistance < distToPlayer)
            {
                AddReward(-.03f);
            }
        }
        else
        {
            if (rival.inAction && self.isBlocking)
            {
                AddReward(0.05f);
            }
            AddReward(.001f);
        }

        

        ////speed
        //if (distToPlayer < self.slowingRadius)
        //{
        //    if (distToPlayer < self.stopRadius)
        //    {
        //        if (moveAmount < .2f)
        //        {
        //            AddReward(0.1f);
        //            score += .1f;
        //        }
        //        else
        //        {
        //            AddReward(-0.001f);
        //            score -= .001f;
        //        }
        //    }
        //    else
        //    {
        //        if (moveAmount < .8f && moveAmount > .2f)
        //        {
        //            AddReward(0.1f);
        //            score += .1f;
        //        }
        //        else
        //        {
        //            AddReward(-0.001f);
        //            score -= .001f;
        //        }
        //    }
        //}

        //angle = Mathf.Abs(angle);
        if (lookDirAngle < 20 && lookDirAngle > -20)
        {
            AddReward(.001f);
        }
        else
        {
            AddReward(-.005f);
        }


        //objective reached
        if (rival.curHP <= 0)
        {
            AddReward(1.0f);
            Done();
        }
        prevDistance = distToPlayer;
    }
}
