using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InputHandler : MonoBehaviour {

    float vertical, horizontal;
    bool b_input, a_input, x_input, y_input;

    bool rb_input, rt_input, lb_input, lt_input;
    float rt_axis, lt_axis;

    bool leftAxis_down, rightAxis_down;

    float b_timer;
    float rt_timer;
    float lt_timer;

    public PlayerController pController;
    public CameraManager camController;

    float delta;


    void Start()
    {
        pController = GetComponent<PlayerController>();
        pController.Init();

        camController = CameraManager.singleton;
        camController.Init(this.transform);
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        delta = Time.fixedDeltaTime;
        GetInput();
        UpdateStates();
        pController.FixedTick(delta);
        camController.Tick(delta);

    }

    void Update()
    {
        delta = Time.deltaTime;
        pController.Tick(delta);
        ResetInputAndStates();
    }

    void GetInput()
    {
        vertical = Input.GetAxis("Vertical");
        horizontal = Input.GetAxis("Horizontal");

        rt_input = Input.GetButton("RT");
        rt_axis = Input.GetAxis("RT");
        if (rt_axis != 0) rt_input = true;
        rb_input = Input.GetButton("RB");

        lt_input = Input.GetButton("LT");
        lt_axis = Input.GetAxis("LT");
        if (lt_axis != 0) lt_input = true;
        lb_input = Input.GetButton("LB");

        b_input = Input.GetButton("B");
        x_input = Input.GetButton("X");
        a_input = Input.GetButton("A");
        y_input = Input.GetButton("Y");

        rightAxis_down = Input.GetButtonUp("Lock");

    }

    void UpdateStates()
    {
        pController.horizontal = horizontal;
        pController.vertical = vertical;

        Vector3 v = vertical * camController.transform.forward;
        Vector3 h = horizontal * camController.transform.right;
        pController.moveDir = (v + h).normalized;
        float m = Mathf.Abs(horizontal) + Mathf.Abs(vertical);
        pController.moveAmount = Mathf.Clamp01(m);

        if (x_input) b_input = false;

        //run
        if (b_input)
        {
            pController.run = (pController.moveAmount > 0);
        }

        pController.itemInput = x_input;
        pController.rb = rb_input;
        pController.lb = lb_input;
        pController.rt = rt_input;
        pController.lt = lt_input;

        

        //Lock on target
        if (camController.lockOnTarget != null)
        {
            if (camController.lockOnTarget.isDead)
            {
                //pController.lockOn = false;
                //pController.lockOnTarget = null;
                camController.lockOn = false;
                camController.lockOnTarget = null;
            }
        }

        //Lock on target
        if (rightAxis_down)
        {

            camController.lockOn = !camController.lockOn;
            if (camController.lockOnTarget == null)
            {
                camController.lockOn = false;
            }
        }

        
    }

    void ResetInputAndStates()
    {

        if (!b_input) b_timer = 0;
        if (pController.run) pController.run = false;
    }
}
