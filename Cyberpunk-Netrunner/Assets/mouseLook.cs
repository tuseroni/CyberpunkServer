using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class mouseLook : MonoBehaviour
{
    // Start is called before the first frame update
    public float mouseSensitivity = 100f;
    public float touchSensitivity = 100f;
    public Transform playerBody;
    float xRotation = 0f;
    private bool mouseDown;
    private bool crouching = false;

    void Start()
    {
        Cursor.lockState = CursorLockMode.Confined;
        if(SystemInfo.supportsGyroscope)
        {
            Input.gyro.enabled = true;
        }
    }

    Touch theTouch;
    Vector2 touchPosition = new Vector2(0, 0);
    // Update is called once per frame
    void Update()
    {
        if (Input.touchSupported)
        {
            if (Input.touchCount > 0)
            {
                theTouch = Input.GetTouch(0);
                if (theTouch.phase == TouchPhase.Began)
                {
                    mouseDown = true;
                    touchPosition = theTouch.position;
                }
                else if(theTouch.phase==TouchPhase.Moved)
                {
                    Vector2 movement= touchPosition - theTouch.position;
                    var mouseX = movement.x * touchSensitivity * Time.deltaTime;
                    var mouseY = movement.y * touchSensitivity * Time.deltaTime;
                    xRotation -= mouseY;
                    xRotation = Mathf.Clamp(xRotation, -90f, 90f);
                    transform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
                    playerBody.Rotate(Vector3.up * mouseX);
                    touchPosition = theTouch.position;
                }
                else if(theTouch.phase==TouchPhase.Ended)
                {
                    mouseDown = false;
                }
            }
        }
        else
        {
            if (Input.GetMouseButtonDown(0))
            {
                mouseDown = true;
            }
            if (Input.GetMouseButtonUp(0))
            {
                mouseDown = false;
            }

            if (Input.GetKeyDown(KeyCode.C))
            {
                crouching = true;
            }
            if (Input.GetKeyUp(KeyCode.C))
            {
                crouching = false;
            }
            if (mouseDown)
            {
                var mouseX = Input.GetAxis("Mouse X") * mouseSensitivity * Time.deltaTime;
                var mouseY = Input.GetAxis("Mouse Y") * mouseSensitivity * Time.deltaTime;
                xRotation -= mouseY;
                xRotation = Mathf.Clamp(xRotation, -90f, 90f);
                transform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
                playerBody.Rotate(Vector3.up * mouseX);
            }
        }
        if(Input.gyro.enabled)
        {

            GyroModifyCamera();
        }
        
        
        if(crouching)
        {
            if(playerBody.localScale.y>0.86f)
            {
                playerBody.localScale = new Vector3(1f, 0.45f, 1f);
            }
        }
        else
        {
            if (playerBody.localScale.y < 0.99f)
            {
                playerBody.localScale = new Vector3(1f, 1f, 1f);
            }
        }
    }
    void GyroModifyCamera()
    {
        return;
        //transform.Rotate(-Input.gyro.rotationRateUnbiased.x, -Input.gyro.rotationRateUnbiased.y, 0);
        var orientation = Input.gyro.attitude;
        Quaternion rot = Quaternion.Inverse(new Quaternion(orientation.x, orientation.y, -orientation.z, orientation.w));
        var rotTest= Quaternion.Euler(new Vector3(90.0f, 90.0f, 0.0f)) * rot;
        var eulers = rotTest.eulerAngles;
        transform.localRotation = Quaternion.Euler(new Vector3(eulers.x, 0, eulers.z)); //rotTest;// Quaternion.Euler(new Vector3(rotTest.eulerAngles.x, 0.0f, 0.0f));
        playerBody.localRotation= Quaternion.Euler(new Vector3(0, eulers.y, 0)); ;

        //transform.localRotation = GyroToUnity(Input.gyro.attitude);
        
    }

    private static Quaternion GyroToUnity(Quaternion q)
    {
        return new Quaternion(q.x, q.y, -q.z, -q.w);
    }
}
