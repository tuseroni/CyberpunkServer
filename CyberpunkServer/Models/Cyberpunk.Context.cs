﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CyberpunkEntities : DbContext
    {
        public CyberpunkEntities()
            : base("name=CyberpunkEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ArmorLocations> ArmorLocations { get; set; }
        public virtual DbSet<Cybernetics> Cybernetics { get; set; }
        public virtual DbSet<CyberneticTypes> CyberneticTypes { get; set; }
        public virtual DbSet<Fortress> Fortress { get; set; }
        public virtual DbSet<FortressCodeGates> FortressCodeGates { get; set; }
        public virtual DbSet<FortressCPU> FortressCPU { get; set; }
        public virtual DbSet<FortressMemory> FortressMemory { get; set; }
        public virtual DbSet<FortressWalls> FortressWalls { get; set; }
        public virtual DbSet<NetObjType> NetObjType { get; set; }
        public virtual DbSet<Player> Player { get; set; }
        public virtual DbSet<PlayerArmor> PlayerArmor { get; set; }
        public virtual DbSet<PlayerCybernetics> PlayerCybernetics { get; set; }
        public virtual DbSet<PlayerRoles> PlayerRoles { get; set; }
        public virtual DbSet<PlayerSkill> PlayerSkill { get; set; }
        public virtual DbSet<PlayerStat> PlayerStat { get; set; }
        public virtual DbSet<PlayerWeapon> PlayerWeapon { get; set; }
        public virtual DbSet<Skill> Skill { get; set; }
        public virtual DbSet<SkillTypes> SkillTypes { get; set; }
        public virtual DbSet<Stat> Stat { get; set; }
        public virtual DbSet<Subgrid> Subgrid { get; set; }
        public virtual DbSet<SurgicalCode> SurgicalCode { get; set; }
        public virtual DbSet<WeaponConcTypes> WeaponConcTypes { get; set; }
        public virtual DbSet<Weapons> Weapons { get; set; }
        public virtual DbSet<WeaponTypes> WeaponTypes { get; set; }
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AspNetRoles> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
    }
}