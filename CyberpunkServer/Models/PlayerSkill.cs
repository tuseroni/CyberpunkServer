//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CyberpunkServer.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PlayerSkill
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PlayerSkill()
        {
            this.PlayerSkillModifiers = new HashSet<PlayerSkillModifiers>();
        }
    
        public int id { get; set; }
        public Nullable<int> Ranks { get; set; }
        public Nullable<int> Bonus { get; set; }
        public Nullable<int> CurrentIP { get; set; }
        public Nullable<int> PlayerID { get; set; }
        public Nullable<int> SkillID { get; set; }
    
        public virtual Player Player { get; set; }
        public virtual Skill Skill { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerSkillModifiers> PlayerSkillModifiers { get; set; }
    }
}
