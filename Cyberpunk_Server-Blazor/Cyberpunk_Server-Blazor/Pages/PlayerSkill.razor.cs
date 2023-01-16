using CyberpunkServer.Models.DTO;
using Microsoft.AspNetCore.Components;
using Microsoft.EntityFrameworkCore;

namespace Cyberpunk_Server_Blazor.Pages
{
	public partial class PlayerSkill
	{
		[Parameter] public PlayerData Model { get; set; }
	}
}
