using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseCharacter : MonoBehaviour
{


    public float vertical, horizontal;
    public float rotateSpeed = 5.0f; //cam rotation
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


    public bool running = false;
    public bool inAction;
    public bool canMove;
    public bool usingItem;
    public bool isBlocking;
    public bool isInvincible;
    public bool hardAttack;

    public bool regenStam;
    public float regenStam_count = 0;
    public float regenTime = 3;
    // Start is called before the first frame update
    void Start()
    {
        curHP = maxHP;
        currStam = maxStam;

        SetUpAnimator();

        rigidBody = GetComponent<Rigidbody>();
        rigidBody.angularDrag = 999;
        rigidBody.drag = 4;
        rigidBody.constraints = RigidbodyConstraints.FreezeRotationX | RigidbodyConstraints.FreezeRotationZ;

        animEvents = activeModel.AddComponent<AnimationEvents>();
   
   
    }

    // Update is called once per frame
    void Update()
    {
        
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
}
