using CyberpunkServer.Models.DTO;
using CyberpunkServer.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using Microsoft.JSInterop;

namespace Cyberpunk_Server_Blazor.Pages.Tools
{
	public partial class GoonGenerator
	{
		protected class Cyberwear
		{
			public string name = "";
			public Dictionary<int, string> options = new Dictionary<int, string>();
			public Cyberwear(string name, Dictionary<int, string> options)
			{
				this.name = name;
				this.options = options;
			}
		}
		
		string GoonHandle = "Goon";
		string GoonSIN = "123-45-6789";
		int GoonDamage = 0;
		PlayerRolesData GoonRole;
		List<PlayerSkillData> GoonSkills = new List<PlayerSkillData>();
		List<PlayerStatData> GoonStats = new List<PlayerStatData>();
		List<string> GoonCybernetics = new List<string>();
		string GoonArmour = "";
		string GoonWeapon = "";

		Dictionary<int, string> WeaponLookup = new Dictionary<int, string>
		{
			{ 1,"Knife"},
			{ 2,"Light Pistol"},
			{ 3,"Medium Pistol"},
			{ 4,"Heavy Pistol"},
			{ 5,"Heavy Pistol"},
			{ 6,"Light SMG"},
			{ 7,"Lt. Assault Rifle"},
			{ 8,"Med. Assault Rifle"},
			{ 9,"Hvy. Assault Rifle"},
			{ 10,"Hvy. Assault Rifle"},
		};
		Dictionary<int, string> ArmourLookup = new Dictionary<int, string>
		{
			{ 1,"Heavy Leather"},
			{ 2,"Armor vest"},
			{ 3,"Light Armor Jacket"},
			{ 4,"Light Armor Jacket"},
			{ 5,"Med Armor Jacket"},
			{ 6,"Med Armor Jacket"},
			{ 7,"Med Armor Jacket"},
			{ 8,"Hvy. Armor Jacket"},
			{ 9,"Hvy. Armor Jacket"},
			{ 10,"MetalGear&trade;"}
		};
		List<SkillData> skills = new List<SkillData>();
		List<StatData> stats= new List<StatData>();
		List<PlayerRolesData> Roles = new List<PlayerRolesData>();
		Dictionary<int, Cyberwear> CyberwearLookup = new Dictionary<int, Cyberwear>
		{
			{1,new Cyberwear("CyberOptics",new Dictionary<int, string>
			{
				{1,"Infrared"},
				{2,"Lowlight"},
				{3,"Camera"},
				{4,"Dartgun"},
				{5,"Antidazzle"},
				{6,"Targeting scope"},
			})},
			{2,new Cyberwear("Cyberarm with gun",new Dictionary<int, string>
			{
				{1,"Med. Pisto"},
				{2,"Light Pistol"},
				{3,"Med. Pistol"},
				{4,"Light Submachinegun "},
				{5,"Very Heavy Pistol "},
				{6,"Heavy Pistol"},
			})},
			{3,new Cyberwear("Cyberaudio",new Dictionary<int, string>
			{
				{1,"Wearman&trade;"},
				{2,"Radio Splice"},
				{3,"Phonelink"},
				{4,"Amplified Hearing"},
				{5,"Sound Editing"},
				{6,"Digital Recording Link"},
			})},
			{4,new Cyberwear("Big Knucks",new Dictionary<int, string>())},
			{5,new Cyberwear("Rippers",new Dictionary<int, string>())},
			{6,new Cyberwear("Vampires",new Dictionary<int, string>())},
			{7,new Cyberwear("Slice 'n Dice",new Dictionary<int, string>())},
			{8,new Cyberwear("Reflex Boost (Kerenzikov)",new Dictionary<int, string>())},
			{9,new Cyberwear("Reflex Boost (Sandevistan)",new Dictionary<int, string>())},
			{10,new Cyberwear("Nothing",new Dictionary<int, string>())},
		};
		List<string> getCybernetics(int numCyber=3)
		{

			List<string> ret = new List<string>();
			for(var i=0;i<numCyber;i++)
			{
				var d10=Shared.Utilities.Dice.RollD10();
				var cyber = CyberwearLookup[d10];
				if(ret.Contains(cyber.name))
				{
					i--;
					continue;
				}
				if(d10==10)
				{
					continue;
				}
				ret.Add(cyber.name);
				if(cyber.options.Count>0)
				{
					var d6 = Shared.Utilities.Dice.RollD6();
					ret.Add(cyber.options[d6]);
				}
			}
			
			return ret;
		}
		PlayerRolesData getRole()
		{
			var index = Shared.Utilities.Dice.GetRandomRange(0, Roles.Count);
			return Roles[index];
		}
		string getWeapon(int bonus=0)
		{
			var d10 = Shared.Utilities.Dice.RollD10() +bonus;
			if (d10 > 10)
			{
				d10 = 10;
			}
			return WeaponLookup[d10];
		}
		string getArmour(int bonus=0)
		{
			var d10 = Shared.Utilities.Dice.RollD10() + bonus;
			if (d10 > 10)
			{
				d10 = 10;
			}
			return ArmourLookup[d10];
		}
		List<PlayerStatData> getStats()
		{
			List<PlayerStatData> ret = new List<PlayerStatData>();
			foreach (var stat in stats)
			{
				var ranks = Shared.Utilities.Dice.RollND6(2);
				while (ranks > 10)
				{
					ranks = Shared.Utilities.Dice.RollND6(2);
				}
				var statdat = new PlayerStatData
				{
					Base = ranks,
					Stat=stat
				};
				ret.Add(statdat);
				StatLookup.Add(stat.ABBR, statdat);
			}
			return ret;
		}
		Dictionary<string, PlayerStatData> StatLookup = new Dictionary<string, PlayerStatData>();

		void Generate()
		{
			GoonRole = getRole();
			GoonHandle = $"{GoonRole.Name} Goon";
			int bonus = 0;
			int numCyber = 3;
			int SkillPoints = 40;
			if(GoonRole.id==1)
			{
				bonus = 3;
				numCyber = 6;
			}
			GoonArmour = getArmour(bonus);
			GoonWeapon = getWeapon(bonus);
			GoonCybernetics = getCybernetics(numCyber);
			GoonStats = getStats();
			List<PlayerSkillData> skillsToAssign = new List<PlayerSkillData>();
			foreach (var skill in GoonRole.Skill)
			{
				var goonSkill = new PlayerSkillData
				{
					Skill = skill,
					Ranks = 1 //i think the minimum is 1, if it's actually 2 i will adjust this to 2.
				};
				GoonSkills.Add(goonSkill);
				skillsToAssign.Add(goonSkill);
				SkillPoints--;
			}
			while(SkillPoints>0)
			{
				//assign random points at random
				if(skillsToAssign.Count==1)
				{
					skillsToAssign[0].Ranks = SkillPoints;//it's possible this gives this random skill more than 10 ranks, i may need to consider this.
					break;
				}
				var ranks = (int)Math.Ceiling(Shared.Utilities.Dice.RollND10(2)/2.0f);//this is to make it more likely to be in the mid range
				var skill = skillsToAssign[Shared.Utilities.Dice.GetRandomRange(0, skillsToAssign.Count)];
				skill.Ranks = ranks;
				skillsToAssign.Remove(skill); //once i've assigned i don't wanna hit it again
				SkillPoints -= ranks;
			}

		}
		protected override async Task OnAfterRenderAsync(bool firstRender)
		{
			await base.OnAfterRenderAsync(firstRender);
			await JS.InvokeAsync<string>("registerTabs");

		}
		bool isLoading = false;
		protected override async Task OnInitializedAsync()
		{
			await base.OnInitializedAsync();
			
			if (isLoading)
			{
				return;
			}
			try
			{
				isLoading = true;

				using (var ctx = db.CreateDbContext())
				{
					skills = await ctx.Skill.Select(x => (SkillData)x).ToListAsync();
					stats = await ctx.Stat.Include(x=>x.Skill)
						.ThenInclude(x=>x.SkillTypeNavigation)
						.AsSplitQuery()
						.Select(x => (StatData)x).ToListAsync();
					Roles = await ctx.PlayerRoles.Include(x=>x.Skill).Select(x => (PlayerRolesData)x).ToListAsync();
				}
				
			}
			catch (Exception ex)
			{
				Console.WriteLine(ex.Message);
			}
			finally
			{
				
			}
			Generate();
			isLoading = false;
		}

	}
}
