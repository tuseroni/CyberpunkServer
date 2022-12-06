using Microsoft.AspNet.SignalR.Client;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;

public static class ProgramData
{
    public static PlayerData player;

}

public static class SignalrHandler
{

    static HubConnection connection;
    static IHubProxy myHub;
    public delegate void JackInRequestAccepted(PlayerData player, SubgridData subgrid);
    public static event JackInRequestAccepted onJackInRequestAccepted;
    //public delegate void LoginSuccessful(PlayerData player);
    //public static event LoginSuccessful onLoginSuccessful;
    public static void CreateConnection(string address,string hub)
    {
        connection = new HubConnection(address);
        myHub = connection.CreateHubProxy(hub);
        connection.Start().ContinueWith(task =>
        {
            if (task.IsFaulted)
            {
                Debug.Log(string.Format("There was an error opening the connection:{0}", task.Exception.GetBaseException()));
            }
            else
            {
                Debug.Log("Connected");
            }
        }).Wait();
        myHub.On<PlayerData, SubgridData>("JackInRequestAccepted", (player, subgrid) =>
        {
            Debug.Log($"Player {player.Handle} has Jacked IN!");
            UnityThread.executeInUpdate(() =>
            {
                onJackInRequestAccepted.Invoke(player, subgrid);
            });
        });
        myHub.On<PlayerData>("JackInRequestRejected", (player) =>
        {
            Debug.Log($"Ref Says NO!!");
#if UNITY_EDITOR
            UnityEditor.EditorApplication.isPlaying = false;
#endif
            Application.Quit();
        });
        //myHub.On<PlayerData>("LoginSuccess", (player) =>
        //{
        //    Debug.Log($"Player {player.Handle} has Jacked IN!");
        //    UnityThread.executeInUpdate(() =>
        //    {
        //        onLoginSuccessful.Invoke(player);
        //    });
        //});
    }
    public static void InvokePlayerMove(int playerID, int x, int y)
    {
        myHub.Invoke("PlayerMove", playerID, x, y).ContinueWith(task =>
        {
            if (task.IsFaulted)
            {
                Debug.Log(string.Format("There was an error calling send: {0}", task.Exception.GetBaseException()));
            }
            else
            {
                Debug.Log("Send Complete.");
            }
        });
    }
    public static void InvokeSend()
    {
        myHub.Invoke("Send", "tuseroni", "HELLO World ").ContinueWith(task => {
            if (task.IsFaulted)
            {
                Debug.Log(string.Format("There was an error calling send: {0}", task.Exception.GetBaseException()));
            }
            else
            {
                Debug.Log("Send Complete.");
            }
        });
    }
    //public static void InvokeLogin()
    //{
    //    myHub.Invoke("Login", "tuseroni", "HELLO World ").ContinueWith(task => {
    //        if (task.IsFaulted)
    //        {
    //            Debug.Log(string.Format("There was an error calling send: {0}", task.Exception.GetBaseException()));
    //        }
    //        else
    //        {
    //            Debug.Log("Send Complete.");
    //        }
    //    });
    //}
    public static void InvokeJackInRequest(int PlayerID)
    {
        myHub.Invoke("JackInRequest", PlayerID).ContinueWith(task => {
            if (task.IsFaulted)
            {
                Debug.Log(string.Format("There was an error calling send: {0}", task.Exception.GetBaseException()));
            }
            else
            {
                Debug.Log("Send Complete.");
            }
        });
    }

}

public class signalrController : MonoBehaviour
{
    public GridController grid;
    public UnityThread UnityThread;
    public bool isDebug = true;
    string debugConnection = "https://localhost:44349/com";
    string ProductionConnection = "https://www.cloudwranglersinc.com/com";
    string connection = "";
    // Start is called before the first frame update
    void Start()
    {
        

    }

    private void Awake()
    {
        UnityThread.initUnityThread();

#if (UNITY_ANDROID)

        connection = ProductionConnection;
#else
        connection = debugConnection;
            
        
#endif
        SignalrHandler.CreateConnection(connection, "ComHub");
        //var connection = new HubConnection("https://www.cloudwranglersinc.com/com");
        //Make proxy to hub based on hub name on server
        //var myHub = connection.CreateHubProxy("ComHub");

        //Start connection
        
        //myHub.On<string, string>("addNewMessageToPage", (name, message) =>
        //{
        //    Debug.Log($"Name: {name}, message: {message}");
        //});

        SignalrHandler.onJackInRequestAccepted += SignalrHandler_onJackInRequestAccepted;
        //connection.StateChanged += connection_StateChanged;
        SignalrHandler.InvokeJackInRequest(3);
        //myHub.Invoke("Send", "tuseroni", "HELLO World ").ContinueWith(task => {
        //    if (task.IsFaulted)
        //    {
        //        Debug.Log(string.Format("There was an error calling send: {0}", task.Exception.GetBaseException()));
        //    }
        //    else
        //    {
        //        Debug.Log("Send Complete.");
        //    }
        //});

    }

    private void SignalrHandler_onJackInRequestAccepted(PlayerData player, SubgridData subgrid)
    {
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
