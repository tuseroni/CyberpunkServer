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
    
    public partial class ComputerData
    {
        
        public ComputerData()
        {
            
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public int Memory { get; set; }
        public int Speed { get; set; }
        public int Int { get; set; }
        public int NumCPU { get; set; }
        public bool IsPortable { get; set; }
        public bool IsCyberEnabled { get; set; }
        public double BateryHours { get; set; }
        public int WallStrength { get; set; }
        public double PriceLow { get; set; }
        public double PriceHigh { get; set; }
        public int NumSlots { get; set; }
        public int Chipslots { get; set; }
        public string Description { get; set; }
    
    }
}