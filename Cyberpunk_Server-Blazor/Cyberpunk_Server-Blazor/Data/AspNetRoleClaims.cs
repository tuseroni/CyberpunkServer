using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class AspNetRoleClaims
{
    public int Id { get; set; }

    public string RoleId { get; set; } = null!;

    public string? ClaimType { get; set; }

    public string? ClaimValue { get; set; }

    public virtual AspNetRoles Role { get; set; } = null!;
}
