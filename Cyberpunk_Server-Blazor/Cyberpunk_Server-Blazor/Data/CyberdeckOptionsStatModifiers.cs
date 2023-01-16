using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class CyberdeckOptionsStatModifiers
{
    public int id { get; set; }

    public string? name { get; set; }

    public int? StatID { get; set; }

    public int Modifier { get; set; }

    public int? CyberdeckOptionID { get; set; }

    public virtual CyberdeckOptions? CyberdeckOption { get; set; }

    public virtual Stat? Stat { get; set; }
}
