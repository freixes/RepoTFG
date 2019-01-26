using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimationEvents : MonoBehaviour {


    PlayerController player;
    EnemyController enemy;
    public void Init(PlayerController p, EnemyController e)
    {
        player = p;
        enemy = e;
    }

    public void OpenDamageColliders()
    {
        if(player != null) player.OpenDamageColliders();
        if (enemy != null) enemy.OpenDamageColliders();
    }

    public void CloseDamageColliders()
    {
        if (player != null) player.CloseDamageColliders();
        if (enemy != null) enemy.CloseDamageColliders();
    }

    public void SetBlockingState()
    {
        if (player != null) player.SetBlockingState(); 
        if (enemy != null) enemy.SetBlockingState();
    }
}
