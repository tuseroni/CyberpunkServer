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
    
    public partial class FortressMemory
    {
        public int id { get; set; }
        public Nullable<int> xPos { get; set; }
        public Nullable<int> yPos { get; set; }
        public Nullable<int> FortressID { get; set; }
        public int Type { get; set; }
    
        public virtual Fortress Fortress { get; set; }
        public virtual NetObjType NetObjType { get; set; }
    }
}
