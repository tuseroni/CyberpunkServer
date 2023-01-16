using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class ComputerImprovements
{
    public int id { get; set; }

    public string? name { get; set; }

    public string? ImprovementFor { get; set; }

    public int ImprovementAmount { get; set; }

    public double CostLow { get; set; }

    public double CostHigh { get; set; }

    public int UnitTypeID { get; set; }

    public string? Description { get; set; }

    public double Slots { get; set; }

    public virtual ICollection<PlayerComputerImprovements> PlayerComputerImprovements { get; } = new List<PlayerComputerImprovements>();

    public virtual Units UnitType { get; set; } = null!;
}
