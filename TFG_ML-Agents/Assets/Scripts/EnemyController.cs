using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour {


    public Transform transform;
    public bool isDead;
    public float maxHP = 150, curHP;

    
	// Use this for initialization
	void Start () {
        transform = GetComponent<Transform>().transform;
        curHP = maxHP;
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
