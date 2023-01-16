using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Stat
{
    public int id { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public string? ABBR { get; set; }

    public virtual ICollection<ComputerPeripheralStatModifiers> ComputerPeripheralStatModifiers { get; } = new List<ComputerPeripheralStatModifiers>();

    public virtual ICollection<CyberdeckOptionsStatModifiers> CyberdeckOptionsStatModifiers { get; } = new List<CyberdeckOptionsStatModifiers>();

    public virtual ICollection<PlayerStat> PlayerStat { get; } = new List<PlayerStat>();

    public virtual ICollection<Skill> Skill { get; } = new List<Skill>();
}
