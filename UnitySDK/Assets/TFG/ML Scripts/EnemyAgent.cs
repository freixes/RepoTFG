using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;


public class EnemyAgent : Agent
{

    public EnemyController self;
    public BaseCharacter rival;
    public GameObject Arena;

    float prevHP, prevRivalHP;
    public float prevDistance;
    float delta;
    public float angle;
    
    int max = 20, min = -20, area = 23;
    public float score = 0;

    Vector3 initPos;
    Vector3 playerInitPos;

    float distToPlayer;
    public float moveDiff;
    Vector3 lookAtRival, lookDir, rivalOldPos;
    // Start is called before the first frame update
    void Start()
    {
        initPos = self.transform.position;
        playerInitPos = rival.transform.position;

    }

    public override void AgentReset()
    {
        self.curHP = self.maxHP;
        prevHP = self.curHP;
        self.currStam = self.maxStam;
        self.isDead = false;
        score = 0;

        //agent new pos and rotation
        float x = Random.Range(Arena.transform.position.x + min, Arena.transform.position.x + max);
        float z = Random.Range(Arena.transform.position.z + min, Arena.transform.position.z + max);
        self.transform.position = new Vector3(x, self.transform.position.y, z);
        float newAngle = Random.Range(0, 360);
        self.trans.rotation = Quaternion.Euler(0, newAngle, 0);

        //new distance
        prevDistance = Vector3.Distance(self.transform.position,
                                                rival.transform.position);
        rivalOldPos = rival.transform.position;
    }

    public override void CollectObservations()
    { 
        distToPlayer = Vector3.Distance(self.transform.position, rivalOldPos);

        lookAtRival = rival.transform.position - self.transform.position;
        lookDir = self.transform.forward;
        angle = Vector3.SignedAngle(lookDir, lookAtRival, Vector3.up);

        //look angle diference
        AddVectorObs(angle);
        AddVectorObs(distToPlayer);//distance
        AddVectorObs(moveDiff);
        AddVectorObs(self.vertical);//agent stats
        AddVectorObs(self.horizontal);
        AddVectorObs(self.curHP);
        AddVectorObs(prevHP);
        AddVectorObs(self.isBlocking);   
        AddVectorObs(self.hardAttack);
        AddVectorObs(rival.curHP);//enemy stats
        AddVectorObs(rival.isBlocking);
        AddVectorObs(rival.hardAttack);
        AddVectorObs(prevRivalHP);




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
        
        //prevDistance = distToPlayer;
        prevHP = self.curHP;
        prevRivalHP = rival.curHP;

        //Update character
        self.FixedTick(delta);

        //Rewards
        DistanceRewards();
        DamageRewards();
        BlockingRewards();
        FacingPlayerRewards();
        ObjectiveReachedRewards();

    }



    void DamageRewards()
    {
        //hitting rival
        if (rival.curHP < prevRivalHP && self.hardAttack) //hard attack
        {
            AddReward(Variables.hardAttackReward);
            score += Variables.hardAttackReward;
            prevRivalHP = rival.curHP;
        }

        if (rival.curHP < prevRivalHP && !self.hardAttack) //light attack
        {
            AddReward(Variables.lightAttackReward);
            score += Variables.lightAttackReward;
            prevRivalHP = rival.curHP;
        }

        //getting hit
        if (self.curHP < prevHP && rival.hardAttack) //hard attack
        {
            AddReward(Variables.hardDamageReward);
            score += Variables.hardDamageReward;
            prevHP = self.curHP;
        }

        if (self.curHP < prevHP && !rival.hardAttack) //light attack
        {
            AddReward(Variables.lightDamageReward);
            score += Variables.lightDamageReward;
            prevHP = self.curHP;
        }

    }

    void DistanceRewards()
    {        
        moveDiff = prevDistance - distToPlayer;
        moveDiff = Mathf.Clamp(moveDiff, -1.0f, 1.0f);

        AddReward(moveDiff);
        score = score + moveDiff;

        rivalOldPos = rival.transform.position;
    }

    void FacingPlayerRewards()
    {
        if (angle < 20 && angle > -20)
        {
            AddReward(Variables.facingRivalReward);
            score += Variables.facingRivalReward;
        }
        else
        {
            AddReward(Variables.notFacingRivalReward);
            score += Variables.notFacingRivalReward;
        }
    }

    void BlockingRewards()
    {
        if (rival.inAction && self.isBlocking)
        {
            AddReward(Variables.blockingReward);
            score += Variables.blockingReward;
        }
        if (rival.inAction && !self.isBlocking)
        {
            AddReward(Variables.notBlockingReward);
            score += Variables.notBlockingReward;
        }
    }

    void ObjectiveReachedRewards()
    {
        if (rival.curHP <= 0)
        {
            AddReward(Variables.objectiveReward);
            score += Variables.objectiveReward;
            Done();
        }
        if (self.curHP <= 0)
        {
            AddReward(Variables.dyingReward);
            score += Variables.dyingReward;
            Done();
        }
    }

}