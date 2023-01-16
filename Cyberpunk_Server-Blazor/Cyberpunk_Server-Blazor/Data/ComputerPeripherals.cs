using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class ComputerPeripherals
{
    public int id { get; set; }

    public string? name { get; set; }

    public double CostPerUnitLow { get; set; }

    public double CostPerUnitHigh { get; set; }

    public int? UnitTypeID { get; set; }

    public int? MU { get; set; }

    public int? Bonus { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<ComputerPeripheralSkillModifiers> ComputerPeripheralSkillModifiers { get; } = new List<ComputerPeripheralSkillModifiers>();

    public virtual ICollection<ComputerPeripheralStatModifiers> ComputerPeripheralStatModifiers { get; } = new List<ComputerPeripheralStatModifiers>();

    public virtual ICollection<PlayerComputerOptions> PlayerComputerOptions { get; } = new List<PlayerComputerOptions>();

    public virtual Units? UnitType { get; set; }
}
