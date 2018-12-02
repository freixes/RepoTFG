using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour {


    public Transform transform;
    public bool isDead;
    public float health;

	// Use this for initialization
	void Start () {
        transform = GetComponent<Transform>().transform;
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
