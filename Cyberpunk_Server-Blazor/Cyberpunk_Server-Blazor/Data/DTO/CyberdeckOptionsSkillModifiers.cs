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
    public partial class CyberdeckOptionsSkillModifiersData
    {
        public int id { get; set; }
        public string name { get; set; }
        public Nullable<int> SkillID { get; set; }
        public int Modifier { get; set; }
        public SkillData Skill { get; set; }
        public Nullable<int> CyberdeckOptionID { get; set; }
    
    }
}
