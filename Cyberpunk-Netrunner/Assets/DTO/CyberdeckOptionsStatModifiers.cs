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
    public partial class CyberdeckOptionsStatModifiersData
    {
        public virtual int id { get; set; }
        public virtual string name { get; set; }
        public virtual Nullable<int> StatID { get; set; }
        public virtual int Modifier { get; set; }
        public virtual StatData Stat { get; set; }
        public Nullable<int> CyberdeckOptionID { get; set; }
    }
}