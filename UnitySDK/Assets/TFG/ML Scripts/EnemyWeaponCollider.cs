using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyWeaponCollider : MonoBehaviour
{
    void OnTriggerEnter(Collider other)
    {

        EnemyController self = GetComponentInParent<EnemyController>();
        BaseCharacter enemy = other.transform.GetComponentInParent<BaseCharacter>();
        if (enemy == null)
        {
            return;
        }
        if (self.hardAttack) enemy.DoDamage(15);

        else enemy.DoDamage(8);
    }
}
