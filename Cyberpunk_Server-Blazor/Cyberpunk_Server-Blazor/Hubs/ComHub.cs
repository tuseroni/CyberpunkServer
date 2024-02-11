using CyberpunkServer.Models;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using Cyberpunk_Server_Blazor.Pages;
using System.Numerics;
using CyberpunkServer.Models.DTO;
using Humanizer;
using Microsoft.VisualStudio.Web.CodeGeneration.Design;
using static System.Runtime.InteropServices.JavaScript.JSType;
using Microsoft.AspNetCore.Components;

namespace Cyberpunk_Server_Blazor.Hubs
{
	public class ComHub : Hub
    {
		[Inject] IDbContextFactory<CyberpunkServer.Models.CyberpunkEntities> ctx { get; set; }
		
		public ComHub(IDbContextFactory<CyberpunkServer.Models.CyberpunkEntities> ctx)
		{
			this.ctx = ctx;
		}

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            await base.OnDisconnectedAsync(exception);
            Clients.Others.SendAsync("ClientDisconnect", Context.ConnectionId);
			
        }
        public void Send(string name, string message)
        {
            Clients.All.SendAsync("addNewMessageToPage",name, message);
        }
        public void PlayerMove(int PlayerID, int x, int y)
        {
            Clients.Others.SendAsync("PlayerMove", PlayerID, x, y);

		}
        public void ProgramMove(string UUID, int x, int y)
        {
            Clients.Others.SendAsync("ProgramMove", UUID, x, y);
		}
		public void ProgramAddedFromCyberdeck(PlayerCyberdeckProgramsData program)
		{
			Clients.Others.SendAsync("ProgramAddedFromCyberdeck", program);
		}
        public void ProgramAddedFromComputer(PlayerComputerProgramsData program)
        {
            Clients.Others.SendAsync("ProgramAddedFromComputer", program);
        }
        public void ProgramDeactivated(string ProgramUUID)
		{
            Clients.Others.SendAsync("ProgramDeactivated", ProgramUUID);
        }
		public void ProgramDerezzed(string ProgramUUID)
		{
			Clients.Others.SendAsync("ProgramDerezzed", ProgramUUID);
		}

		public void AcceptJackInRequest(int PlayerID,int xPos, int yPos, CyberpunkServer.Models.DTO.SubgridData gridData)
        {
			//Console.WriteLine("hello");
            Clients.Others.SendAsync("JackInRequestAccepted",PlayerID,xPos,yPos,gridData,Context.ConnectionId);

		}
        public void RejectJackInRequest(CyberpunkServer.Models.DTO.PlayerData player)
        {
            Clients.Others.SendAsync("JackInRequestRejected",player);

		}
		public void PlayerCut(int PlayerID)
		{
            Clients.Others.SendAsync("PlayerCut", PlayerID);
        }
        public void FortressAlerted(string AlertText)
        {
            Clients.Others.SendAsync("FortressAlerted", AlertText);
        }
		public void MessageReceived(string Message,string DestConnectionID)
		{
            Clients.Client(DestConnectionID).SendAsync("MessageReceived", Message);
        }
        public void Login(string email,string password)
        {
			using (var db = ctx.CreateDbContext())
			{
				var user = db.Player
					.Include(p => p.Role)
							.Include(p => p.PlayerSkill)
								.ThenInclude(p => p.Skill)
								.ThenInclude(p => p.SkillTypeNavigation)
							.Include(p => p.PlayerStat)
								.ThenInclude(p => p.Stat)
							.Include(p => p.TypeNavigation)
							.Include(p => p.PlayerWeapon)
							.Include(p => p.PlayerArmor)
							.Include(p => p.PlayerCybernetics)
							.Include(p => p.PlayerPrograms)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramType)
							.Include(p => p.PlayerComputer)
								.ThenInclude(p => p.Computer)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerImprovements)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerImprovements).ThenInclude(p => p.ComputerImprovements)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions).ThenInclude(p => p.ComputerPeripherals)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions).ThenInclude(p => p.ComputerPeripherals).ThenInclude(p => p.ComputerPeripheralSkillModifiers)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions).ThenInclude(p => p.ComputerPeripherals).ThenInclude(p => p.ComputerPeripheralStatModifiers)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.TypeNavigation)

							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramType)

							.Include(p => p.PlayerCyberdeck)
								.ThenInclude(p => p.Cyberdeck)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckImprovements)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckImprovements).ThenInclude(p => p.CyberdeckImprovements)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions).ThenInclude(p => p.CyberdeckOptions)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions).ThenInclude(p => p.CyberdeckOptions).ThenInclude(p => p.CyberdeckOptionsSkillModifiers)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions).ThenInclude(p => p.CyberdeckOptions).ThenInclude(p => p.CyberdeckOptionsStatModifiers)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.TypeNavigation)

							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramType)


							.Include(p => p.aspUser)
							.AsSplitQuery()
					.Where(p => p.aspUser.Email == email).ToList();

				if (user == null)
				{
					Clients.Caller.SendAsync("onLoginRejected", "User Email or Password is Invalid");
				}
				else
				{

					Clients.Caller.SendAsync("onLoginSuccessful", CyberpunkServer.Models.DTO.PlayerData.ConvertList(user));

				}
				//if(user.PasswordHash== SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(password + user.Id)).ToString())
				//{
				//    Clients.Caller.onLoginSuccessful(user.Player.First());
				//}
				//else
				//{
				//    Clients.Caller.onLoginRejected("User Email or Password is Invalid");
				//}
			}
        }
        public async Task JackInRequest(int id,string ConnectionID)
        {
			using (var db = ctx.CreateDbContext())
			{
				var player = await db.Player
							.Include(p => p.Role)
							.Include(p => p.PlayerSkill)
								.ThenInclude(p => p.Skill)
								.ThenInclude(p => p.SkillTypeNavigation)
							.Include(p => p.PlayerStat)
								.ThenInclude(p => p.Stat)
							.Include(p => p.TypeNavigation)
							.Include(p => p.PlayerWeapon)
							.Include(p => p.PlayerArmor)
							.Include(p => p.PlayerCybernetics)
							.Include(p => p.PlayerPrograms)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramType)
							.Include(p => p.PlayerComputer)
								.ThenInclude(p => p.Computer)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerImprovements)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerImprovements).ThenInclude(p => p.ComputerImprovements)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions).ThenInclude(p => p.ComputerPeripherals)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions).ThenInclude(p => p.ComputerPeripherals).ThenInclude(p => p.ComputerPeripheralSkillModifiers)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions).ThenInclude(p => p.ComputerPeripherals).ThenInclude(p => p.ComputerPeripheralStatModifiers)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.TypeNavigation)

							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramType)

							.Include(p => p.PlayerCyberdeck)
								.ThenInclude(p => p.Cyberdeck)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckImprovements)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckImprovements).ThenInclude(p => p.CyberdeckImprovements)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions).ThenInclude(p => p.CyberdeckOptions)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions).ThenInclude(p => p.CyberdeckOptions).ThenInclude(p => p.CyberdeckOptionsSkillModifiers)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions).ThenInclude(p => p.CyberdeckOptions).ThenInclude(p => p.CyberdeckOptionsStatModifiers)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.TypeNavigation)

							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramFunction)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramOptions)
							.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramType)


							.Include(p => p.aspUser)
							.AsSplitQuery()
							.Where(x => x.id == id).FirstAsync();
			CyberpunkServer.Models.DTO.PlayerData playerData = (CyberpunkServer.Models.DTO.PlayerData)player;
			playerData.ConnectionID = ConnectionID;
            Clients.Others.SendAsync("JackInRequestReceived",playerData);
			}
		}
    }
}