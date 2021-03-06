﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : BaseCharacter {

    //inputs

    public float c_h;
    float lookAngle; //cam rotation
   
    public Transform trans;
   
    public GameObject player;
   
    public float delta;
    // Use this for initialization

    protected override void Start()
    {
        base.Start();
        trans = GetComponent<Transform>().transform;

        animEvents.Init(null, this);
    }

    public void FixedTick(float d)
    {      
        activeModel.transform.localPosition = new Vector3(0, 0, 0);
        activeModel.transform.localRotation = Quaternion.Euler(0, 0, 0);
        delta = d;

        if (!regenStam && !inAction) regenStam_count += delta;
        if (regenStam_count > regenTime)
        {
            regenStam_count = 0;
            regenStam = true;
        }

        isBlocking = lb;
        //else isBlocking = false;
        
        if (currStam < maxStam && !inAction && regenStam) currStam += delta * recSpeed;

        if (inAction)
        {
            anim.applyRootMotion = true;
            canMove = false;
            return;
        }
        else
        {
            canMove = true;
        }

        DetectAction();

        if (isInvincible) isInvincible = !canMove;

        if (!inAction)
        {
            attackTime += delta;
            if (attackTime > resetAtackCount)
            {
                attackTime = 0;
                laCount = 0;
                haCount = 0;
            }
        }
        
        anim.applyRootMotion = false;
        rigidBody.drag = (vertical != 0 || horizontal != 0) ? 0 : 4;

        lookAngle += c_h * rotateSpeed;
        lookAngle = lookAngle % 360;
        trans.rotation = Quaternion.Euler(0, lookAngle, 0);

        if (!inAction && canMove)
        {
            Vector3 v = vertical * transform.forward;
            Vector3 h = horizontal * transform.right;
            moveDir = (v + h).normalized;

            float m = Mathf.Abs(horizontal) + Mathf.Abs(vertical);
            moveAmount = Mathf.Clamp01(m);
            rigidBody.velocity = moveDir * (moveSpeed * moveAmount);
        }

        anim.SetBool("isBlocking", lb);

        if (canMove)
        {
            inAction = false;
            anim.SetFloat("vertical", moveAmount, 0.2f, delta); 
            anim.SetFloat("horizontal", moveAmount, .2f, delta);
        }
    }




    public void DetectAction()
    {
        
        if (!canMove ) return;

        if (!rb && !rt && !lb )
        {
            return;
        }

        if (inAction) isBlocking = false;

        string targetAnim = null;

        if (rb && !inAction && currStam >= 10)
        {
            attackTime = 0;
            hardAttack = false;
            inAction = true;
            regenStam = false;
            canMove = false;
            targetAnim = ligthAttacks[laCount];
            laCount++;
            laCount = laCount % 3;
            currStam -= 10;
        }

        if (rt && !inAction && currStam >= 20)
        {
            attackTime = 0;
            hardAttack = true;
            inAction = true;
            regenStam = false;
            canMove = false;
            targetAnim = heavyAttacks[haCount];
            haCount++;
            haCount = haCount % 2;
            currStam -= 20;         
        }

        if (string.IsNullOrEmpty(targetAnim))
            return;
       
        anim.SetBool("inAction", inAction);
        anim.CrossFade(targetAnim, 0.2f);       
    }




    
}
