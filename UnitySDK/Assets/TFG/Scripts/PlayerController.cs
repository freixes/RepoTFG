using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : BaseCharacter {

    [Header("Player info")]
    public float runStam = 7;
    

    [Header("Init")]
  
    public CameraManager camManager;
    public GameObject weapon;
   
    
    [HideInInspector]
    public bool lt, itemInput;

    [HideInInspector]
    public float runSpeed = 5, distanceToGround = 0.5f;

    [Header("Player States")]
    public bool running = false;
    

    

    [HideInInspector]
    public float delta;
    [HideInInspector]
    public LayerMask ignoreLayers;
    [HideInInspector]
    public float targetSpeed;
    float _actionDelay;
    
           // Use this for initialization
    public void Init () {
        base.Start();
        gameObject.layer = 8;
        ignoreLayers = ~(1 << 9);
        animEvents.Init(this, null);
    }
	
	

    public void FixedTick(float d)
    {
        delta = d;

        if (!regenStam) regenStam_count += delta;
        if (regenStam_count > regenTime) {
            regenStam_count = 0;
            regenStam = true;
        }
        
        if (currStam < maxStam && !inAction && !running && regenStam) currStam += delta * recSpeed;
        
        usingItem = anim.GetBool("item");
        weapon.SetActive(!usingItem);

        DetectItemAction();
        DetectAction();

        if (inAction)
        {
            anim.applyRootMotion = true;
            canMove = false;
            return;

        }

        //canMove = anim.GetBool("canMove");

        if (isInvincible)
        {
            isInvincible = !canMove;

        }

        if (!canMove)
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
        rigidBody.drag = (moveAmount > 0) ? 0 : 4;

        targetSpeed = moveSpeed;

        if (running)
        {
            camManager.lockOn = false;
            targetSpeed = runSpeed;
        }

        if (!inAction && canMove)
        {
            rigidBody.velocity = moveDir * (targetSpeed * moveAmount);
            Vector3 targetDir = (camManager.lockOn == false) ?
                moveDir : camManager.lockOnTarget.transform.position - transform.position;
            targetDir.y = 0;
            if (targetDir == Vector3.zero) targetDir = transform.forward;
            Quaternion tr = Quaternion.LookRotation(targetDir);
            Quaternion targetRotation = Quaternion.Slerp(transform.rotation, tr, delta * moveAmount * rotateSpeed);
            transform.rotation = targetRotation;
        }

        anim.SetBool("lockOn", camManager.lockOn);
        anim.SetBool("running", running);
        anim.SetBool("isBlocking", isBlocking);

        if (!camManager.lockOn)
        {
            
            HandleMovementAnimations();
        }
        else
        {
            HandleLockOnAnimations(moveDir);
        }
    }

    public void DetectItemAction()
    {
        if (usingItem)
        {
            isBlocking = false;
            running = false;
        }
        
        if (!canMove || usingItem) return;

        if (!itemInput) return;

        usingItem = true;
        anim.SetBool("item", usingItem);
        
    }

    public void DetectAction()
    {
        if (running)
        {
            isBlocking = false;
            currStam -= delta*runStam;
        }
        if (!canMove /*|| usingItem*/) return;

        if (!rb && !rt && !lb && !lt)
        {
            return;
        }
        if (inAction) isBlocking = false;

        string targetAnim = null;

        if (rb && !inAction && currStam >=10)
        {
            hardAttack = false;
            inAction = true;
            regenStam = false;
            targetAnim = ligthAttacks[laCount];
            laCount++;
            laCount = laCount % 3;
            canMove = false;
            currStam -= 10; 
        }

        if (rt && !inAction && currStam >= 20)
        {
            hardAttack = true;
            inAction = true;
            regenStam = false;
            targetAnim = heavyAttacks[haCount];
            haCount++;
            haCount = haCount % 2;
            canMove = false;
            currStam -= 20;
        }

        if (string.IsNullOrEmpty(targetAnim))
            return;

        
        anim.SetBool("inAction", inAction);
        anim.CrossFade(targetAnim, 0.2f);
        //canMove = false;
        //inAction = true;
    }

    public void Tick(float d)
    {
        delta = d;
    }

    void HandleMovementAnimations()
    {
        if (canMove) {
            anim.SetFloat("vertical", moveAmount, 0.2f, delta);
            anim.SetFloat("horizontal", moveAmount, .2f, delta);
        }
        

    }

    void HandleLockOnAnimations(Vector3 moveDir)
    {
        if (canMove) { 
        Vector3 relativeDir = transform.InverseTransformDirection(moveDir);
        float h = relativeDir.x;
        float v = relativeDir.z;

        anim.SetFloat("vertical", v, .2f, delta);
        anim.SetFloat("horizontal", h, .2f, delta);
        }
    }

 
}
