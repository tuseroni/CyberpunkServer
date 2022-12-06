using CyberpunkServer.Models.DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerController : MonoBehaviour
{
    // Start is called before the first frame update

    public CharacterController controller;
    public float speed = 12f;
    Vector3 velocity;
    public float gravity = -9.81f;
    public Transform groundCheck;
    public float groundDistance = 0.4f;
    public LayerMask groundMask;
    public float jumpHeight = 3f;
    bool isGrounded;
    public float frictionCo = 0.8f;
    public ReflectionProbe reflectProbe;
    public LayerMask layer;
    public LayerMask ignoreWall;
    public GameObject fBomb;
    public GridController grid = null;
    public PlayerData playerData;
    // Update is called once per frame
    private void Start()
    {
        Debug.Log("player start");
    }


    public void OnTriggerEnter(Collider other)
    {
        
    }
    public void OnTriggerExit(Collider other)
    {
        
    }
    void moveVector(Vector3 posVec)
    {
        var testVec = transform.rotation * posVec;
        var x = playerData.xPos + (int)Math.Round(testVec.x);
        var y = playerData.yPos - (int)Math.Round(testVec.z);
        //var x=posVec
        if (x < 0)
        {
            x = 0;
        }
        if (y < 0)
        {
            y = 0;
        }
        var tileObj = grid.gridTiles[y][x];
        var tile = tileObj.GetComponent<TileController>();
        if (tile.ContainedItem != null && tile.ContainedItem.Solid)
        {
            return;
        }
        playerData.xPos = x;
        playerData.yPos = y;
        //posX = x;
        //posY = y;
        MoveToTile(tileObj);
    }
    public void MoveLeft()
    {
        //posX--;

        var posVec = new Vector3(-1, 0, 0);
        moveVector(posVec);
    }
    public void MoveRight()
    {
        var posVec = new Vector3(1, 0, 0);
        moveVector(posVec);
    }
    public void MoveForward()
    {
        var posVec = new Vector3(0, 0, 1);
        moveVector(posVec);
    }
    public void MoveBackward()
    {
        var posVec = new Vector3(0, 0, -1);
        moveVector(posVec);
    }
    public void MoveToTile(GameObject tileObj)
    {
        var tile = tileObj.GetComponent<TileController>();
        if (tile.ContainedItem != null && tile.ContainedItem.Solid)
        {
            return;
        }
        transform.position = tile.transform.position + new Vector3(0, 3, 0);
        SignalrHandler.InvokePlayerMove(playerData.id, playerData.xPos, playerData.yPos);
    }

    bool LeftButtonDown = false;
    bool RightButtonDown = false;
    bool UpButtonDown = false;
    bool DownButtonDown = false;
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.LeftArrow) | Input.GetKeyDown(KeyCode.A))
        {
            LeftButtonDown = true;
        }
        else if (LeftButtonDown)
        {
            LeftButtonDown = false;
            MoveLeft();
        }
        if (Input.GetKeyDown(KeyCode.RightArrow) | Input.GetKeyDown(KeyCode.D))
        {
            RightButtonDown = true;
        }
        else if (RightButtonDown)
        {
            RightButtonDown = false;
            MoveRight();
        }
        if (Input.GetKeyDown(KeyCode.UpArrow) | Input.GetKeyDown(KeyCode.W))
        {
            UpButtonDown = true;
        }
        else if (UpButtonDown)
        {
            UpButtonDown = false;
            MoveForward();
        }
        if (Input.GetKeyDown(KeyCode.DownArrow) | Input.GetKeyDown(KeyCode.S))
        {
            DownButtonDown = true;
        }
        else if (DownButtonDown)
        {
            DownButtonDown = false;
            MoveBackward();
        }
    }
}
