using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;


public class EnemyAgentIL : Agent
{

    public EnemyController self;
    public BaseCharacter rival;
    public GameObject Arena;

    float prevHP, prevStam;
    float prevRivalHP;
    public float prevDistance;
    float delta;
    public float moveAmount;
    int max = 20, min = -20, area;


    Vector3 initPos;
    Vector3 playerInitPos;
    // Start is called before the first frame update
    void Start()
    {
        area = 2 * max;
    }

    private void Update()
    {
        
    }

    public override void AgentReset()
    {
        self.curHP = self.maxHP;
        self.currStam = self.maxStam;
        prevHP = self.curHP;

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
        float distance = Vector3.Distance(rival.transform.position, self.transform.position);
        
        //AddVectorObs(distance);      
        //look angle diference
        AddVectorObs(lookDirAngle);
        AddVectorObs(relativePosition.x / area);
        AddVectorObs(relativePosition.y / area);
        AddVectorObs(distance);
        //stats
        AddVectorObs(self.curHP);
        AddVectorObs(prevHP);
        AddVectorObs(self.currStam);
        AddVectorObs(prevStam);

        AddVectorObs(rival.curHP);
        AddVectorObs(rival.isBlocking);
        AddVectorObs(rival.inAction);
        AddVectorObs(prevRivalHP);

    }

    public override void AgentAction(float[] vectorAction, string textAction)
    {
        delta = Time.fixedDeltaTime;
        float distToPlayer = Vector3.Distance(self.transform.position,
                                                rival.transform.position);

        Vector3 lookDir = self.transform.forward;
        Vector3 lookAtPlayer = rival.transform.position - self.transform.position;

        //actions to self stats
        self.horizontal = vectorAction[0]; //movement
        self.vertical = vectorAction[1];   //movement
        self.rt = vectorAction[2] == 1.0f ? true : false; //heavy attack
        self.rb = vectorAction[3] == 1.0f ? true : false; //light attack
        self.lb = vectorAction[4] == 1.0f ? true : false; //block
        self.c_h = vectorAction[5];  //rotation
        
        //prevDistance = distToPlayer;
        prevHP = self.curHP;
        prevStam = self.currStam;
        prevRivalHP = rival.curHP;


        self.FixedTick(delta);

        //objective reached
        if (rival.curHP <= 0 || self.curHP <= 0)
        {
            AgentReset();
        }
        prevDistance = distToPlayer;
    }
}
