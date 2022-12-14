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
    
    public partial class PlayerComputer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PlayerComputer()
        {
            this.PlayerComputerImprovements = new HashSet<PlayerComputerImprovements>();
            this.PlayerComputerOptions = new HashSet<PlayerComputerOptions>();
            this.PlayerComputerPrograms = new HashSet<PlayerComputerPrograms>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public Nullable<int> ComputerID { get; set; }
        public Nullable<int> PlayerID { get; set; }
        public string description { get; set; }
        public bool isCyberEnabled { get; set; }
    
        public virtual Computer Computer { get; set; }
        public virtual Player Player { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerComputerImprovements> PlayerComputerImprovements { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerComputerOptions> PlayerComputerOptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerComputerPrograms> PlayerComputerPrograms { get; set; }
    }
}
