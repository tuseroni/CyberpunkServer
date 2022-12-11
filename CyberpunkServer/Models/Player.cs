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
    
    public partial class Player
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Player()
        {
            this.PlayerArmor = new HashSet<PlayerArmor>();
            this.PlayerComputer = new HashSet<PlayerComputer>();
            this.PlayerCyberdeck = new HashSet<PlayerCyberdeck>();
            this.PlayerCybernetics = new HashSet<PlayerCybernetics>();
            this.PlayerSkill = new HashSet<PlayerSkill>();
            this.PlayerStat = new HashSet<PlayerStat>();
            this.PlayerWeapon = new HashSet<PlayerWeapon>();
            this.Program = new HashSet<Program>();
        }
    
        public int id { get; set; }
        public string Handle { get; set; }
        public string SIN { get; set; }
        public int IP { get; set; }
        public int REP { get; set; }
        public int Humanity { get; set; }
        public int Dammage { get; set; }
        public Nullable<int> RoleID { get; set; }
        public string aspUserID { get; set; }
    
        public virtual AspNetUsers AspNetUsers { get; set; }
        public virtual PlayerRoles PlayerRoles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerArmor> PlayerArmor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerComputer> PlayerComputer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerCyberdeck> PlayerCyberdeck { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerCybernetics> PlayerCybernetics { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerSkill> PlayerSkill { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerStat> PlayerStat { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerWeapon> PlayerWeapon { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Program> Program { get; set; }
    }
}
