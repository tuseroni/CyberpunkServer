using Cyberpunk_Server_Blazor.Data;
using CyberpunkServer.Models;
using CyberpunkServer.Models.DTO;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.JSInterop;
using System.Numerics;
using System.Reflection.Metadata;

namespace Cyberpunk_Server_Blazor.Pages
{
    public partial class Player : IAsyncDisposable
    {
        [Parameter] public int playerID { get; set; }
        public double Humanity
        {
            get
            {
                return (Model.StatLookup["EMP"].Base * 10) - (Math.Floor((Model.Humanity / 10.0)) * 10)??0;

		    }
            set { }
        }
        public PlayerData Model;
        public CyberpunkServer.Models.Player PlayerEntity;
		protected void ListChange()
		{
			StateHasChanged();
		}
		protected override async Task OnAfterRenderAsync(bool firstRender)
		{
            await base.OnAfterRenderAsync(firstRender);
            await JS.InvokeAsync<string>("registerTabs");

		}
		public async Task SaveAsync()
        {
            using (var ctx = db.CreateDbContext())
            {
                PlayerData.CopyProperties(Model, PlayerEntity, ctx);
                //await Task.Yield();
                await ctx.SaveChangesAsync();
            }
		}
		protected override async Task OnInitializedAsync()
        {
            await base.OnInitializedAsync();
            bool isLoading = false;
            if(isLoading) 
            { 
                return; 
            }
            try
            {
                isLoading = true;

				using (var ctx = db.CreateDbContext())
                {
                    var player = await ctx.Player
                        .Include(p => p.Role)
                        .Include(p => p.PlayerSkill)
                            .ThenInclude(p => p.Skill)
                            .ThenInclude(p => p.SkillTypeNavigation)
                        .Include(p => p.PlayerStat)
                            .ThenInclude(p => p.Stat)
                        .Include(p => p.PlayerWeapon)
                        .Include(p => p.PlayerArmor)
                        .Include(p => p.PlayerCybernetics)
                        .Include(p => p.PlayerPrograms)
						.Include(p => p.PlayerPrograms).ThenInclude(p=>p.Program)
						.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x=>x.ProgramFunction)
						.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
						.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
						.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram)
						.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramFunction)
						.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramOptions)
						.Include(p => p.PlayerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramType)
						.Include(p => p.PlayerComputer)
                            .ThenInclude(p=>p.Computer)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerImprovements)
                        .Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerImprovements).ThenInclude(p => p.ComputerImprovements)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions).ThenInclude(p=>p.ComputerPeripherals)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions).ThenInclude(p => p.ComputerPeripherals).ThenInclude(p => p.ComputerPeripheralSkillModifiers)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerOptions).ThenInclude(p => p.ComputerPeripherals).ThenInclude(p => p.ComputerPeripheralStatModifiers)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p=>p.Program)

						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramFunction)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramFunction)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramOptions)
						.Include(p => p.PlayerComputer).ThenInclude(p => p.PlayerComputerPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramType)

						.Include(p => p.PlayerCyberdeck)
                            .ThenInclude(p=>p.Cyberdeck)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckImprovements)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckImprovements).ThenInclude(p => p.CyberdeckImprovements)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions).ThenInclude(p=>p.CyberdeckOptions)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions).ThenInclude(p => p.CyberdeckOptions).ThenInclude(p => p.CyberdeckOptionsSkillModifiers)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckOptions).ThenInclude(p => p.CyberdeckOptions).ThenInclude(p => p.CyberdeckOptionsStatModifiers)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program)

						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x=>x.ProgramFunction)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramFunction)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramOptions)
						.Include(p => p.PlayerCyberdeck).ThenInclude(p => p.PlayerCyberdeckPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.SubProgram).ThenInclude(x => x.ProgramType)


						.Include(p => p.aspUser)
						.AsSplitQuery()
						.Where(x => x.id == playerID).FirstAsync();
                    if (player != null)
                    {
                        PlayerEntity = player;
                        Model = (PlayerData)player;
                    }
                }
            } catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally 
            {
                isLoading = false; 
            }
        }

        public async ValueTask DisposeAsync()
        {
            await Task.Yield();
        }
    }
}
