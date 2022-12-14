using Microsoft.AspNet.SignalR.Client;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.IO;
using System.Text;
using System.Linq;

public static class ProgramData
{
    public static Dictionary<int, PlayerData> PlayerLookup = new Dictionary<int, PlayerData>();
    public static List<PlayerData> Characters
    {
        get
        {
            return PlayerLookup.Values.ToList(); 
        }
        set
        {   
            PlayerLookup = value.ToDictionary(x => x.id, x => x);
        }
    }
    public static PlayerData player;
    public static SubgridData subgrid;
}
public class MessageWriter : TextWriter
{
    public override Encoding Encoding => Encoding.UTF8;
    public override void Write(char value)
    {
        base.Write(value);
        //Debug.Log(value);
    }
    public override void Write(char[] buffer)
    {
        base.Write(buffer);
        Debug.Log(buffer);
    }

}

public static class SignalrHandler
{

    static HubConnection connection;
    static IHubProxy myHub;
    public delegate void JackInRequestAccepted(int playerID,int x, int y, SubgridData subgrid);
    public delegate void JackInRequestRejected(int playerID);
    public static event JackInRequestAccepted onJackInRequestAccepted;
    public static event JackInRequestRejected onJackInRequestRejected;
    public delegate void LoginSuccessful(List<PlayerData> player);
    public delegate void LoginFailurel(string Message);
    public static event LoginSuccessful onLoginSuccessful;
    public static event LoginFailurel onLoginFailure;
    public static void CreateConnection(string address,string hub)
    {
        connection = new HubConnection(address);
        var strWriter = new MessageWriter();
        var fileWriter = new StreamWriter(new FileStream("signalrLog.log", FileMode.OpenOrCreate));
        connection.TraceLevel = TraceLevels.Messages;

        connection.TraceWriter = fileWriter;

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
        myHub.On<int,int,int, SubgridData>("JackInRequestAccepted", (playerID,x,y,subgrid) =>
        {
            Debug.Log($"Player has Jacked IN!");
            UnityThread.executeInUpdate(() =>
            {
                onJackInRequestAccepted.Invoke(playerID,x,y, subgrid);
            });
        });
        myHub.On<int>("JackInRequestRejected", (PlayerID) =>
        {

            UnityThread.executeInUpdate(() =>
            {
                onJackInRequestRejected.Invoke(PlayerID);
            });

        });
        myHub.On<List<PlayerData>>("onLoginSuccessful", (player) =>
        {
            UnityThread.executeInUpdate(() =>
            {
                onLoginSuccessful.Invoke(player);
            });
        });
        myHub.On<string>("onLoginRejected", (message) =>
        {
            UnityThread.executeInUpdate(() =>
            {
                onLoginFailure.Invoke(message);
            });
        });
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
    public static void InvokeLogin(string email, string password)
    {
        myHub.Invoke("Login", email, password).ContinueWith(task =>
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
        //SignalrHandler.CreateConnection(connection, "ComHub");
        //var connection = new HubConnection("https://www.cloudwranglersinc.com/com");
        //Make proxy to hub based on hub name on server
        //var myHub = connection.CreateHubProxy("ComHub");

        //Start connection
        
        //myHub.On<string, string>("addNewMessageToPage", (name, message) =>
        //{
        //    Debug.Log($"Name: {name}, message: {message}");
        //});

        
        //connection.StateChanged += connection_StateChanged;
        
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


    // Update is called once per frame
    void Update()
    {
        
    }
}
