using CyberpunkServer.Models.DTO;
using Microsoft.AspNetCore.Components;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace Cyberpunk_Server_Blazor.Pages.Electronics
{
	public partial class ProgramController<T> where T:RunningProgram
	{
		[Parameter] public List<T> ProgList { get; set; } = new List<T>();
		[Parameter] public List<PlayerProgramsData> PlayerProgramList { get; set; } = new List<PlayerProgramsData>();
		[Parameter] public T prog { get; set; }
		[Parameter] public EventCallback ElemRemoved { get; set; }
		[Parameter] public Dictionary<string, iAddPrograms> lstDevices { get; set; } = new Dictionary<string, iAddPrograms>();
		string _installDestination = "";
		public string InstallDestination
		{
			get
			{
				return _installDestination;
			}
			set
			{
				_installDestination = value;
				if (lstDevices.ContainsKey(_installDestination))
				{
					install(lstDevices[_installDestination]);
					uninstall();
				}
			}
		}
		bool ShowInstall { get; set; } = false;
		public string InstallUninstall
		{
			get
			{
				if(prog is PlayerComputerProgramsData || prog is PlayerCyberdeckProgramsData)
				{
					return "Uninstall";
				}
				else
				{
					return "Install";
				}
			}
		}
		void install(iAddPrograms dest)
		{
				lstDevices[_installDestination].addProgram(prog.Program);
				
		}
		void uninstall()
		{
			ProgList.Remove(prog);
			ElemRemoved.InvokeAsync();
		}
		public void ChangeInstall()
		{
			if(InstallUninstall=="Uninstall")
			{
				if(ProgList.Contains(prog))
				{
					var SelectedProgram = prog.Program;
					var newprog = new PlayerProgramsData
					{
						Program = SelectedProgram,
						ProgramID = SelectedProgram.id,
						Strength = SelectedProgram.Strength,
						Rezzed = false

					};

					ProgList.Remove(prog);
					PlayerProgramList.Add(newprog);
					ElemRemoved.InvokeAsync();
				}
				
			}
			else
			{
				ShowInstall = !ShowInstall;
			}
		}
		public void Delete()
		{
			if(ProgList.Contains(prog))
			{
				ProgList.Remove(prog);
				ElemRemoved.InvokeAsync();
			}
		}
	}
}
