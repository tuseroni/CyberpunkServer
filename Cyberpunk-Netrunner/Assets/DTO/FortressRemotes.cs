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

    public partial class FortressRemotesData
    {
        public int id { get; set; }
        public int xPos { get; set; }
        public int yPos { get; set; }
        public int FortressID { get; set; }
        public int Type { get; set; }
        [Newtonsoft.Json.JsonIgnore]

        public virtual FortressData Fortress { get; set; }
        [Newtonsoft.Json.JsonIgnore]
        public virtual NetObjTypeData NetObjType { get; set; }
    }
}
