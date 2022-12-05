using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNet.SignalR.Client;
using Microsoft.AspNet.SignalR.Hubs;

namespace CyberpunkClient
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("hello world");
            var connection = new HubConnection("https://localhost:44349/com");
            //Make proxy to hub based on hub name on server
            var myHub = connection.CreateHubProxy("ComHub");

            //Start connection
            connection.Start().ContinueWith(task =>
            {
                if (task.IsFaulted)
                {
                    Console.WriteLine("There was an error opening the connection:{0}", task.Exception.GetBaseException());
                }
                else
                {
                    Console.WriteLine("Connected");
                }
            }).Wait();
            myHub.On<string, string>("addNewMessageToPage", (name, message) =>
            {
                Console.WriteLine($"Name: {name}, message: {message}");
            });
            myHub.On<CyberpunkServer.Models.DTO.PlayerData>("JackInRequestAccepted", (player) =>
            {
                
            });

            //connection.StateChanged += connection_StateChanged;

            myHub.Invoke("Send", "tuseroni", "HELLO World ").ContinueWith(task => {
                if (task.IsFaulted)
                {
                    Console.WriteLine("There was an error calling send: {0}", task.Exception.GetBaseException());
                }
                else
                {
                    Console.WriteLine("Send Complete.");
                }
            });
            
            Console.Read();

        }
    }
}
