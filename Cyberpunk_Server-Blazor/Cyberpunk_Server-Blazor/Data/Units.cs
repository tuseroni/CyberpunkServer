using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Units
{
    public int id { get; set; }

    public string? name { get; set; }

    public virtual ICollection<ComputerImprovements> ComputerImprovements { get; } = new List<ComputerImprovements>();

    public virtual ICollection<ComputerPeripherals> ComputerPeripherals { get; } = new List<ComputerPeripherals>();

    public virtual ICollection<CyberdeckOptions> CyberdeckOptions { get; } = new List<CyberdeckOptions>();
}
