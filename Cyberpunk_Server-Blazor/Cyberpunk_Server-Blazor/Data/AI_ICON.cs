using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class AI_ICON
{
    public int id { get; set; }

    public string? name { get; set; }

    public string? description { get; set; }

    public virtual ICollection<Fortress> Fortress { get; } = new List<Fortress>();
}
