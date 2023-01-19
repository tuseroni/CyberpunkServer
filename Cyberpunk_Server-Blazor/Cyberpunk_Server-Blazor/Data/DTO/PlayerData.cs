//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CyberpunkServer.Models.DTO
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    [Serializable]
    public partial class PlayerData:iAddPrograms
    {
        
        public PlayerData()
        {
            this.PlayerArmor = new List<PlayerArmorData>();
            this.PlayerCybernetics = new List<PlayerCyberneticsData>();
            this.PlayerSkill = new List<PlayerSkillData>();
            this.PlayerStat = new List<PlayerStatData>();
            this.PlayerWeapon = new List<PlayerWeaponData>();
            this.PlayerComputer = new List<PlayerComputerData>();
            this.PlayerCyberdeck = new List<PlayerCyberdeckData>();
            this.PlayerPrograms = new List<PlayerProgramsData>();
        }
        public Dictionary<string,PlayerSkillData> SkillLookup { get; set; }
        public Dictionary<string, PlayerStatData> StatLookup { get; set; }
        


        public int id { get; set; }
        public string Handle { get; set; }
        public string SIN { get; set; }
        public int IP { get; set; }
        public int REP { get; set; }
        public int Humanity { get; set; }
        public int Dammage { get; set; }
        public Nullable<int> RoleID { get; set; }
        public string aspUserID { get; set; }
        public int xPos { get; set; }
        public int yPos { get; set; }
		public int Type { get; set; }
		public NetObjTypeData NetObjType { get; set; }
		public NetObjTypeData TypeNavigation 
        {
            get
            {
                return NetObjType;
            }
            set
            {
                NetObjType = value;
            }
        }
		

		public virtual PlayerRolesData PlayerRoles { get; set; }
        public virtual List<PlayerArmorData> PlayerArmor { get; set; }
        public virtual List<PlayerCyberneticsData> PlayerCybernetics { get; set; }
        public virtual List<PlayerSkillData> PlayerSkill { get; set; }
        public virtual List<PlayerStatData> PlayerStat { get; set; }
        public virtual List<PlayerWeaponData> PlayerWeapon { get; set; }
        public virtual List<PlayerComputerData> PlayerComputer { get; set; }
        public virtual List<PlayerCyberdeckData> PlayerCyberdeck { get; set; }
        public virtual List<PlayerProgramsData> PlayerPrograms { get; set; }
        [Newtonsoft.Json.JsonIgnore]
        public virtual AspNetUsersData AspNetUsers { get; set; }
		public bool addProgram(ProgramData program)
		{
			var newprog = new PlayerProgramsData
			{
				Program = program,
				ProgramID = program.id,
				Strength = program.Strength,
				Rezzed = false,
                PlayerID = id
			};
			PlayerPrograms.Add(newprog);
			return true;
		}
		public bool addProgram(List<ProgramData> programs)
		{
			foreach (var program in programs)
			{
				addProgram(program);
			}
			return true;
		}
		Guid _uuid = Guid.NewGuid();
		public string UUID
		{
			get
			{
				return _uuid.ToString();
			}
		}

		public string name { get => Handle; set => Handle=value; }
	}
}