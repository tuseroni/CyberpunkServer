﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;

namespace CyberpunkServer.Models.DTO
{
    public partial class PlayerComputerOptionsData
    {
        public int id { get; set; }
        public Nullable<int> PlayerComputerID { get; set; }
        public Nullable<int> ComputerPeripheralsID { get; set; }

        public virtual ComputerPeripheralsData ComputerPeripherals { get; set; }
    }
}