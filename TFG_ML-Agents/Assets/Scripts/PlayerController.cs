using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    [Header("Init")]
    public GameObject activeModel;
    public CameraManager camManager;

    [Header("Inputs")]
    public float vertical;
    public float horizontal;
    public float moveAmount;
    public bool rt, rb, lt, lb;
    public bool itemInput;
    public Vector3 moveDir;

    [Header("Stats")]
    public float moveSpeed = 5;
    public float runSpeed = 8;
    public float rotateSpeed = 5.0f;
    public float distanceToGround = 0.5f;

    [Header("Player States")]
    public bool running = false;
    public bool inAction;
    public bool canMove;
    public bool usingItem;

    
    public Animator anim;
    public Rigidbody rigidBody;
    

    [HideInInspector]
    public float delta;
    [HideInInspector]
    public LayerMask ignoreLayers;


    public float targetSpeed;
    float _actionDelay;

           // Use this for initialization
    public void Init () {
        SetUpAnimator();
        rigidBody = GetComponent<Rigidbody>();
        rigidBody.angularDrag = 999;
        rigidBody.drag = 4;
        rigidBody.constraints = RigidbodyConstraints.FreezeRotationX | RigidbodyConstraints.FreezeRotationZ;

        gameObject.layer = 8;
        ignoreLayers = ~(1 << 9);
        
    }
	
	// Update is called once per frame
	void SetUpAnimator () {
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

    public void FixedTick(float d)
    {
        delta = d;

        usingItem = anim.GetBool("item");

        DetectItemAction();
        DetectAction();

        if (inAction)
        {
            anim.applyRootMotion = true;
            _actionDelay += delta;

            if (_actionDelay > .3f)
            {
                inAction = false;
                _actionDelay = 0.0f;
            }
            else
            {
                return;
            }

        }

        canMove = anim.GetBool("canMove");

        if (!canMove) return;

        anim.applyRootMotion = false;
        rigidBody.drag = (moveAmount > 0) ? 0 : 4;

        targetSpeed = moveSpeed;

        if (running)
        {
            camManager.lockOn = false;
            targetSpeed = runSpeed;
        }

        rigidBody.velocity = moveDir * (targetSpeed * moveAmount);

        Vector3 targetDir = (camManager.lockOn == false) ?
            moveDir : camManager.lockOnTarget.transform.position - transform.position;
        targetDir.y = 0;
        if (targetDir == Vector3.zero) targetDir = transform.forward;
        Quaternion tr = Quaternion.LookRotation(targetDir);
        Quaternion targetRotation = Quaternion.Slerp(transform.rotation, tr, delta * moveAmount * rotateSpeed);
        transform.rotation = targetRotation;

        anim.SetBool("lockOn", camManager.lockOn);
        anim.SetBool("running", running);
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
        
        if (!canMove || usingItem) return;

        if (!itemInput) return;

        string targetAnim = "bestus";

        if (string.IsNullOrEmpty(targetAnim))
            return;

        usingItem = true;
        anim.SetBool("item", usingItem);
        anim.CrossFade(targetAnim, 0.2f);
    }

    public void DetectAction()
    {
        if (!canMove || usingItem) return;

        if (!rb && !rt && !lb && !lt)
        {
            return;
        }

        string targetAnim = null;

       // Action slot = actionManager.GetActionSlot(this);
        //if (slot == null) return;
        //targetAnim = slot.targetAnimation;

        if (string.IsNullOrEmpty(targetAnim))
            return;

        canMove = false;
        inAction = true;
        anim.CrossFade(targetAnim, 0.2f);
    }

    public void Tick(float d)
    {
        delta = d;
    }

    void HandleMovementAnimations()
    {

        anim.SetFloat("vertical", moveAmount, 0.2f, delta);
        anim.SetFloat("horizontal", moveAmount, .2f, delta);

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
