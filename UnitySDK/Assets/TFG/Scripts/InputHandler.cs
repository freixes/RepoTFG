using UnityEngine;

public class InputHandler : MonoBehaviour {

    float vertical, horizontal;
    bool b_input, a_input, x_input, y_input;

    bool rb_input, rt_input, lb_input, lt_input;
    float rt_axis, lt_axis;

    bool leftAxis_down, rightAxis_down;

    float rt_timer;
    float lt_timer;

    public float dist;
    public PlayerController pController;
    public CameraManager camManager;

    float delta;


    void Start()
    {
        pController = GetComponent<PlayerController>();
        pController.Init();

        camManager = CameraManager.singleton;
        camManager.Init(this.transform);
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        delta = Time.fixedDeltaTime;
        GetInput();
        UpdateStates();
        pController.FixedTick(delta);
        camManager.Tick(delta);

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

        Vector3 v = vertical * camManager.transform.forward;
        Vector3 h = horizontal * camManager.transform.right;
        pController.moveDir = (v + h).normalized;
        float m = Mathf.Abs(horizontal) + Mathf.Abs(vertical);
        pController.moveAmount = Mathf.Clamp01(m);

        if (x_input) b_input = false;

        //run
        
        pController.running = b_input;
        pController.isBlocking = lb_input;
        pController.itemInput = x_input;

        pController.rb = rb_input;
        pController.lb = lb_input;
        pController.rt = rt_input;
        pController.lt = lt_input;

        

        //Lock of target
        if (camManager.lockOnTarget != null)
        {
            if (camManager.lockOnTarget.isDead)
            {
                camManager.lockOn = false;
                camManager.lockOnTarget = null;
            }
        }

        //Lock on target
        if (rightAxis_down)
        {

            camManager.lockOn = !camManager.lockOn;
            if (camManager.lockOnTarget == null)
            {
                camManager.lockOn = false;
            }
        }
        dist = Vector3.Distance(pController.transform.position, camManager.lockOnTarget.transform.position);
        if (dist > 15) camManager.lockOn = false;


    }

    void ResetInputAndStates()
    {
        if (pController.running) pController.running = false;
    }
}
