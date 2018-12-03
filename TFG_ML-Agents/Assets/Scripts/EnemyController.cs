using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour {


    public Transform transform;
    public bool isDead;
    public float maxHP = 150, curHP;
    public AnimationEvents animEvents;
    public GameObject activeModel;

    // Use this for initialization
    void Start () {
        transform = GetComponent<Transform>().transform;
        curHP = maxHP;

        animEvents = activeModel.AddComponent<AnimationEvents>();
        animEvents.Init(null, this);
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public void OpenDamageColliders()
    {
       
    }

    public void CloseDamageColliders()
    {
       
    }
}
