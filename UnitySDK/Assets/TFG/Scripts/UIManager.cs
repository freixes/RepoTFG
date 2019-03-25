using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIManager : MonoBehaviour {

    public BaseCharacter player;
    public BaseCharacter enemy;
    public GameObject HPBar;
    public GameObject staminaBar;
    // Use this for initialization
    public GameObject enemyHP;
    public GameObject enemyStamina;

	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        HPBar.GetComponent<RectTransform>().localScale = new Vector3(player.curHP / player.maxHP, 1,1);
        staminaBar.GetComponent<RectTransform>().localScale = new Vector3(player.currStam / player.maxStam, 1, 1);
        enemyHP.GetComponent<RectTransform>().localScale = new Vector3(enemy.curHP / enemy.maxHP, 1, 1);
        enemyStamina.GetComponent<Text>().text = enemy.currStam.ToString();
    }
}
