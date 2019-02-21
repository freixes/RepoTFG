using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Variables
{

    //conditions
    static public int coneAngle = 10;
    static public float minDistToPlayer = 3.0f;

    //Rewards
    static public float closerReward = 0.3f;
    static public float fartherReward = -0.7f;
    static public float dyingReward = -1.0f;
    static public float objectiveReward = 1.0f;
    static public float hardAttackReward = 0.5f;
    static public float lightAttackReward = 0.25f;
    static public float hardDamageReward = -0.5f;
    static public float lightDamageReward = -0.25f;
    static public float lookingRivalReward = 0.5f;
    static public float notLookingRivalReward = -0.5f;

}
