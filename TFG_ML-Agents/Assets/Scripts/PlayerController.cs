using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    [Header("Init")]
    public GameObject activeModel;

    [Header("Inputs")]
    public float vertical;
    public float horizontal;
    public float moveAmount;
    public bool rt, rb, lt, lb;
    public bool itemInput;
    public Vector3 moveDir;

    [Header("Stats")]
    public float moveSpeed = 2;
    public float runSpeed = 3.5f;
    public float rotateSpeed = 5.0f;
    public float distanceToGround = 0.5f;

    [Header("States")]
    public bool run = false;
    public bool inAction;
    public bool canMove;
    public bool usingItem;

    [Header("Other")]
    //public EnemyTarget lockOnTarget;


    [HideInInspector]
    public Animator anim;
    [HideInInspector]
    public Rigidbody rigidBody;
    

    [HideInInspector]
    public float delta;
    [HideInInspector]
    public LayerMask ignoreLayers;

    // Use this for initialization
    public void Init () {
		
	}
	
	// Update is called once per frame
	void SetupAnimator () {
		
	}

    public void FixedTick(float d)
    {

    }

    public void DetectItemAction()
    {

    }

    public void DetectAction()
    {

    }

    public void Tick(float d)
    {

    }

    void HandleMovementAnimations()
    {
        anim.SetBool("run", run);
        anim.SetFloat("vertical", moveAmount, 0.4f, delta);
    }

    void HandleLockOnAnimations(Vector3 moveDir)
    {
        Vector3 relativeDir = transform.InverseTransformDirection(moveDir);
        float h = relativeDir.x;
        float v = relativeDir.z;

        anim.SetFloat("vertical", v, .2f, delta);
        anim.SetFloat("horizontal", h, .2f, delta);
    }
}
