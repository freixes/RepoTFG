using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;


public class EnemyAgent : Agent {

    public EnemyController self;
    public BaseCharacter rival;
    public GameObject Arena;

    float prevHP;
    float prevPlayerHP;
    public float prevDistance;
    float delta;
    public float angle;
    public float maxAngle = 30;
    public float moveAmount;
    int max = 20, min = -20, area= 23;
    public float score = 0;


    Vector3 initPos;
    Vector3 playerInitPos;
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
        self.isDead = false;
        rival.isDead = false;
        score = 0;

        //agent new pos
        float x = Random.Range(Arena.transform.position.x + min, Arena.transform.position.x + max);
        float z = Random.Range(Arena.transform.position.z + min, Arena.transform.position.z + max);
        self.transform.position = new Vector3(x,self.transform.position.y, z);
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
        float lookDirAngle = Vector3.SignedAngle(lookDir, relativePosition, Vector3.up);
        float distToPlayer = Vector3.Distance(self.transform.position,
                                                 rival.transform.position);
        
        AddVectorObs(lookDirAngle);
        AddVectorObs(distToPlayer);

        //relative pos to rival
        //floor plane 100x100
        AddVectorObs(relativePosition.x / area);
        AddVectorObs(relativePosition.z / area);

        //stats
        AddVectorObs(self.curHP);
        AddVectorObs(self.currStam);
        AddVectorObs(self.isBlocking);
        AddVectorObs(self.moveAmount);

        AddVectorObs(rival.curHP);
        AddVectorObs(rival.isBlocking);
        AddVectorObs(prevHP);
        AddVectorObs(prevPlayerHP);




    }

    public override void AgentAction(float[] vectorAction, string textAction)
    {
        delta = Time.fixedDeltaTime;
        float distToPlayer = Vector3.Distance(self.transform.position,
                                                rival.transform.position);
        
        Vector3 lookDir = self.transform.forward;
        Vector3 lookAtPlayer = rival.transform.position - self.transform.position;

        angle = Vector3.SignedAngle(lookDir, lookAtPlayer, Vector3.up);
        
        
        //actions to self stats
        self.horizontal = vectorAction[0]; //movement
        self.vertical = vectorAction[1];   //movement
        self.rt = vectorAction[2] == 1.0f ? true : false; //heavy attack
        self.rb = vectorAction[3] == 1.0f ? true : false; //light attack
        self.lb = vectorAction[4] == 1.0f ? true : false; //block
        self.c_h = vectorAction[5];  //rotation
        //if(vectorAction[5] < 0.05f && vectorAction[5] > -0.05f)
        //{
        //    self.c_h = 0;
        //}

        moveAmount = Mathf.Clamp01(Mathf.Abs(vectorAction[0]) + Mathf.Abs(vectorAction[1]));
       

        //prevDistance = distToPlayer;
        prevHP = self.curHP;
        prevPlayerHP = rival.curHP;


        self.FixedTick(delta);
        
        //score and punishments

        //getting hit
        if (prevHP > self.curHP)
        {
            AddReward(-.8f);
            score += -.8f;
            prevHP = self.curHP;
            //Done();
        }
        //hitting rival
        if(prevPlayerHP > rival.curHP)
        {
            AddReward(.8f);
            score += .8f;
            prevPlayerHP = rival.curHP;
            //Done();
        }


        //distance
        //getting closer reward
        if (distToPlayer > 1.5f)
        {
            if (prevDistance > distToPlayer)
            {
                AddReward(.05f);
                score += .05f;
                prevDistance = distToPlayer;
                //Done();

            }
            //punish for getting farther
            if (prevDistance < distToPlayer)
            {
                AddReward(-.055f);
                score += -.055f;
                prevDistance = distToPlayer;
                //Done();
            }
        }
        else
        {
            AddReward(.0001f);
            score += .0001f;
        }

        if (rival.inAction && self.isBlocking)
        {
            AddReward(0.5f);
            score += 0.5f;
        }
        if (rival.inAction && !self.isBlocking)
        {
            AddReward(-0.5f);
            score += -0.5f;
        }




        //speed
        if (distToPlayer < self.slowingRadius)
        {
            if (distToPlayer < self.stopRadius)
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
                if (moveAmount < .8f /*&& moveAmount > .2f*/)
                {
                    AddReward(0.25f);
                    score += .25f;
                }
                else
                {
                    AddReward(-0.001f);
                    score += -.001f;
                }
            }
        }

        //angle = Mathf.Abs(angle);
        if (angle < maxAngle && angle > -maxAngle)
        {
            AddReward(.3f);
            score += .3f;
            
        }
        else
        {
            AddReward(-.4f);
            score += -.4f;

        }


        //objective reached
        if (rival.curHP <= 0)
        {
            AddReward(1.0f);
            score += 1.0f;
            Done();
        }
        //Death
        if (self.curHP <= 0)
        {
            AddReward(-1.0f);
            score += -1.0f;
            Done();
        }

    }
}
