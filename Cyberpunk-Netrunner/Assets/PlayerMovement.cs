using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
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
    public GridController grid=null;
    // Update is called once per frame
    private void Start()
    {
        Debug.Log("player start");
        //this.gameObject.SetActive(false);
        //this.enabled = false;
    }

    private void JavaScriptInterface_onHeadTrackMove(Vector3 loc)
    {
        //controller.Move(loc);
        //transform.position += (loc * speed);
        controller.SimpleMove(loc*speed);
    }

    private void JavaScriptInterface_onModeChanged()
    {
        if(this.gameObject.activeInHierarchy)
        {
            this.gameObject.SetActive(false);
        }
        else
        {
            this.gameObject.SetActive(true);
        }
    }
    public void OnTriggerEnter(Collider other)
    {
        if(other.tag=="doorway")
        {
            gameObject.layer = (int)Math.Log(ignoreWall.value, 2);
        }
    }
    public void OnTriggerExit(Collider other)
    {
        if (other.tag == "doorway")
        {
            gameObject.layer = (int)Math.Log(layer.value, 2);
        }
    }
    void moveVector(Vector3 posVec)
    {
        var testVec = transform.rotation * posVec;
        var x = posX + (int)Math.Round(testVec.x);
        var y=  posY - (int)Math.Round(testVec.z);
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
        posX = x;
        posY = y;
        MoveToTile(tileObj);
    }
    void MoveLeft()
    {
        //posX--;
        
        var posVec = new Vector3(-1, 0, 0);
        moveVector(posVec);
    }
    void MoveRight()
    {
        var posVec = new Vector3(1, 0, 0);
        moveVector(posVec);
    }
    void MoveForward()
    {
        var posVec = new Vector3(0, 0, 1);
        moveVector(posVec);
    }
    void MoveBackward()
    {
        var posVec = new Vector3(0, 0, -1);
        moveVector(posVec);
    }
    void MoveToTile(GameObject tileObj)
    {
        var tile = tileObj.GetComponent<TileController>();
        if (tile.ContainedItem!=null && tile.ContainedItem.Solid)
        {
            return;
        }
        transform.position = tile.transform.position + new Vector3(0, 3, 0);
        SignalrHandler.InvokePlayerMove(3, posX, posY);
    }
    bool spawnBomb = false;
    bool LeftButtonDown = false;
    bool RightButtonDown = false;
    bool UpButtonDown = false;
    bool DownButtonDown = false;
    int posX = 10;
    int posY = 13;
    void Update()
    {
        //if(Input.touchSupported)
        //{

        //}

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

        //float x = Input.GetAxis("Horizontal");
        //float z = Input.GetAxis("Vertical");
        //bool run = Input.GetKey(KeyCode.LeftShift) | Input.GetKey(KeyCode.RightShift);
        
        //spawnBomb = Input.GetKeyDown(KeyCode.F);
        //if(spawnBomb)
        //{
        //    var bomb=GameObject.Instantiate(fBomb, Camera.main.transform.position+(Camera.main.transform.forward*50), Quaternion.identity);
        //    var bombRb = bomb.GetComponent<Rigidbody>();
        //    bombRb.velocity = Camera.main.transform.forward * 100;
        //}
        //Vector3 move = transform.right * x + transform.forward * z;
        //controller.SimpleMove(move* speed*(1+(2*(run?1:0))));
        //if(transform.position.y<-100)
        //{
        //    transform.position = new Vector3(0, 0, 0);
        //}
        ////avatarManager.
        //if (move.sqrMagnitude > 0 )
        //{
            
        //    //reflectProbe.transform.position = transform.position;
        //    //var pos = Camera.main.transform.position+ transform.forward * 11;
            

        //    //reflectProbe.gameObject.transform.position = pos;// transform.position;
        //    //reflectProbe.center = new Vector3(-pos.x, 59-pos.y, -pos.z);
        //    //reflectProbe.RenderProbe();
        //}
        //else
        //{
        //}
    }
}
