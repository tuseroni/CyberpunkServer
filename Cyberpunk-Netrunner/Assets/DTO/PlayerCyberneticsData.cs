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

    public partial class PlayerCyberneticsData
    {
        public int id { get; set; }
        public Nullable<int> HL { get; set; }
        public Nullable<int> Cost { get; set; }
        public Nullable<int> CyberneticID { get; set; }
        public Nullable<int> PlayerID { get; set; }
    
        public virtual CyberneticsData Cybernetics { get; set; }
       
    }
}
