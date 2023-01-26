using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerRoles
{
    public int id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Player> Player { get; } = new List<Player>();

    public virtual ICollection<Skill> Skill { get; } = new List<Skill>();
}
