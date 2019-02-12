using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : BaseCharacter {

    //inputs
   
    public float c_h, lookAngle; //cam rotation
   
    public Transform trans;
   
    public GameObject player;

    
    public float delta;
    public float dist;
    // Use this for initialization

    protected override void Start () {
        base.Start();
        trans = GetComponent<Transform>().transform;
        
        animEvents.Init(null, this);
       
    }
	
	// Update is called once per frame
	void Update () {
        
    }


    public void FixedTick(float d)
    {

        dist = Vector3.Distance(trans.position, player.transform.position);
        activeModel.transform.localPosition = new Vector3(0, 0, 0);
        activeModel.transform.localRotation = Quaternion.Euler(0, 0, 0);
        delta = d;

        //STAMINA REGENERATION
        if (!regenStam && !inAction) regenStam_count += delta;
        if (regenStam_count > regenTime)
        {
            regenStam_count = 0;
            regenStam = true;
        }
        if (currStam < maxStam && !inAction && regenStam) currStam += delta * recSpeed;


        isBlocking = lb;

        if (inAction)
        {
            anim.applyRootMotion = true;
            canMove = false;
            if (inAction) isBlocking = false;
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
            return;
        }
        
        anim.applyRootMotion = false;
        rigidBody.drag = (vertical != 0 || horizontal != 0) ? 0 : 4;

        //ROTATE CHARACTER
        lookAngle += c_h * rotateSpeed;
        lookAngle=lookAngle % 360;
        trans.rotation = Quaternion.Euler(0, lookAngle, 0);
        
        //MOVEMENT
        if (!inAction && canMove)
        {
            Vector3 v = vertical * transform.forward;
            Vector3 h = horizontal * transform.right;
            moveDir = (v + h).normalized;

            float m = Mathf.Abs(horizontal) + Mathf.Abs(vertical);
            moveAmount = Mathf.Clamp01(m);
            rigidBody.velocity = moveDir * (moveSpeed * moveAmount);
        }

        

        if (canMove)
        {
            inAction = false;
            anim.SetFloat("vertical", vertical, 0.2f, delta);
            anim.SetFloat("horizontal", horizontal, .2f, delta);
        }

    }




    public void DetectAction()
    {
        
        if (!canMove ) return;

        if (!rb && !rt && !lb )
        {
            return;
        }

        string targetAnim = null;

        if (rb && !inAction && currStam >= 10)
        {
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
