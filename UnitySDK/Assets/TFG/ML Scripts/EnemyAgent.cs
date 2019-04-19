using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;


public class EnemyAgent : Agent
{

    public EnemyController self;
    public BaseCharacter rival;
    public GameObject Arena;

    float prevHP;
    float prevPlayerHP;
    public float prevDistance;
    float delta;
    public float angle;
    public float moveAmount;
    int max = 20, min = -20, area = 23;
    float distance;

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

        //agent new pos
        float x = Random.Range(Arena.transform.position.x + min, Arena.transform.position.x + max);
        float z = Random.Range(Arena.transform.position.z + min, Arena.transform.position.z + max);
        self.transform.position = new Vector3(x, self.transform.position.y, z);
        float newAngle = Random.Range(0, 360);
        self.trans.rotation = Quaternion.Euler(0, newAngle, 0);

        //new distance
        prevDistance = Vector3.Distance(self.transform.position,
                                                rival.transform.position);
    }

    public override void CollectObservations()
    {
        Vector3 relativePosition = rival.transform.position - self.transform.position;
        Vector3 lookDir = self.transform.forward;
        float lookDirAngle = Vector3.SignedAngle(lookDir, relativePosition, Vector3.up);
        distance = Vector3.Distance(rival.transform.position, self.transform.position);

        //look angle diference
        AddVectorObs(lookDirAngle);
        AddVectorObs(distance);
        AddVectorObs(prevDistance);

        //stats
        AddVectorObs(self.curHP);
        AddVectorObs(self.currStam);
        AddVectorObs(self.isBlocking);
        AddVectorObs(rival.inAction);
        AddVectorObs(self.moveAmount);
        AddVectorObs(self.rt);
        AddVectorObs(self.rb);
        AddVectorObs(self.lb);

        AddVectorObs(rival.curHP);
        AddVectorObs(rival.isBlocking);
        AddVectorObs(rival.inAction);
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
        
        moveAmount = Mathf.Clamp01(Mathf.Abs(vectorAction[0]) + Mathf.Abs(vectorAction[1]));


        //update agent
        prevHP = self.curHP;
        prevPlayerHP = rival.curHP;
        self.FixedTick(delta);

        //score and punishments

        //getting hit
        if (prevHP > self.curHP)
        {
            AddReward(-.5f);
            prevHP = self.curHP;
        }
        //hitting rival
        if (prevPlayerHP > rival.curHP)
        {
            AddReward(.75f);
            prevPlayerHP = rival.curHP;
        }

        //objective reached
        if (rival.curHP <= 0)
        {
            AddReward(1.0f);
            Done();
        }
        //Death
        if (self.curHP <= 0)
        {
            AddReward(-1.0f);
            Done();
        }

        if(distance > 2)
        {
            if(prevDistance > distance)
            {
                AddReward(0.1f);             
            }
            if (prevDistance < distance)
            {
                AddReward(-0.1f);
            }
        }
        prevDistance = distance;


    }
}

