using System;
using System.Collections.Generic;
using Cyberpunk_Server_Blazor;
using Microsoft.EntityFrameworkCore;

namespace CyberpunkServer.Models;

public partial class CyberpunkEntities : DbContext
{
    public CyberpunkEntities()
    {
    }

    public CyberpunkEntities(DbContextOptions<CyberpunkEntities> options)
        : base(options)
    {
    }

    public virtual DbSet<ArmorLocations> ArmorLocations { get; set; }

    public virtual DbSet<AspNetRoleClaims> AspNetRoleClaims { get; set; }

    public virtual DbSet<AspNetRoles> AspNetRoles { get; set; }

    public virtual DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }

    public virtual DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }

    public virtual DbSet<AspNetUserTokens> AspNetUserTokens { get; set; }

    public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }

    public virtual DbSet<Computer> Computer { get; set; }

    public virtual DbSet<ComputerImprovements> ComputerImprovements { get; set; }

    public virtual DbSet<ComputerPeripheralSkillModifiers> ComputerPeripheralSkillModifiers { get; set; }

    public virtual DbSet<ComputerPeripheralStatModifiers> ComputerPeripheralStatModifiers { get; set; }

    public virtual DbSet<ComputerPeripherals> ComputerPeripherals { get; set; }

    public virtual DbSet<Cyberdeck> Cyberdeck { get; set; }

    public virtual DbSet<CyberdeckImprovements> CyberdeckImprovements { get; set; }

    public virtual DbSet<CyberdeckOptions> CyberdeckOptions { get; set; }

    public virtual DbSet<CyberdeckOptionsSkillModifiers> CyberdeckOptionsSkillModifiers { get; set; }

    public virtual DbSet<CyberdeckOptionsStatModifiers> CyberdeckOptionsStatModifiers { get; set; }

    public virtual DbSet<CyberneticTypes> CyberneticTypes { get; set; }

    public virtual DbSet<Cybernetics> Cybernetics { get; set; }

    public virtual DbSet<Fortress> Fortress { get; set; }

    public virtual DbSet<FortressCPU> FortressCPU { get; set; }

    public virtual DbSet<FortressCodeGates> FortressCodeGates { get; set; }

    public virtual DbSet<FortressMemory> FortressMemory { get; set; }

    public virtual DbSet<FortressPrograms> FortressPrograms { get; set; }

    public virtual DbSet<FortressRemotes> FortressRemotes { get; set; }

    public virtual DbSet<FortressSkills> FortressSkills { get; set; }

    public virtual DbSet<FortressWalls> FortressWalls { get; set; }

    public virtual DbSet<NetObjType> NetObjType { get; set; }

    public virtual DbSet<Player> Player { get; set; }

    public virtual DbSet<PlayerArmor> PlayerArmor { get; set; }

    public virtual DbSet<PlayerComputer> PlayerComputer { get; set; }

    public virtual DbSet<PlayerComputerImprovements> PlayerComputerImprovements { get; set; }

    public virtual DbSet<PlayerComputerOptions> PlayerComputerOptions { get; set; }

    public virtual DbSet<PlayerComputerPrograms> PlayerComputerPrograms { get; set; }

    public virtual DbSet<PlayerCyberdeck> PlayerCyberdeck { get; set; }

    public virtual DbSet<PlayerCyberdeckImprovements> PlayerCyberdeckImprovements { get; set; }

    public virtual DbSet<PlayerCyberdeckOptions> PlayerCyberdeckOptions { get; set; }

    public virtual DbSet<PlayerCyberdeckPrograms> PlayerCyberdeckPrograms { get; set; }

    public virtual DbSet<PlayerCybernetics> PlayerCybernetics { get; set; }

    public virtual DbSet<PlayerPrograms> PlayerPrograms { get; set; }

    public virtual DbSet<PlayerRoles> PlayerRoles { get; set; }

    public virtual DbSet<PlayerSkill> PlayerSkill { get; set; }

    public virtual DbSet<PlayerSkillModifiers> PlayerSkillModifiers { get; set; }

    public virtual DbSet<PlayerStat> PlayerStat { get; set; }

    public virtual DbSet<PlayerStatModifiers> PlayerStatModifiers { get; set; }

    public virtual DbSet<PlayerWeapon> PlayerWeapon { get; set; }

    public virtual DbSet<Program> Program { get; set; }

    public virtual DbSet<ProgramFunctions> ProgramFunctions { get; set; }

    public virtual DbSet<ProgramOptions> ProgramOptions { get; set; }

    public virtual DbSet<ProgramType> ProgramType { get; set; }

    public virtual DbSet<Skill> Skill { get; set; }

    public virtual DbSet<SkillTypes> SkillTypes { get; set; }

    public virtual DbSet<Stat> Stat { get; set; }

    public virtual DbSet<Subgrid> Subgrid { get; set; }

    public virtual DbSet<SurgicalCode> SurgicalCode { get; set; }

    public virtual DbSet<Units> Units { get; set; }

    public virtual DbSet<WeaponConcTypes> WeaponConcTypes { get; set; }

    public virtual DbSet<WeaponTypes> WeaponTypes { get; set; }

    public virtual DbSet<Weapons> Weapons { get; set; }

    public virtual DbSet<__MigrationHistory> __MigrationHistory { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		=> optionsBuilder.UseSqlServer(Secrets.Secret["ConnectionStrings:Cyberpunk-Connection"]);

	protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ArmorLocations>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__ArmorLoc__3213E83FB24B493C");

            entity.Property(e => e.Name).HasMaxLength(255);
        });

        modelBuilder.Entity<AspNetRoleClaims>(entity =>
        {
            entity.HasIndex(e => e.RoleId, "IX_AspNetRoleClaims_RoleId");

            entity.HasOne(d => d.Role).WithMany(p => p.AspNetRoleClaims).HasForeignKey(d => d.RoleId);
        });

        modelBuilder.Entity<AspNetRoles>(entity =>
        {
            entity.HasIndex(e => e.NormalizedName, "RoleNameIndex")
                .IsUnique()
                .HasFilter("([NormalizedName] IS NOT NULL)");

            entity.Property(e => e.Name).HasMaxLength(256);
            entity.Property(e => e.NormalizedName).HasMaxLength(256);
        });

        modelBuilder.Entity<AspNetUserClaims>(entity =>
        {
            entity.HasIndex(e => e.UserId, "IX_AspNetUserClaims_UserId");

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserClaims).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<AspNetUserLogins>(entity =>
        {
            entity.HasKey(e => new { e.LoginProvider, e.ProviderKey });

            entity.HasIndex(e => e.UserId, "IX_AspNetUserLogins_UserId");

            entity.Property(e => e.LoginProvider).HasMaxLength(128);
            entity.Property(e => e.ProviderKey).HasMaxLength(128);

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserLogins).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<AspNetUserTokens>(entity =>
        {
            entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });

            entity.Property(e => e.LoginProvider).HasMaxLength(128);
            entity.Property(e => e.Name).HasMaxLength(128);

            entity.HasOne(d => d.User).WithMany(p => p.AspNetUserTokens).HasForeignKey(d => d.UserId);
        });

        modelBuilder.Entity<AspNetUsers>(entity =>
        {
            entity.HasIndex(e => e.NormalizedEmail, "EmailIndex");

            entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex")
                .IsUnique()
                .HasFilter("([NormalizedUserName] IS NOT NULL)");

            entity.Property(e => e.Email).HasMaxLength(256);
            entity.Property(e => e.NormalizedEmail).HasMaxLength(256);
            entity.Property(e => e.NormalizedUserName).HasMaxLength(256);
            entity.Property(e => e.UserName).HasMaxLength(256);

            entity.HasMany(d => d.Role).WithMany(p => p.User)
                .UsingEntity<Dictionary<string, object>>(
                    "AspNetUserRoles",
                    r => r.HasOne<AspNetRoles>().WithMany().HasForeignKey("RoleId"),
                    l => l.HasOne<AspNetUsers>().WithMany().HasForeignKey("UserId"),
                    j =>
                    {
                        j.HasKey("UserId", "RoleId");
                        j.HasIndex(new[] { "RoleId" }, "IX_AspNetUserRoles_RoleId");
                    });
        });

        modelBuilder.Entity<Computer>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Computer__3213E83FBE44875D");

            entity.Property(e => e.BateryHours).HasDefaultValueSql("((1.0))");
            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Int).HasDefaultValueSql("((1))");
            entity.Property(e => e.IsPortable)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.Memory).HasDefaultValueSql("((1))");
            entity.Property(e => e.NumCPU).HasDefaultValueSql("((1))");
            entity.Property(e => e.NumSlots).HasDefaultValueSql("((3))");
            entity.Property(e => e.WallStrength).HasDefaultValueSql("((2))");
            entity.Property(e => e.name).HasMaxLength(255);
        });

        modelBuilder.Entity<ComputerImprovements>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Computer__3213E83F5875AB3E");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.ImprovementFor).HasMaxLength(255);
            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.UnitType).WithMany(p => p.ComputerImprovements)
                .HasForeignKey(d => d.UnitTypeID)
                .HasConstraintName("FK_ComputerImprovements_Units");
        });

        modelBuilder.Entity<ComputerPeripheralSkillModifiers>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Computer__3213E83F802DA988");

            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.ComputerPeripheral).WithMany(p => p.ComputerPeripheralSkillModifiers)
                .HasForeignKey(d => d.ComputerPeripheralID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__ComputerP__Compu__02C769E9");

            entity.HasOne(d => d.Skill).WithMany(p => p.ComputerPeripheralSkillModifiers)
                .HasForeignKey(d => d.SkillID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__ComputerP__Skill__01D345B0");
        });

        modelBuilder.Entity<ComputerPeripheralStatModifiers>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Computer__3213E83F867ACC02");

            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.ComputerPeripheral).WithMany(p => p.ComputerPeripheralStatModifiers)
                .HasForeignKey(d => d.ComputerPeripheralID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__ComputerP__Compu__078C1F06");

            entity.HasOne(d => d.Stat).WithMany(p => p.ComputerPeripheralStatModifiers)
                .HasForeignKey(d => d.StatID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__ComputerP__StatI__0697FACD");
        });

        modelBuilder.Entity<ComputerPeripherals>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Computer__3213E83F70F2AEB6");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.MU).HasDefaultValueSql("((0))");
            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.UnitType).WithMany(p => p.ComputerPeripherals)
                .HasForeignKey(d => d.UnitTypeID)
                .HasConstraintName("FK__ComputerP__UnitT__7E02B4CC");
        });

        modelBuilder.Entity<Cyberdeck>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Cyberdec__3213E83F6790202D");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Memory).HasDefaultValueSql("((1))");
            entity.Property(e => e.WallStrength).HasDefaultValueSql("((2))");
            entity.Property(e => e.name).HasMaxLength(255);
        });

        modelBuilder.Entity<CyberdeckImprovements>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Cyberdec__3213E83F0F1018E2");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.ImprovementFor).HasMaxLength(255);
            entity.Property(e => e.name).HasMaxLength(255);
        });

        modelBuilder.Entity<CyberdeckOptions>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Cyberdec__3213E83FB0513B2E");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.UnitType).WithMany(p => p.CyberdeckOptions)
                .HasForeignKey(d => d.UnitTypeID)
                .HasConstraintName("FK__Cyberdeck__UnitT__5BAD9CC8");
        });

        modelBuilder.Entity<CyberdeckOptionsSkillModifiers>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Cyberdec__3213E83F40BB76A2");

            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.CyberdeckOption).WithMany(p => p.CyberdeckOptionsSkillModifiers)
                .HasForeignKey(d => d.CyberdeckOptionID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Cyberdeck__Cyber__607251E5");

            entity.HasOne(d => d.Skill).WithMany(p => p.CyberdeckOptionsSkillModifiers)
                .HasForeignKey(d => d.SkillID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Cyberdeck__Skill__5F7E2DAC");
        });

        modelBuilder.Entity<CyberdeckOptionsStatModifiers>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Cyberdec__3213E83FBC21B25A");

            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.CyberdeckOption).WithMany(p => p.CyberdeckOptionsStatModifiers)
                .HasForeignKey(d => d.CyberdeckOptionID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Cyberdeck__Cyber__65370702");

            entity.HasOne(d => d.Stat).WithMany(p => p.CyberdeckOptionsStatModifiers)
                .HasForeignKey(d => d.StatID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Cyberdeck__StatI__6442E2C9");
        });

        modelBuilder.Entity<CyberneticTypes>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Cybernet__3213E83FFC9535E1");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Name).HasMaxLength(255);
        });

        modelBuilder.Entity<Cybernetics>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Cybernet__3213E83F5BACA643");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Name).HasMaxLength(255);

            entity.HasOne(d => d.SurgTypeNavigation).WithMany(p => p.Cybernetics)
                .HasForeignKey(d => d.SurgType)
                .HasConstraintName("FK__Cyberneti__SurgT__49C3F6B7");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.Cybernetics)
                .HasForeignKey(d => d.Type)
                .HasConstraintName("FK__Cybernetic__Type__48CFD27E");
        });

        modelBuilder.Entity<Fortress>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Fortress__3213E83F05C235E2");

            entity.Property(e => e.Name).HasMaxLength(255);

            entity.HasOne(d => d.subgrid).WithMany(p => p.Fortress)
                .HasForeignKey(d => d.subgridID)
                .HasConstraintName("FK__Fortress__subgri__5535A963");
        });

        modelBuilder.Entity<FortressCPU>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Fortress__3213E83F5CA03A55");

            entity.Property(e => e.Type).HasDefaultValueSql("((1))");

            entity.HasOne(d => d.Fortress).WithMany(p => p.FortressCPU)
                .HasForeignKey(d => d.FortressID)
                .HasConstraintName("FK__FortressC__Fortr__5DCAEF64");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.FortressCPU)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__FortressCP__Type__5EBF139D");
        });

        modelBuilder.Entity<FortressCodeGates>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Fortress__3213E83F80A07427");

            entity.Property(e => e.Type).HasDefaultValueSql("((1))");

            entity.HasOne(d => d.Fortress).WithMany(p => p.FortressCodeGates)
                .HasForeignKey(d => d.FortressID)
                .HasConstraintName("FK__FortressC__Fortr__6754599E");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.FortressCodeGates)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__FortressCo__Type__68487DD7");
        });

        modelBuilder.Entity<FortressMemory>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Fortress__3213E83F67448657");

            entity.Property(e => e.Type).HasDefaultValueSql("((1))");

            entity.HasOne(d => d.Fortress).WithMany(p => p.FortressMemory)
                .HasForeignKey(d => d.FortressID)
                .HasConstraintName("FK__FortressM__Fortr__628FA481");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.FortressMemory)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__FortressMe__Type__6383C8BA");
        });

        modelBuilder.Entity<FortressPrograms>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Fortress__3213E83FEC6F25CE");

            entity.Property(e => e.Rezzed)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.Type).HasDefaultValueSql("((5))");

            entity.HasOne(d => d.Fortress).WithMany(p => p.FortressPrograms)
                .HasForeignKey(d => d.FortressID)
                .HasConstraintName("FK__FortressP__Fortr__7D98A078");

            entity.HasOne(d => d.Program).WithMany(p => p.FortressPrograms)
                .HasForeignKey(d => d.ProgramID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__FortressP__Progr__7CA47C3F");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.FortressPrograms)
                .HasForeignKey(d => d.Type)
                .HasConstraintName("FK_FortressPrograms_NetObjType");
        });

        modelBuilder.Entity<FortressRemotes>(entity =>
        {
            entity.Property(e => e.id).ValueGeneratedNever();

            entity.HasOne(d => d.Fortress).WithMany(p => p.FortressRemotes)
                .HasForeignKey(d => d.FortressID)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FortressRemotes_Fortress");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.FortressRemotes)
                .HasForeignKey(d => d.Type)
                .HasConstraintName("FK_FortressRemotes_NetObjType");
        });

        modelBuilder.Entity<FortressSkills>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Fortress__3213E83FDA11234A");

            entity.HasOne(d => d.Fortress).WithMany(p => p.FortressSkills)
                .HasForeignKey(d => d.FortressID)
                .HasConstraintName("FK__FortressS__Fortr__4B422AD5");

            entity.HasOne(d => d.Skill).WithMany(p => p.FortressSkills)
                .HasForeignKey(d => d.SkillID)
                .HasConstraintName("FK__FortressS__Skill__4C364F0E");
        });

        modelBuilder.Entity<FortressWalls>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Fortress__3213E83FD3F2801A");

            entity.Property(e => e.Type).HasDefaultValueSql("((1))");

            entity.HasOne(d => d.Fortress).WithMany(p => p.FortressWalls)
                .HasForeignKey(d => d.FortressID)
                .HasConstraintName("FK__FortressW__Fortr__59063A47");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.FortressWalls)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__FortressWa__Type__59FA5E80");
        });

        modelBuilder.Entity<NetObjType>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__NetObjTy__3213E83FD753EAE8");

            entity.Property(e => e.Name).HasMaxLength(255);
            entity.Property(e => e.SVG).HasColumnType("text");
            entity.Property(e => e.Title).HasMaxLength(255);
        });

        modelBuilder.Entity<Player>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Player__3213E83F4D408B3D");

            entity.Property(e => e.Handle).HasMaxLength(255);
            entity.Property(e => e.SIN).HasMaxLength(255);
            entity.Property(e => e.Type).HasDefaultValueSql("((6))");
            entity.Property(e => e.aspUserID).HasMaxLength(450);

            entity.HasOne(d => d.Role).WithMany(p => p.Player)
                .HasForeignKey(d => d.RoleID)
                .HasConstraintName("FK__Player__RoleID__6B24EA82");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.Player)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Player_NetObjType");

            entity.HasOne(d => d.aspUser).WithMany(p => p.Player)
                .HasForeignKey(d => d.aspUserID)
                .HasConstraintName("FK__Player__aspUserI__1AF3F935");
        });

        modelBuilder.Entity<PlayerArmor>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerAr__3213E83F0C085412");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Name).HasMaxLength(255);

            entity.HasOne(d => d.Location).WithMany(p => p.PlayerArmor)
                .HasForeignKey(d => d.LocationID)
                .HasConstraintName("FK__PlayerArm__Locat__72C60C4A");

            entity.HasOne(d => d.Player).WithMany(p => p.PlayerArmor)
                .HasForeignKey(d => d.PlayerID)
                .HasConstraintName("FK__PlayerArm__Playe__71D1E811");
        });

        modelBuilder.Entity<PlayerComputer>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerCo__3213E83F67698BFC");

            entity.Property(e => e.description).HasColumnType("text");
            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.Computer).WithMany(p => p.PlayerComputer)
                .HasForeignKey(d => d.ComputerID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCom__Compu__7167D3BD");

            entity.HasOne(d => d.Player).WithMany(p => p.PlayerComputer)
                .HasForeignKey(d => d.PlayerID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCom__Playe__725BF7F6");
        });

        modelBuilder.Entity<PlayerComputerImprovements>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerCo__3213E83F3D61B6FF");

            entity.HasOne(d => d.ComputerImprovements).WithMany(p => p.PlayerComputerImprovements)
                .HasForeignKey(d => d.ComputerImprovementsID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCom__Compu__6B79F03D");

            entity.HasOne(d => d.PlayerComputer).WithMany(p => p.PlayerComputerImprovements)
                .HasForeignKey(d => d.PlayerComputerID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCom__Playe__6A85CC04");
        });

        modelBuilder.Entity<PlayerComputerOptions>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerCo__3213E83FEF7D8A8B");

            entity.HasOne(d => d.ComputerPeripherals).WithMany(p => p.PlayerComputerOptions)
                .HasForeignKey(d => d.ComputerPeripheralsID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCom__Compu__6F4A8121");

            entity.HasOne(d => d.PlayerComputer).WithMany(p => p.PlayerComputerOptions)
                .HasForeignKey(d => d.PlayerComputerID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCom__Playe__6E565CE8");
        });

        modelBuilder.Entity<PlayerComputerPrograms>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerCo__3213E83F07BDF388");

            entity.Property(e => e.Rezzed)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.Type).HasDefaultValueSql("((5))");

            entity.HasOne(d => d.PlayerComputer).WithMany(p => p.PlayerComputerPrograms)
                .HasForeignKey(d => d.PlayerComputerID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCom__Playe__78D3EB5B");

            entity.HasOne(d => d.Program).WithMany(p => p.PlayerComputerPrograms)
                .HasForeignKey(d => d.ProgramID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCom__Progr__77DFC722");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.PlayerComputerPrograms)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlayerComputerPrograms_NetObjType");
        });

        modelBuilder.Entity<PlayerCyberdeck>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerCy__3213E83F046BB057");

            entity.Property(e => e.description).HasColumnType("text");
            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.Cyberdeck).WithMany(p => p.PlayerCyberdeck)
                .HasForeignKey(d => d.CyberdeckID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCyb__Cyber__65F62111");

            entity.HasOne(d => d.Player).WithMany(p => p.PlayerCyberdeck)
                .HasForeignKey(d => d.PlayerID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCyb__Playe__66EA454A");
        });

        modelBuilder.Entity<PlayerCyberdeckImprovements>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerCy__3213E83F76C1E725");

            entity.HasOne(d => d.CyberdeckImprovements).WithMany(p => p.PlayerCyberdeckImprovements)
                .HasForeignKey(d => d.CyberdeckImprovementsID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCyb__Cyber__61F08603");

            entity.HasOne(d => d.PlayerCyberdeck).WithMany(p => p.PlayerCyberdeckImprovements)
                .HasForeignKey(d => d.PlayerCyberdeckID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCyb__Playe__60FC61CA");
        });

        modelBuilder.Entity<PlayerCyberdeckOptions>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerCy__3213E83F773289BF");

            entity.HasOne(d => d.CyberdeckOptions).WithMany(p => p.PlayerCyberdeckOptions)
                .HasForeignKey(d => d.CyberdeckOptionsID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCyb__Cyber__65C116E7");

            entity.HasOne(d => d.PlayerCyberdeck).WithMany(p => p.PlayerCyberdeckOptions)
                .HasForeignKey(d => d.PlayerCyberdeckID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCyb__Playe__64CCF2AE");
        });

        modelBuilder.Entity<PlayerCyberdeckPrograms>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerCy__3213E83FF21FBDA1");

            entity.Property(e => e.Rezzed)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.Type).HasDefaultValueSql("((5))");

            entity.HasOne(d => d.PlayerCyberdeck).WithMany(p => p.PlayerCyberdeckPrograms)
                .HasForeignKey(d => d.PlayerCyberdeckID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCyb__Playe__740F363E");

            entity.HasOne(d => d.Program).WithMany(p => p.PlayerCyberdeckPrograms)
                .HasForeignKey(d => d.ProgramID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerCyb__Progr__731B1205");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.PlayerCyberdeckPrograms)
                .HasForeignKey(d => d.Type)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PlayerCyberdeckPrograms_NetObjType");
        });

        modelBuilder.Entity<PlayerCybernetics>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerCy__3213E83F9A91576B");

            entity.HasOne(d => d.Cybernetic).WithMany(p => p.PlayerCybernetics)
                .HasForeignKey(d => d.CyberneticID)
                .HasConstraintName("FK__PlayerCyb__Cyber__7D439ABD");

            entity.HasOne(d => d.Player).WithMany(p => p.PlayerCybernetics)
                .HasForeignKey(d => d.PlayerID)
                .HasConstraintName("FK__PlayerCyb__Playe__7E37BEF6");
        });

        modelBuilder.Entity<PlayerPrograms>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerPr__3213E83FDA70A252");

            entity.Property(e => e.Rezzed)
                .IsRequired()
                .HasDefaultValueSql("((1))");

            entity.HasOne(d => d.Player).WithMany(p => p.PlayerPrograms)
                .HasForeignKey(d => d.PlayerID)
                .HasConstraintName("FK__PlayerPro__Playe__025D5595");

            entity.HasOne(d => d.Program).WithMany(p => p.PlayerPrograms)
                .HasForeignKey(d => d.ProgramID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerPro__Progr__0169315C");
        });

        modelBuilder.Entity<PlayerRoles>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerRo__3213E83F5C5C8262");

            entity.Property(e => e.Name).HasMaxLength(255);
        });

        modelBuilder.Entity<PlayerSkill>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerSk__3213E83F7CA325CB");

            entity.HasOne(d => d.Player).WithMany(p => p.PlayerSkill)
                .HasForeignKey(d => d.PlayerID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerSki__Playe__7A672E12");

            entity.HasOne(d => d.Skill).WithMany(p => p.PlayerSkill)
                .HasForeignKey(d => d.SkillID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerSki__Skill__797309D9");
        });

        modelBuilder.Entity<PlayerSkillModifiers>(entity =>
        {
            entity.Property(e => e.name)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.PlayerSkill).WithMany(p => p.PlayerSkillModifiers)
                .HasForeignKey(d => d.PlayerSkillID)
                .HasConstraintName("FK__PlayerSki__Playe__4F9CCB9E");
        });

        modelBuilder.Entity<PlayerStat>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerSt__3213E83F6CFAA3C0");

            entity.HasOne(d => d.Player).WithMany(p => p.PlayerStat)
                .HasForeignKey(d => d.PlayerID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerSta__Playe__6E01572D");

            entity.HasOne(d => d.Stat).WithMany(p => p.PlayerStat)
                .HasForeignKey(d => d.StatID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__PlayerSta__StatI__6EF57B66");
        });

        modelBuilder.Entity<PlayerStatModifiers>(entity =>
        {
            entity.Property(e => e.name)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.PlayerStat).WithMany(p => p.PlayerStatModifiers)
                .HasForeignKey(d => d.PlayerStatID)
                .HasConstraintName("FK__PlayerSta__Playe__4CC05EF3");
        });

        modelBuilder.Entity<PlayerWeapon>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__PlayerWe__3213E83FFA7F9612");

            entity.HasOne(d => d.Player).WithMany(p => p.PlayerWeapon)
                .HasForeignKey(d => d.PlayerID)
                .HasConstraintName("FK__PlayerWea__Playe__75A278F5");

            entity.HasOne(d => d.Weapon).WithMany(p => p.PlayerWeapon)
                .HasForeignKey(d => d.WeaponID)
                .HasConstraintName("FK__PlayerWea__Weapo__76969D2E");
        });

        modelBuilder.Entity<Program>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Program__3213E83FC9D77626");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Strength).HasDefaultValueSql("((1))");
            entity.Property(e => e.name).HasMaxLength(255);

            entity.HasOne(d => d.ProgramType).WithMany(p => p.Program)
                .HasForeignKey(d => d.ProgramTypeID)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK__Program__Program__53D770D6");

            entity.HasMany(d => d.ProgramFunction).WithMany(p => p.Program)
                .UsingEntity<Dictionary<string, object>>(
                    "ProgramProgramFunctions",
                    r => r.HasOne<ProgramFunctions>().WithMany()
                        .HasForeignKey("ProgramFunctionID")
                        .HasConstraintName("FK__ProgramPr__Progr__5D60DB10"),
                    l => l.HasOne<Program>().WithMany()
                        .HasForeignKey("ProgramID")
                        .HasConstraintName("FK__ProgramPr__Progr__5C6CB6D7"),
                    j =>
                    {
                        j.HasKey("ProgramID", "ProgramFunctionID").HasName("PK__ProgramP__2D2B39B34ACF1E98");
                    });

            entity.HasMany(d => d.ProgramNavigation).WithMany(p => p.SubProgram)
                .UsingEntity<Dictionary<string, object>>(
                    "ProgramSubroutines",
                    r => r.HasOne<Program>().WithMany()
                        .HasForeignKey("ProgramID")
                        .HasConstraintName("FK__ProgramSu__Progr__56B3DD81"),
                    l => l.HasOne<Program>().WithMany()
                        .HasForeignKey("SubProgramID")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__ProgramSu__SubPr__57A801BA"),
                    j =>
                    {
                        j.HasKey("ProgramID", "SubProgramID").HasName("PK__ProgramS__AA8291797515FAD6");
                    });

            entity.HasMany(d => d.ProgramOptions).WithMany(p => p.Program)
                .UsingEntity<Dictionary<string, object>>(
                    "ProgramProgramOptions",
                    r => r.HasOne<ProgramOptions>().WithMany()
                        .HasForeignKey("ProgramOptionsID")
                        .HasConstraintName("FK__ProgramPr__Progr__6319B466"),
                    l => l.HasOne<Program>().WithMany()
                        .HasForeignKey("ProgramID")
                        .HasConstraintName("FK__ProgramPr__Progr__6225902D"),
                    j =>
                    {
                        j.HasKey("ProgramID", "ProgramOptionsID").HasName("PK__ProgramP__B6C95780EC085E4F");
                    });

            entity.HasMany(d => d.SubProgram).WithMany(p => p.ProgramNavigation)
                .UsingEntity<Dictionary<string, object>>(
                    "ProgramSubroutines",
                    r => r.HasOne<Program>().WithMany()
                        .HasForeignKey("SubProgramID")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__ProgramSu__SubPr__57A801BA"),
                    l => l.HasOne<Program>().WithMany()
                        .HasForeignKey("ProgramID")
                        .HasConstraintName("FK__ProgramSu__Progr__56B3DD81"),
                    j =>
                    {
                        j.HasKey("ProgramID", "SubProgramID").HasName("PK__ProgramS__AA8291797515FAD6");
                    });
        });

        modelBuilder.Entity<ProgramFunctions>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__ProgramF__3213E83F75B6C690");

            entity.Property(e => e.description).HasColumnType("text");
            entity.Property(e => e.name).HasMaxLength(255);
        });

        modelBuilder.Entity<ProgramOptions>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__ProgramO__3213E83F5AD96FCA");

            entity.Property(e => e.description).HasColumnType("text");
            entity.Property(e => e.name).HasMaxLength(255);
        });

        modelBuilder.Entity<ProgramType>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__ProgramT__3213E83FC194E337");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.name).HasMaxLength(255);
        });

        modelBuilder.Entity<Skill>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Skill__3213E83F0DF9ABEC");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Multiplier).HasDefaultValueSql("((1))");
            entity.Property(e => e.Name).HasMaxLength(255);

            entity.HasOne(d => d.SkillTypeNavigation).WithMany(p => p.Skill)
                .HasForeignKey(d => d.SkillType)
                .HasConstraintName("FK_Skill_SkillTypes");

            entity.HasOne(d => d.Stat).WithMany(p => p.Skill)
                .HasForeignKey(d => d.StatID)
                .HasConstraintName("FK__Skill__StatID__4E88ABD4");
        });

        modelBuilder.Entity<SkillTypes>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__SkillTyp__3213E83FE5147669");

            entity.Property(e => e.Name).HasMaxLength(255);
        });

        modelBuilder.Entity<Stat>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Stat__3213E83FA14CCE7D");

            entity.Property(e => e.ABBR).HasMaxLength(10);
            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Name).HasMaxLength(255);
        });

        modelBuilder.Entity<Subgrid>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Subgrid__3213E83F9BCC36A0");

            entity.Property(e => e.Name)
                .HasDefaultValueSql("('New Subgrid')")
                .HasColumnType("text");
            entity.Property(e => e.UserID).HasMaxLength(128);
        });

        modelBuilder.Entity<SurgicalCode>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Surgical__3213E83F159D7D6D");

            entity.Property(e => e.Area).HasColumnType("text");
            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Name).HasMaxLength(255);
            entity.Property(e => e.time).HasMaxLength(20);
        });

        modelBuilder.Entity<Units>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Units__3213E83F177057CE");

            entity.Property(e => e.name).HasMaxLength(255);
        });

        modelBuilder.Entity<WeaponConcTypes>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__WeaponCo__3213E83F943E5C16");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Name).HasMaxLength(255);
        });

        modelBuilder.Entity<WeaponTypes>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__WeaponTy__3213E83F9F8B8765");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Name).HasMaxLength(255);
        });

        modelBuilder.Entity<Weapons>(entity =>
        {
            entity.HasKey(e => e.id).HasName("PK__Weapons__3213E83F17F16EB5");

            entity.Property(e => e.Description).HasColumnType("text");
            entity.Property(e => e.Name).HasMaxLength(255);

            entity.HasOne(d => d.ConcNavigation).WithMany(p => p.Weapons)
                .HasForeignKey(d => d.Conc)
                .HasConstraintName("FK__Weapons__Conc__45F365D3");

            entity.HasOne(d => d.TypeNavigation).WithMany(p => p.Weapons)
                .HasForeignKey(d => d.Type)
                .HasConstraintName("FK__Weapons__Type__44FF419A");
        });

        modelBuilder.Entity<__MigrationHistory>(entity =>
        {
            entity.HasKey(e => new { e.MigrationId, e.ContextKey }).HasName("PK_dbo.__MigrationHistory");

            entity.Property(e => e.MigrationId).HasMaxLength(150);
            entity.Property(e => e.ContextKey).HasMaxLength(300);
            entity.Property(e => e.ProductVersion).HasMaxLength(32);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
