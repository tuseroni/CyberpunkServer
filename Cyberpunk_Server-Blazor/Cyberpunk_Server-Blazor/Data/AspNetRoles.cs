using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class AspNetRoles
{
    public string Id { get; set; } = null!;

    public string? Name { get; set; }

    public string? NormalizedName { get; set; }

    public string? ConcurrencyStamp { get; set; }

    public virtual ICollection<AspNetRoleClaims> AspNetRoleClaims { get; } = new List<AspNetRoleClaims>();

    public virtual ICollection<AspNetUsers> User { get; } = new List<AspNetUsers>();
}
