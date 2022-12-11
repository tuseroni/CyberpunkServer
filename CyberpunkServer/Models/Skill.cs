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
    
    public partial class Skill
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Skill()
        {
            this.ComputerPeripheralSkillModifiers = new HashSet<ComputerPeripheralSkillModifiers>();
            this.CyberdeckOptionsSkillModifiers = new HashSet<CyberdeckOptionsSkillModifiers>();
            this.FortressSkills = new HashSet<FortressSkills>();
            this.PlayerSkill = new HashSet<PlayerSkill>();
        }
    
        public int id { get; set; }
        public string Name { get; set; }
        public Nullable<int> SkillType { get; set; }
        public Nullable<int> StatID { get; set; }
        public string Description { get; set; }
        public int Multiplier { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ComputerPeripheralSkillModifiers> ComputerPeripheralSkillModifiers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CyberdeckOptionsSkillModifiers> CyberdeckOptionsSkillModifiers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FortressSkills> FortressSkills { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerSkill> PlayerSkill { get; set; }
        public virtual Stat Stat { get; set; }
        public virtual Skill Skill1 { get; set; }
        public virtual Skill Skill2 { get; set; }
        public virtual SkillTypes SkillTypes { get; set; }
    }
}
