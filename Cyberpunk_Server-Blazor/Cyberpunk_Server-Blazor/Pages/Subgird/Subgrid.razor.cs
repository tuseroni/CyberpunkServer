using CyberpunkServer.Models;
using CyberpunkServer.Models.DTO;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.SignalR.Client;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.VisualStudio.Web.CodeGeneration.Design;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Numerics;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Cyberpunk_Server_Blazor.Pages.Subgird
{
	public partial class Subgrid: IAsyncDisposable,IDisposable
    {
        [Parameter] public int SubgridID 
		{ 
			get; 
			set; 
		}
		List<ProgramData> ProgramList = new List<ProgramData>();
		private FortressData Fortress;
        List<NetObjTypeData> NetOBJTypes = new List<NetObjTypeData>();
        SubgridData grid;
        CyberpunkServer.Models.Subgrid GridEntity;
		Dictionary<int, Dictionary<int, Tile>> GridLookup = new Dictionary<int, Dictionary<int, Tile>>();
        Dictionary<int, Dictionary<int, ObservableCollection<NetItem>>> netItemLookup = new Dictionary<int, Dictionary<int, ObservableCollection<NetItem>>>();
		int gridSize = 20;
		Guid UUID
		{
			get;
			set;
		}
		public Subgrid()
		{
			UUID = Guid.NewGuid();
        }
		public NetItem? SelectedItem 
		{ 
			get;
			set; 
		}
		public void SetSelectedItem(NetItem Item)
		{
			SelectedItem = Item;
			InvokeAsync(() => StateHasChanged());
		}
		Type? SelectedType;



		private HubConnection? hubConnection;
		private List<string> messages = new List<string>();
		private string? userInput;
		private string? messageInput;
		int _SelectedProgramIndex = 0;
		private int SelectedProgramIndex
		{
			get
			{
				return _SelectedProgramIndex;
			}
			set
			{
				_SelectedProgramIndex = value;
				((FortressProgramsData)SelectedItem).Program = ProgramList[value];
				((FortressProgramsData)SelectedItem).ProgramID = ProgramList[value].id;
			}
		}
		void SetSelectedItem(NetObjTypeData type)
		{
			switch (type.id)
			{
				case 1:
					SelectedType = typeof(FortressWallsData);
					SelectedItem = new FortressWallsData
					{
						NetObjType = type,
						Type = type.id
					};
					break;
				case 2:
					SelectedType = typeof(FortressCPUData);
					SelectedItem = new FortressCPUData
					{
						NetObjType = type,
						Type = type.id
					};
					break;
				case 3:
					SelectedType = typeof(FortressMemoryData);
					SelectedItem = new FortressMemoryData
					{
						NetObjType = type,
						Type = type.id
					};
					break;
				case 4:
					SelectedType = typeof(FortressCodeGatesData);
					SelectedItem = new FortressCodeGatesData
					{
						NetObjType = type,
						Type = type.id
					};
					break;
				case 5:
					SelectedType = typeof(FortressProgramsData);
					SelectedItem = new FortressProgramsData
					{
						NetObjType = type,
						Type = type.id,
						Program = ProgramList[SelectedProgramIndex],
						ProgramID = ProgramList[SelectedProgramIndex].id
					};
					break;
				case 6:
					//subgridData.Fortress[0].FortressRemotes.push(newNetOBJ);
					break;
				case 7:
				case 8:
				case 9:
				case 10:
				case 11:
				case 12:
				case 13:
				case 14:
				case 15:
				case 16:
				case 17:
				case 18:
				case 19:
					SelectedType = typeof(FortressRemotesData);
					SelectedItem = new FortressRemotesData
					{
						NetObjType = type,
						Type = type.id
					};
					break;
			}
			//SelectedType = typeof(T);
			//SelectedItem = selectedItem;
		}
		void cancelJackIn()
		{
			hubConnection.SendAsync("RejectJackInRequest", (PlayerData)SelectedItem);
		}
		void cancelPlace()
		{
			SelectedItem = null;
			SelectedType = null;
		}

		private async Task Send()
		{
			if (hubConnection is not null)
			{
				await hubConnection.SendAsync("Send", userInput, messageInput);
			}
		}

		public bool IsConnected =>
			hubConnection?.State == HubConnectionState.Connected;

		public async ValueTask DisposeAsync()
		{
			if (hubConnection is not null)
			{
				await hubConnection.DisposeAsync();
			}
			if (grid != null)
			{
				for (var y = 0; y < grid.height; y++)
				{
					for (var x = 0; x < grid.width; x++)
					{
						netItemLookup[y][x].CollectionChanged -= collectionChange;
					}
				}
			}
			netItemLookup?.Clear();
        }

		private void PlayerMove(int PlayerID, int x, int y)
		{
			InvokeAsync(() =>
			{
				var gridtileData = GridLookup[y][x];
				if(JackedInPlayers.Count==0)
				{
					this.DisposeAsync();
					return;
				}
				var player = JackedInPlayers[PlayerID];
				player.CurrentTile.ContainedItems.Remove(player);
				gridtileData.ContainedItems.Add(player);
				player.CurrentTile = gridtileData;
			});

		}
		private void ProgramMove(string UUID,int x, int y)
		{
			var gridtileData = GridLookup[y][x];

			var prog = runningPrograms[UUID];// gridtileData.ContainedItems.Where(x => x.id == ProgramID).FirstOrDefault();
			if(prog==null)
			{
				return;
			}
			var newtileData = gridtileData;// GridLookup[toY][toX];
            prog.CurrentTile.ContainedItems.Remove(prog);
            newtileData.ContainedItems.Add(prog);
			prog.CurrentTile = newtileData;
			prog.xPos = x;
			prog.yPos = y;
		}
		private void JackInRequestReceived(PlayerData playerData)
		{
			InvokeAsync(() =>
			{
				SelectedItem = playerData;
				StateHasChanged();
			});
			//if (confirm(`${ playerData.Handle} is Trying to Jack In, Please Click Jack In Point`)) {
			//	awaitingPlayerAdd = true;
			//	awaitingPlayer = playerData;
			//	console.log(playerData.Handle);
			//}
			//else
			//{
			//	alert("Jack in Canceled");
			//	contosoChatHubProxy.invoke('RejectJackInRequest', playerData)
			//}

		}
		Dictionary<int, PlayerData> JackedInPlayers = new Dictionary<int, PlayerData>();
		CancellationToken token = new CancellationToken();
		private void addPlayerToGrid(PlayerData playerData, int x, int y)
		{
			InvokeAsync(() =>
			{
				if (!JackedInPlayers.ContainsKey(playerData.id))
				{
					JackedInPlayers.Add(playerData.id, playerData);
					SelectedItem = null;
					
					hubConnection.InvokeAsync("AcceptJackInRequest", playerData.id, playerData.xPos, playerData.yPos, grid, token).ContinueWith(task =>
					{
						if (task.IsFaulted)
						{
							Debug.Print(string.Format("There was an error calling send: {0}", task.Exception.GetBaseException()));
						}
						else
						{
							Debug.Print("Send Complete.");
						}
					});
				}
				
			});
			//var gridtileData = GridLookup[y][x];
			//gridtileData.ContainedItems.Add(playerData);
		}
		protected void collectionChange(object? sender, NotifyCollectionChangedEventArgs e)
		{
			
			if(e.Action==NotifyCollectionChangedAction.Add)
			{
				foreach (var Element in e.NewItems)
				{
					switch (((NetItem)Element).NetObjType.id)
					{
						case 1:
							if(Fortress.FortressWalls.Contains((FortressWallsData)Element))
							{
								return;
							}
							Fortress.FortressWalls.Add((FortressWallsData)Element);
							SetSelectedItem(((NetItem)Element).NetObjType);
							break;
						case 2:
							if (Fortress.FortressCPU.Contains((FortressCPUData)Element))
							{
								return;
							}
							Fortress.FortressCPU.Add((FortressCPUData)Element);
							SetSelectedItem(((NetItem)Element).NetObjType);
							break;
						case 3:
							if (Fortress.FortressMemory.Contains((FortressMemoryData)Element))
							{
								return;
							}
							Fortress.FortressMemory.Add((FortressMemoryData)Element);
							SetSelectedItem(((NetItem)Element).NetObjType);
							break;
						case 4:
							if (Fortress.FortressCodeGates.Contains((FortressCodeGatesData)Element))
							{
								return;
							}
							
							Fortress.FortressCodeGates.Add((FortressCodeGatesData)Element);
							SetSelectedItem(((NetItem)Element).NetObjType);
							break;
						case 5:
							if ((Element is FortressProgramsData && Fortress.FortressPrograms.Contains((FortressProgramsData)Element)))
							{
								return;
							}
							else if (!(Element is FortressProgramsData))
							{
								return;
							}
							if (Element is FortressProgramsData)
							{
								var elem = (FortressProgramsData)Element;
								elem.FortressID = Fortress.id;
								elem.Strength = elem.Program.Strength;
								elem.Rezzed = true;
								Fortress.FortressPrograms.Add(elem);
							}
							SetSelectedItem(((NetItem)Element).NetObjType);
							break;
						case 6:
							var player = (PlayerData)Element;
							addPlayerToGrid(player, player.xPos, player.yPos);
							//subgridData.Fortress[0].FortressRemotes.push(newNetOBJ);
							break;
						case 7:
						case 8:
						case 9:
						case 10:
						case 11:
						case 12:
						case 13:
						case 14:
						case 15:
						case 16:
						case 17:
						case 18:
						case 19:
							if (Fortress.FortressRemotes.Contains((FortressRemotesData)Element))
							{
								return;
							}
							Fortress.FortressRemotes.Add((FortressRemotesData)Element);
							SetSelectedItem(((NetItem)Element).NetObjType);
							break;
					}
				}
			}
			else if(e.Action== NotifyCollectionChangedAction.Remove)
			{

			}
			InvokeAsync(()=> StateHasChanged());
		}
		List<AI_PersonalityData> AI_Personalities = new List<AI_PersonalityData>();
		List<AI_ICONData> AI_ICONs = new List<AI_ICONData>();
		protected override async Task OnInitializedAsync()
        {
            await base.OnInitializedAsync();
            bool isLoading = false;
            if (isLoading)
            {
                return;
            }
            try
            {
                isLoading = true;

                using (var ctx = db.CreateDbContext())
                {
                    var player = await ctx.Subgrid
                        .Include(p=>p.Fortress)
                        .Include(p => p.Fortress).ThenInclude(p=>p.FortressCodeGates)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressCodeGates).ThenInclude(p=>p.TypeNavigation)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressCPU).ThenInclude(p => p.TypeNavigation)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressMemory).ThenInclude(p => p.TypeNavigation)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressPrograms).ThenInclude(p => p.TypeNavigation)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressPrograms).ThenInclude(p => p.Program)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramFunction)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramOptions)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressPrograms).ThenInclude(p => p.Program).ThenInclude(x => x.ProgramType)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressRemotes).ThenInclude(p => p.TypeNavigation)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressWalls).ThenInclude(p => p.TypeNavigation)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressSkills)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressSkills).ThenInclude(p => p.Skill)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressSkills).ThenInclude(p => p.Skill).ThenInclude(p => p.Stat)
						.Include(p => p.Fortress).ThenInclude(p => p.FortressSkills).ThenInclude(p => p.Skill).ThenInclude(p => p.SkillTypeNavigation)
						.AsSplitQuery()
                        .Where(x => x.id == SubgridID).FirstAsync();
					NetOBJTypes = ctx.NetObjType.Select(x => (NetObjTypeData)x).ToList();
					if (player != null)
                    {
                        GridEntity = player;
                        grid = (SubgridData)player;
						Fortress = grid.Fortress[0];
					}
					ProgramList = await ctx.Program.Include(x => x.ProgramFunction).Where(x=>new List<int> { 3, 4, 7, 8, 9 }.Contains(x.ProgramTypeID??0)).Select(x=>(ProgramData)x).AsSplitQuery().ToListAsync();

					AI_Personalities = await ctx.AI_Personality.Select(x=>(AI_PersonalityData)x).ToListAsync();
					AI_ICONs = await ctx.AI_ICON.Select(x => (AI_ICONData)x).ToListAsync();
					

				}
                for(var y=0;y<grid.height;y++)
                {
                    netItemLookup.Add(y, new Dictionary<int, ObservableCollection<NetItem>>());
					for (var x=0;x<grid.width;x++)
                    {
						var newCollection = new ObservableCollection<NetItem>();
						newCollection.CollectionChanged += collectionChange;
						netItemLookup[y].Add(x, newCollection);
					}
                }
				foreach (var fort in grid.Fortress)
				{
					foreach (var wall in fort.FortressWalls)
					{
                        netItemLookup[wall.yPos][wall.xPos].Add(wall);
						
					}
					foreach (var wall in fort.FortressCodeGates)
					{
						netItemLookup[wall.yPos][wall.xPos].Add(wall);
						
					}
					foreach (var wall in fort.FortressCPU)
					{
						netItemLookup[wall.yPos][wall.xPos].Add(wall);
					}
					foreach (var wall in fort.FortressMemory)
					{
						netItemLookup[wall.yPos][wall.xPos].Add(wall);
					}
					foreach (var wall in fort.FortressPrograms)
					{
						runningPrograms[wall.UUID] = wall;
                        netItemLookup[wall.yPos][wall.xPos].Add(wall);
					}
					foreach (var wall in fort.FortressRemotes)
					{
						netItemLookup[wall.yPos][wall.xPos].Add(wall);
					}
				}

				hubConnection = new HubConnectionBuilder()
				.WithUrl(MyNavigationManager.ToAbsoluteUri("/com"))
				.WithAutomaticReconnect()
				.Build();

				hubConnection.On<int, int, int>("PlayerMove", PlayerMove);
				hubConnection.On<string,int,int>("ProgramMove", ProgramMove);
				hubConnection.On<string>("ProgramDeactivated", ProgramDeactivated);
				hubConnection.On<string>("ProgramDerezzed", ProgramDerezzed);
				hubConnection.On<PlayerData>("JackInRequestReceived", JackInRequestReceived);
                hubConnection.On<int>("PlayerCut", PlayerCut);
                hubConnection.On<string>("FortressAlerted", FortressAlerted);
				hubConnection.On<PlayerCyberdeckProgramsData>("ProgramAddedFromCyberdeck", ProgramAdded);
                hubConnection.On<PlayerComputerProgramsData>("ProgramAddedFromComputer", ProgramAdded);
				hubConnection.On<string>("ClientDisconnect", ClientDisconnect);

                await hubConnection.StartAsync();

			}
            catch (Exception ex)
            {
                Debug.Print(ex.Message);
            }
            finally
            {
                isLoading = false;
            }
        }

        private void ClientDisconnect(string connectionID)
        {
            if(JackedInPlayers.Values.Where(x=>x.ConnectionID== connectionID).Any())
			{
				PlayerCut(JackedInPlayers.Values.Where(x => x.ConnectionID == connectionID).First().id);
			}
        }

        private void ProgramAddedFromCyberdeck(PlayerCyberdeckProgramsData program)
		{
			ProgramAdded(program);
		}
        private void ProgramAddedFromComputer(PlayerComputerProgramsData program)
        {
            ProgramAdded(program);
        }
		Dictionary<string, RunningProgram> runningPrograms = new Dictionary<string, RunningProgram>();
		Dictionary<string, RunningProgram> desrezzedPrograms = new Dictionary<string, RunningProgram>();
		private void ProgramAdded(RunningProgram program)
        {
			runningPrograms[program.UUID] = program;
			GridLookup[program.yPos][program.xPos].ContainedItems.Add(program);
			program.CurrentTile = GridLookup[program.yPos][program.xPos];

            Debug.Print("hello");
        }
		private void ProgramDerezzed(string UUID)
		{
			RunningProgram program;
			if (runningPrograms.ContainsKey(UUID))
			{
				program = runningPrograms[UUID];
			}

			else
			{
				return;
			}
			runningPrograms.Remove(UUID);
			desrezzedPrograms[program.UUID] = program;
			if(GridLookup[program.yPos][program.xPos].ContainedItems.Contains(program))
			{
				GridLookup[program.yPos][program.xPos].ContainedItems.Remove(program);
			}
		}
		private void ProgramDeactivated(string UUID)
		{
			RunningProgram program;
			if (runningPrograms.ContainsKey(UUID))
			{
				program = runningPrograms[UUID];
			}
			
			else if(desrezzedPrograms.ContainsKey(UUID))
			{
				program = desrezzedPrograms[UUID];
			}
			else
			{
				return;
			}
			runningPrograms.Remove(program.UUID);
			desrezzedPrograms.Remove(program.UUID);
			if (GridLookup[program.yPos][program.xPos].ContainedItems.Contains(program))
			{
				GridLookup[program.yPos][program.xPos].ContainedItems.Remove(program);
			}
			program.CurrentTile = null;
		}


		string AlertText = "";
		bool FortressHasBeenAlerted = false;
        private void FortressAlerted(string AlertText)
		{
			this.AlertText = AlertText;
		}
        private void PlayerCut(int PlayerID)
        {
            var player = JackedInPlayers[PlayerID];
            player.CurrentTile.ContainedItems.Remove(player);
			JackedInPlayers.Remove(PlayerID);
        }

        async void Save()
		{
			using (var ctx = db.CreateDbContext())
			{
				ctx.Attach(GridEntity);
				SubgridData.CopyProperties(grid, GridEntity, ctx);
				await ctx.SaveChangesAsync();
				ctx.Entry(GridEntity).Reload();
				grid = (SubgridData)GridEntity;

			}
		}

        public void Dispose()
        {
            if (hubConnection is not null)
            {
                hubConnection.DisposeAsync();
            }
            for (var y = 0; y < grid.height; y++)
            {
                for (var x = 0; x < grid.width; x++)
                {
                    var newCollection = netItemLookup[y][x];
                    newCollection.CollectionChanged -= collectionChange;
                    netItemLookup[y].Add(x, newCollection);
                }
            }
            netItemLookup.Clear();
        }
    }
}
