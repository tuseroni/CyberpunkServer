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
    public class PlayerCyberdeckProgramsData
    {
        public int id { get; set; }
        public Nullable<int> ProgramID { get; set; }
        public Nullable<int> PlayerCyberdeckID { get; set; }
        public bool Rezzed { get; set; }
        public Nullable<int> Strength { get; set; }
        public virtual Program Program { get; set; }
    }
}