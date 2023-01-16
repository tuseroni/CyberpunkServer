using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Subgrid
{
    public int id { get; set; }

    public int width { get; set; }

    public int height { get; set; }

    public string Name { get; set; } = null!;

    public string? UserID { get; set; }

    public virtual ICollection<Fortress> Fortress { get; } = new List<Fortress>();
}
