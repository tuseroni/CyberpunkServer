using CyberpunkServer.Models.DTO;
using Microsoft.AspNetCore.Components;
using Microsoft.EntityFrameworkCore;

namespace Cyberpunk_Server_Blazor.Pages.Electronics
{
	public partial class Computers
	{
		[Parameter] public PlayerComputerData elem { get; set; }
		[Parameter] public List<PlayerProgramsData> PlayerProgramList { get; set; }
		[Parameter] public EventCallback ElemRemoved { get; set; }
		public int TotalMU
		{
			get
			{
				return (elem?.TotalMemory ?? 0) * 10;
			}
			set
			{

			}
		}
		
		public int AvailableMU
		{
			get
			{
				return TotalMU - (elem?.TotalMemoryCost ?? 0);
			}
			set
			{

			}
		}
		[Parameter] public List<ProgramData> ProgramDatas { get; set; }
		private int SelectedProgramID;
		//protected override async Task OnInitializedAsync()
		//{
		//	//await base.OnInitializedAsync();
		//	using (var ctx = db.CreateDbContext())
		//	{
		//		var dt = await ctx.Program.ToListAsync();
		//		ProgramDatas = ProgramData.ConvertList(dt);
		//	}
		//}
		protected void ListChange()
		{
			StateHasChanged();
			ElemRemoved.InvokeAsync();
		}
		protected void addProgram()
		{
			var SelectedProgram = ProgramDatas[SelectedProgramID];
			var newprog = new PlayerComputerProgramsData
			{
				Program = SelectedProgram,
				ProgramID = SelectedProgram.id,
				Strength = SelectedProgram.Strength,
				Rezzed = false,
				PlayerComputerID = elem.id,

			};
			elem.PlayerComputerPrograms.Add(newprog);
		}
	}
}
