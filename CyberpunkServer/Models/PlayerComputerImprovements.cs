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
    
    public partial class PlayerComputerImprovements
    {
        public int id { get; set; }
        public Nullable<int> PlayerComputerID { get; set; }
        public Nullable<int> ComputerImprovementsID { get; set; }
        public Nullable<int> Quantity { get; set; }
    
        public virtual ComputerImprovements ComputerImprovements { get; set; }
        public virtual PlayerComputer PlayerComputer { get; set; }
    }
}
