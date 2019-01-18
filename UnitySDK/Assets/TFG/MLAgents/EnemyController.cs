using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour {

    //inputs
    public float vertical, horizontal;
    public float c_h, lookAngle, rotateSpeed = 5.0f; //cam rotation
    public bool rt, rb, lb;

    public float maxHP = 150, curHP;
    public float maxStam = 100, currStam;
    public float recSpeed = 5;
    public float moveSpeed = 3.5f;
    

    public Transform trans;
    public GameObject wCollider;
    
    
    public AnimationEvents animEvents;
    public GameObject activeModel;
    public Animator anim;
    public Rigidbody rigidBody;

    public GameObject player;

    [Header("Enemy States")]
    public bool isInvincible;
    public bool isBlocking;
    public bool isDead;
    public bool canMove;
    public bool hardAttack;
    public bool inAction;

    public bool regenStam;
    float regenStam_count = 0;
    public float regenTime = 3;

    //attack animations and combo counters
    public string[] ligthAttacks;
    public string[] heavyAttacks;
    int laCount, haCount;
    float attackTime, resetAtackCount = 3;

    public float moveAmount;
    public Vector3 moveDir;
    

    public float delta;

    // Use this for initialization
    void Start () {
        trans = GetComponent<Transform>().transform;
        curHP = maxHP;
        currStam = maxStam;

        SetUpAnimator();

        rigidBody = GetComponent<Rigidbody>();
        rigidBody.angularDrag = 999;
        rigidBody.drag = 4;
        rigidBody.constraints = RigidbodyConstraints.FreezeRotationX | RigidbodyConstraints.FreezeRotationZ;

        animEvents = activeModel.AddComponent<AnimationEvents>();
        animEvents.Init(null, this);
    }
	
	// Update is called once per frame
	void Update () {
        //delta = Time.deltaTime;
        canMove = anim.GetBool("canMove");

        if (curHP <= 0)
        {
            if (!isDead)
            {
                isDead = true;
            }
        }

        if (isInvincible)
        {
            isInvincible = !canMove;

        }
        if (canMove) anim.applyRootMotion = false;
    }


    public void FixedTick(float d)
    {
        delta = d;

        if (!regenStam) regenStam_count += delta;
        if (regenStam_count > 2)
        {
            regenStam_count = 0;
            regenStam = true;
        }

        if (!inAction) isBlocking = lb;
        else isBlocking = false;
        
        if (currStam < maxStam && !inAction && regenStam) currStam += delta * recSpeed;

        DetectAction();

        if (inAction)
        {
            anim.applyRootMotion = true;
        }

        canMove = anim.GetBool("canMove");

        if (isInvincible) isInvincible = !canMove;

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
        rigidBody.drag = (vertical != 0 || horizontal != 0) ? 0 : 4;


        /*
        if (running)
        {
            camManager.lockOn = false;
            targetSpeed = runSpeed;
        }
        */
        lookAngle += c_h * rotateSpeed;
        lookAngle=lookAngle % 360;
        trans.rotation = Quaternion.Euler(0, lookAngle, 0);

        if (!inAction && canMove)
        {
            //transform.LookAt(player.transform);
            Vector3 v = vertical * transform.forward;
            Vector3 h = horizontal * transform.right;
            moveDir = (v + h).normalized;

            float m = Mathf.Abs(horizontal) + Mathf.Abs(vertical);
            moveAmount = Mathf.Clamp01(m);
            rigidBody.velocity = transform.forward*(moveSpeed * moveAmount);
            /*
            Vector3 targetDir =  player.transform.position - transform.position;
            targetDir.y = 0;
            if (targetDir == Vector3.zero) targetDir = transform.forward;
            Quaternion tr = Quaternion.LookRotation(targetDir);
            Quaternion targetRotation = Quaternion.Slerp(transform.rotation, tr, delta * moveAmount * rotateSpeed);
            transform.rotation = targetRotation;*/
        }

        //anim.SetBool("lockOn", camManager.lockOn);
        //anim.SetBool("running", running);
        anim.SetBool("isBlocking", isBlocking);

        if (canMove)
        {
            anim.SetFloat("vertical", moveAmount, 0.2f, delta);
            anim.SetFloat("horizontal", moveAmount, .2f, delta);
        }

    }


    void SetUpAnimator()
    {
        if (activeModel == null)
        {
            anim = GetComponentInChildren<Animator>();
            if (anim = null)
            {
                Debug.Log("No model found");
            }
            else
            {
                activeModel = anim.gameObject;
            }
        }
        if (anim == null) anim = activeModel.GetComponent<Animator>();

        anim.applyRootMotion = false;
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
        
    }




    public void OpenDamageColliders()
    {

        wCollider.SetActive(true);
        canMove = true;
        
    }

    public void CloseDamageColliders()
    {

        wCollider.SetActive(false);
        canMove = true;
        inAction = false;
        anim.SetBool("inAction", inAction);
    }

    public void DoDamage(float v)
    {
        if (isInvincible || isDead || isBlocking) return;

        curHP -= v;
        isInvincible = true;
        anim.Play("damage");
        //anim.applyRootMotion = true;
        anim.SetBool("canMove", false);
    }
}
