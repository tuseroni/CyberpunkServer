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
    
    public partial class PlayerCyberdeckData
    {
        public PlayerCyberdeckData()
        {
            this.CyberdeckImprovements = new List<CyberdeckImprovementsData>();
            this.CyberdeckOptions = new List<CyberdeckOptionsData>();
            this.Program = new List<ProgramData>();
        }

        public int id { get; set; }
        public string name { get; set; }
        public Nullable<int> CyberdeckID { get; set; }
        public Nullable<int> PlayerID { get; set; }
        public string description { get; set; }

        public virtual CyberdeckData Cyberdeck { get; set; }
        public virtual PlayerData Player { get; set; }
        public virtual List<PlayerCyberdeckOptionsData> CyberdeckOptions { get; set; }
        public virtual List<PlayerCyberdeckImprovementsData> PlayerCyberdeckImprovements { get; set; }
        public virtual ICollection<ProgramData> Program { get; set; }
    }
}
