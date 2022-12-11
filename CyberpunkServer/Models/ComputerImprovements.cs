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
    
    public partial class ComputerImprovements
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ComputerImprovements()
        {
            this.PlayerComputer = new HashSet<PlayerComputer>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string ImprovementFor { get; set; }
        public int ImprovementAmount { get; set; }
        public double CostLow { get; set; }
        public double CostHigh { get; set; }
        public int UnitTypeID { get; set; }
        public string Description { get; set; }
        public double Slots { get; set; }
    
        public virtual Units Units { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlayerComputer> PlayerComputer { get; set; }
    }
}
