using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CharacterButton : MonoBehaviour {

    private void OnMouseDown()
    {
        SceneManager.LoadScene("CharScene");
    }
}
