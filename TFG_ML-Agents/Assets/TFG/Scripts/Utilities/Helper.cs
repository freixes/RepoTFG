using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Helper : MonoBehaviour {

    [Range(-1, 1)]
    public float vertical;
    [Range(-1, 1)]
    public float horizontal;

    //public string animName;
    public bool playAnim;
    public string[] oh_attacks;

    public bool enableRootMotion;
    public bool lockon;
    public bool canMove;
    public bool isBlocking;
    public bool running;
    public bool item;

    Animator anim;

    // Use this for initialization
    void Start()
    {
        anim = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        if (playAnim)
        {
            string targetAnim;
            int r = Random.Range(0, oh_attacks.Length);
            targetAnim = oh_attacks[r];

            vertical = 0;
            anim.CrossFade(targetAnim, 0.2f);
            //anim.SetBool("canMove", false);
            //enableRootMotion = true;
            playAnim = false;

        }
        anim.SetFloat("vertical", vertical);
        anim.SetFloat("horizontal", horizontal);
        anim.SetBool("canMove", canMove);
        anim.SetBool("lockOn", lockon);
        anim.SetBool("running", running);
        anim.SetBool("item", item);
        anim.SetBool("isBlocking", isBlocking);


    }
}
