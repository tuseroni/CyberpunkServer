using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class CyberdeckOptions
{
    public int id { get; set; }

    public string? name { get; set; }

    public double CostPerUinitLow { get; set; }

    public double CostPerUinitHigh { get; set; }

    public int? UnitTypeID { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<CyberdeckOptionsSkillModifiers> CyberdeckOptionsSkillModifiers { get; } = new List<CyberdeckOptionsSkillModifiers>();

    public virtual ICollection<CyberdeckOptionsStatModifiers> CyberdeckOptionsStatModifiers { get; } = new List<CyberdeckOptionsStatModifiers>();

    public virtual ICollection<PlayerCyberdeckOptions> PlayerCyberdeckOptions { get; } = new List<PlayerCyberdeckOptions>();

    public virtual Units? UnitType { get; set; }
}
