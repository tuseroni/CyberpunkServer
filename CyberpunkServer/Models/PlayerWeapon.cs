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
    
    public partial class PlayerWeapon
    {
        public int id { get; set; }
        public Nullable<int> WeaponID { get; set; }
        public Nullable<int> PlayerID { get; set; }
    
        public virtual Player Player { get; set; }
        public virtual Weapons Weapons { get; set; }
    }
}
