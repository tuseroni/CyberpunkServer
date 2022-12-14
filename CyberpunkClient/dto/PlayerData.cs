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
    using System.Data.Entity;

    public partial class PlayerData
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PlayerData()
        {
            this.PlayerArmor = new HashSet<PlayerArmorData>();
            this.PlayerCybernetics = new HashSet<PlayerCyberneticsData>();
            this.PlayerSkill = new List<PlayerSkillData>();
            this.PlayerStat = new List<PlayerStatData>();
            this.PlayerWeapon = new HashSet<PlayerWeaponData>();
        }
        public Dictionary<int,PlayerSkillData> SkillLookup { get; set; }
        public Dictionary<string, PlayerStatData> StatLookup { get; set; }
        public static explicit operator PlayerData(CyberpunkServer.Models.Player player)
        {
            var ret = new PlayerData
            {
                id = player.id,
                Handle = player.Handle,
                SIN = player.SIN,
                IP=player.IP,
                REP=player.REP,
                Humanity=player.Humanity,
                Dammage=player.Dammage,
                RoleID=player.RoleID,
                aspUserID=player.aspUserID
            };
            ret.PlayerStat=DTO.PlayerStatData.ConvertList(player.PlayerStat).ToList();
            ret.PlayerArmor = DTO.PlayerArmorData.ConvertList(player.PlayerArmor);
            ret.PlayerCybernetics = DTO.PlayerCyberneticsData.ConvertList(player.PlayerCybernetics);
            ret.PlayerWeapon = DTO.PlayerWeaponData.ConvertList(player.PlayerWeapon);
            ret.PlayerSkill = DTO.PlayerSkillData.ConvertList(player.PlayerSkill).ToList();
            ret.SkillLookup = ret.PlayerSkill.ToDictionary(x => x.id, x => x);
            ret.StatLookup = ret.PlayerStat.ToDictionary(x => x.Stat.ABBR, x => x);
            return ret;
        }
        


        public int id { get; set; }
        public string Handle { get; set; }
        public string SIN { get; set; }
        public Nullable<int> IP { get; set; }
        public Nullable<int> REP { get; set; }
        public Nullable<int> Humanity { get; set; }
        public Nullable<int> Dammage { get; set; }
        public Nullable<int> RoleID { get; set; }
        public string aspUserID { get; set; }
    
        public virtual PlayerRolesData PlayerRoles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerArmorData> PlayerArmor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerCyberneticsData> PlayerCybernetics { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual List<PlayerSkillData> PlayerSkill { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual List<PlayerStatData> PlayerStat { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerWeaponData> PlayerWeapon { get; set; }
        [Newtonsoft.Json.JsonIgnore]
        public virtual AspNetUsersData AspNetUsers { get; set; }
    }
}
