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

    public partial class PlayerArmorData
    {
        public int id { get; set; }
        public string Name { get; set; }
        public Nullable<int> SP { get; set; }
        public Nullable<int> LocationID { get; set; }
        public Nullable<int> CurrentSP { get; set; }
        public Nullable<int> Encumberance { get; set; }
        public Nullable<int> PlayerID { get; set; }
        public string Description { get; set; }
    
        public virtual ArmorLocationsData ArmorLocations { get; set; }
        public virtual PlayerData Player { get; set; }
       
    }
}