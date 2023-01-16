using CyberpunkServer.Models.DTO;
using Microsoft.AspNetCore.Components;
using Microsoft.CodeAnalysis.Options;
using Microsoft.EntityFrameworkCore;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Cyberpunk_Server_Blazor.Pages
{
	public partial class GearPage
	{
		PlayerData _model;

		[Parameter] public PlayerData Model 
		{ 
			get
			{
				return _model;
			}
			set
			{
				_model = value;
				lstDevices.Clear();
				foreach (var elem in Model.PlayerCyberdeck)
				{
					lstDevices.Add(elem.UUID, elem);
				}
				foreach (var elem in Model.PlayerComputer)
				{
					lstDevices.Add(elem.UUID, elem);
				}
			}
		}
		public List<ProgramData> ProgramDatas = new List<ProgramData>();
		private int SelectedProgramID;
		Dictionary<string, iAddPrograms> lstDevices { get; set; } = new Dictionary<string, iAddPrograms>();
		protected override async Task OnInitializedAsync()
		{
			//await base.OnInitializedAsync();
			using (var ctx = db.CreateDbContext())
			{
				var dt = await ctx.Program.ToListAsync();
				ProgramDatas = ProgramData.ConvertList(dt);
			}
		}
		protected void ListChange()
		{
			StateHasChanged();
		}
		protected void addProgram()
		{
			var SelectedProgram = ProgramDatas[SelectedProgramID];
			var newprog = new PlayerProgramsData
			{
				Program = SelectedProgram,
				ProgramID = SelectedProgram.id,
				Strength = SelectedProgram.Strength,
				Rezzed = false,
				PlayerID = Model.id,

			};
			Model.PlayerPrograms.Add(newprog);
		}
	}
}
