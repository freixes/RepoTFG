using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerWeaponCollider : MonoBehaviour
{
    void OnTriggerEnter(Collider other)
    {
     
        BaseCharacter enemy = other.transform.GetComponentInParent<BaseCharacter>();
        PlayerController self = GetComponentInParent<PlayerController>();
        if (enemy == null)
        {
            return;
        }
        if (self.hardAttack) enemy.DoDamage(15);

        else enemy.DoDamage(8);
        
    }
}
