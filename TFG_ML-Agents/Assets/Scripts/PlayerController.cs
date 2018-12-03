using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    [Header("Player info")]
    public float maxHP = 150;
    public float curHP;
    public float maxStamina = 100;
    public float curStamina;

    [Header("Init")]
    public GameObject activeModel;
    public CameraManager camManager;
    public GameObject weapon;
    public GameObject wCollider;
    public Animator anim;
    public Rigidbody rigidBody;
    public string[] ligthAttacks;
    public string[] heavyAttacks;

    int laCount, haCount;

    [HideInInspector]
    public float vertical, horizontal,moveAmount;
    [HideInInspector]
    public bool rt, rb, lt, lb, itemInput;
    [HideInInspector]
    public Vector3 moveDir;
    [HideInInspector]
    public float moveSpeed = 3.5f,runSpeed = 5, rotateSpeed = 5.0f, distanceToGround = 0.5f;

    [Header("Player States")]
    public bool running = false;
    public bool inAction;
    public bool canMove;
    public bool usingItem;
    public bool isBlocking;
   
    [HideInInspector]
    public float delta;
    [HideInInspector]
    public LayerMask ignoreLayers;
    [HideInInspector]
    public float targetSpeed;
    float _actionDelay;
    float attackTime;
           // Use this for initialization
    public void Init () {
        curHP = maxHP;
        curStamina = maxStamina;
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
        weapon.SetActive(!usingItem);


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

        if (!canMove)
        {
            attackTime += delta;
            if (attackTime > 3) attackTime = 0;
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

        //string targetAnim = "bestus";

        //if (string.IsNullOrEmpty(targetAnim))
           // return;

        usingItem = true;
        anim.SetBool("item", usingItem);
        //anim.CrossFade(targetAnim, 0.2f);
    }

    public void DetectAction()
    {
        if (running) isBlocking = false;
        if (!canMove || usingItem) return;

        if (!rb && !rt && !lb && !lt)
        {
            return;
        }

        string targetAnim = null;

        if (rb && canMove)
        {
            targetAnim = ligthAttacks[laCount];
            laCount++;
            laCount = laCount % 3;
           // canMove = false;
        }

        if (rt && canMove)
        {
            targetAnim = heavyAttacks[haCount];
            haCount++;
            haCount = haCount % 2;
            //canMove = false;
        }

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

    public void OpenDamageColliders()
    {
        Debug.Log("open");
        wCollider.SetActive(true);
    }

    public void CloseDamageColliders()
    {
        wCollider.SetActive(false);
        canMove = true;
    }
}
