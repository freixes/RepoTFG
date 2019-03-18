using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MLAgents;

public class BaseCharacter : MonoBehaviour
{


    public float vertical, horizontal;
    public float rotateSpeed = 3.0f; //cam rotation
    public bool rt, rb, lb;

    public float maxHP = 150, curHP;
    public float maxStam = 100, currStam;
    public float recSpeed = 5;
    public float moveSpeed = 3.5f;
    public int slowingRadius = 5;
    public float stopRadius = 1.5f;

    public GameObject wCollider;


    public AnimationEvents animEvents;
    public GameObject activeModel;
    public Animator anim;
    public Rigidbody rigidBody;

    public float moveAmount;
    public Vector3 moveDir;


    
    public bool inAction;
    public bool canMove;
    public bool usingItem;
    public bool isBlocking;
    public bool isInvincible;
    public bool hardAttack;
    public bool isDead;

    public bool regenStam;
    public float regenStam_count = 0;
    public float regenTime = 3;


    public string[] ligthAttacks;
    public string[] heavyAttacks;
    public int laCount, haCount;
    public float attackTime, resetAtackCount = 3;
    // Start is called before the first frame update
    protected virtual void Start()
    {
        curHP = maxHP;
        currStam = maxStam;

        SetUpAnimator();

        rigidBody = GetComponent<Rigidbody>();
        rigidBody.angularDrag = 999;
        rigidBody.drag = 4;
        rigidBody.constraints = RigidbodyConstraints.FreezeRotationX | RigidbodyConstraints.FreezeRotationZ;

        animEvents = activeModel.AddComponent<AnimationEvents>();

        canMove = true;
    }

    // Update is called once per frame
    void Update()
    {
        //delta = Time.deltaTime;
        //canMove = anim.GetBool("canMove");

        if (curHP <= 0)
        {
            if (!isDead)
            {
                isDead = true;
            }
        }

        //if (isInvincible)
        //{
        //    isInvincible = !canMove;

        //}
        if (canMove) anim.applyRootMotion = false;
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

    public void OpenDamageColliders()
    {

        wCollider.SetActive(true);
        //canMove = true;

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
        canMove = false;
        inAction = false;
        anim.Play("damage");
        anim.applyRootMotion = true;
        anim.SetBool("canMove", false);
    }

    public void SetBlockingState()
    {
        isBlocking = true;
    }
}
