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
    
    public partial class CyberdeckImprovements
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CyberdeckImprovements()
        {
            this.PlayerCyberdeckImprovements = new HashSet<PlayerCyberdeckImprovements>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string ImprovementFor { get; set; }
        public int ImprovementAmount { get; set; }
        public double CostLow { get; set; }
        public double CostHigh { get; set; }
        public string Description { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerCyberdeckImprovements> PlayerCyberdeckImprovements { get; set; }
    }
}
