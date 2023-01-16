// See https://aka.ms/new-console-template for more information
using Microsoft.AspNetCore.SignalR.Client;
using System.Runtime.Serialization;

Console.WriteLine("Hello, World!");
var hubConnection = new HubConnectionBuilder()
				.WithUrl("https://localhost:7094/com")
				.Build();
hubConnection.On<string, string>("addNewMessageToPage", (name, message) =>
		 {
			 Console.WriteLine($"Name: {name}, message: {message}");
		 });
await hubConnection.StartAsync();
await Send("hello world");
async Task Send(string Message)
{
	if (hubConnection is not null)
	{
		await hubConnection.SendAsync("Send", "Tuseroni", Message);
	}
}
Console.Read();
