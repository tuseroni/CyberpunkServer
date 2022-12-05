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

    public partial class StatData
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public StatData()
        {
            this.PlayerStat = new HashSet<PlayerStatData>();
            this.Skill = new HashSet<SkillData>();
        }
        public static explicit operator StatData(CyberpunkServer.Models.Stat player)
        {
            var ret = new StatData
            {
                id = player.id,
                Name = player.Name,
                Description = player.Description,
                ABBR = player.ABBR
            };
            
            return ret;
        }

        public int id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ABBR { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        [Newtonsoft.Json.JsonIgnore]
        public virtual ICollection<PlayerStatData> PlayerStat { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        [Newtonsoft.Json.JsonIgnore]
        public virtual ICollection<SkillData> Skill { get; set; }
    }
}
