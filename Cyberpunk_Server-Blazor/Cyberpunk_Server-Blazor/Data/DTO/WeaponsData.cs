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

    public partial class WeaponsData
    {
        
        public WeaponsData()
        {
            
        }
    
        public int id { get; set; }
        public string Name { get; set; }
        public Nullable<int> NumDice { get; set; }
        public Nullable<int> DiceType { get; set; }
        public Nullable<int> Bonus { get; set; }
        public Nullable<int> ROF { get; set; }
        public Nullable<int> REL { get; set; }
        public Nullable<int> Type { get; set; }
        public Nullable<int> Conc { get; set; }
        public Nullable<int> Shots1 { get; set; }
        public Nullable<int> Shots2 { get; set; }
        public Nullable<int> Range { get; set; }
        public string Description { get; set; }
        public virtual WeaponConcTypesData WeaponConcTypes { get; set; }
        public virtual WeaponTypesData WeaponTypes { get; set; }
    }
}