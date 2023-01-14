using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.IO;
using System.Text;
using System.Linq;
using Microsoft.AspNetCore.SignalR.Client;
using System.Threading.Tasks;

public static class AppData
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

    static HubConnection hubConnection;
    public delegate void JackInRequestAccepted(int playerID,int x, int y, SubgridData subgrid);
    public delegate void JackInRequestRejected(int playerID);
    public static event JackInRequestAccepted onJackInRequestAccepted;
    public static event JackInRequestRejected onJackInRequestRejected;
    public delegate void LoginSuccessful(List<PlayerData> player);
    public delegate void LoginFailurel(string Message);
    public static event LoginSuccessful onLoginSuccessful;
    public static event LoginFailurel onLoginFailure;
    public static async Task CreateConnectionAsync(string address,string hub)
    {
        hubConnection = new HubConnectionBuilder()
                .WithUrl(address)
                .Build();
        await hubConnection.StartAsync().ContinueWith(task =>
        {
            if (task.IsFaulted)
            {
                Debug.Log(string.Format("Failed to connect: {0}", task.Exception.GetBaseException()));
            }
            else
            {
                Debug.Log("Connected.");
            }
        });
        //connection = new HubConnection(address);
        //var strWriter = new MessageWriter();
        //var fileWriter = new StreamWriter(new FileStream("signalrLog.log", FileMode.OpenOrCreate));
        //connection.TraceLevel = TraceLevels.Messages;

        //connection.TraceWriter = fileWriter;

        hubConnection.On<int,int,int, SubgridData>("JackInRequestAccepted", (playerID,x,y,subgrid) =>
        {
            Debug.Log($"Player has Jacked IN!");
            UnityThread.executeInUpdate(() =>
            {
                onJackInRequestAccepted.Invoke(playerID,x,y, subgrid);
            });
        });
        hubConnection.On<int>("JackInRequestRejected", (PlayerID) =>
        {

            UnityThread.executeInUpdate(() =>
            {
                onJackInRequestRejected.Invoke(PlayerID);
            });

        });
        hubConnection.On<List<PlayerData>>("onLoginSuccessful", (player) =>
        {
            UnityThread.executeInUpdate(() =>
            {
                onLoginSuccessful.Invoke(player);
            });
        });
        hubConnection.On<string>("onLoginRejected", (message) =>
        {
            UnityThread.executeInUpdate(() =>
            {
                onLoginFailure.Invoke(message);
            });
        });
    }
    public static void InvokePlayerMove(int playerID, int x, int y)
    {
        if(hubConnection == null)
        {
            return;
        }
        hubConnection.SendAsync("PlayerMove", playerID, x, y).ContinueWith(task =>
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
    public static void InvokeProgramMove(int FortressProgramID,int FortressID, int x, int y)
    {
        if (hubConnection == null)
        {
            return;
        }
        hubConnection.SendAsync("ProgramMove", FortressProgramID, FortressID, x, y).ContinueWith(task =>
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
        if (hubConnection == null)
        {
            return;
        }
        hubConnection.SendAsync("Login", email, password).ContinueWith(task =>
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
        if (hubConnection == null)
        {
            return;
        }
        hubConnection.SendAsync("Send", "tuseroni", "HELLO World ").ContinueWith(task => {
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
        if (hubConnection == null)
        {
            return;
        }
        hubConnection.SendAsync("JackInRequest", PlayerID).ContinueWith(task => {
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
    string debugConnection = "https://localhost:7094/com";
    string ProductionConnection = "https://www.cloudwranglersinc.com/com";
    string connection = "";
    // Start is called before the first frame update
    void Start()
    {
        

    }

    private void Awake()
    {
        UnityThread.initUnityThread();

#if (!UNITY_EDITOR)

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
