using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Variables
{

    //conditions
    static public int coneAngle = 10;
    static public float minDistToPlayer = 3.0f;

    //Rewards
    //distance
    static public float closerReward = 0.7f;
    static public float fartherReward = -0.7f;
    //objectives
    static public float dyingReward = -1.0f;
    static public float objectiveReward = 1.0f;
    //attacks
    static public float hardAttackReward = 0.5f;
    static public float lightAttackReward = 0.25f;
    static public float hardDamageReward = -0.5f;
    static public float lightDamageReward = -0.25f;
    //facing player
    static public float facingRivalReward = 0.4f;
    static public float notFacingRivalReward = -0.4f;
    //blocking
    static public float blockingReward = 0.5f;
    static public float notBlockingReward = -0.5f;

}
