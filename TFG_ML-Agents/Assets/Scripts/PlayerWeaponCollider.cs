using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerWeaponCollider : MonoBehaviour
{
    void OnTriggerEnter(Collider other)
    {
     
        EnemyController enemy = other.transform.GetComponentInParent<EnemyController>();
        PlayerController player = GetComponentInParent<PlayerController>();
        if (enemy == null)
        {
            return;
        }
        if (player.hardAttack) enemy.DoDamage(15);

        else enemy.DoDamage(8);
        
    }
}
