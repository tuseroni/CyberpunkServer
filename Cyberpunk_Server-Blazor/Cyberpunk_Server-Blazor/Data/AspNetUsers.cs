using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class AspNetUsers
{
    public string Id { get; set; } = null!;

    public string? UserName { get; set; }

    public string? NormalizedUserName { get; set; }

    public string? Email { get; set; }

    public string? NormalizedEmail { get; set; }

    public bool EmailConfirmed { get; set; }

    public string? PasswordHash { get; set; }

    public string? SecurityStamp { get; set; }

    public string? ConcurrencyStamp { get; set; }

    public string? PhoneNumber { get; set; }

    public bool PhoneNumberConfirmed { get; set; }

    public bool TwoFactorEnabled { get; set; }

    public DateTimeOffset? LockoutEnd { get; set; }

    public bool LockoutEnabled { get; set; }

    public int AccessFailedCount { get; set; }

    public virtual ICollection<AspNetUserClaims> AspNetUserClaims { get; } = new List<AspNetUserClaims>();

    public virtual ICollection<AspNetUserLogins> AspNetUserLogins { get; } = new List<AspNetUserLogins>();

    public virtual ICollection<AspNetUserTokens> AspNetUserTokens { get; } = new List<AspNetUserTokens>();

    public virtual ICollection<Player> Player { get; } = new List<Player>();

    public virtual ICollection<Subgrid> Subgrid { get; } = new List<Subgrid>();

    public virtual ICollection<AspNetRoles> Role { get; } = new List<AspNetRoles>();
}
