using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour {


    public Transform transform;
    public GameObject wCollider;
    public bool isDead;
    public bool canMove;
    public float maxHP = 150, curHP;
    public float maxStam = 100, currStam; 
    public AnimationEvents animEvents;
    public GameObject activeModel;
    public Animator anim;
    public bool isInvincible;
    public bool isBlocking;
    public bool hardAttack;

    [HideInInspector]
    public bool inAction;
    // Use this for initialization
    void Start () {
        transform = GetComponent<Transform>().transform;
        curHP = maxHP;
        currStam = maxStam;

        SetUpAnimator();

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
        canMove = true;
        inAction = false;
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
        anim.applyRootMotion = true;
        anim.SetBool("canMove", false);
    }
}
