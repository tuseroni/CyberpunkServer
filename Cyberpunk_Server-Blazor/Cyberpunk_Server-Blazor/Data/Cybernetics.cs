using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Cybernetics
{
    public int id { get; set; }

    public string? Name { get; set; }

    public int? NumDice { get; set; }

    public int? DiceType { get; set; }

    public int? Bonus { get; set; }

    public int? HL { get; set; }

    public double? Cost { get; set; }

    public int? Type { get; set; }

    public int? SurgType { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<PlayerCybernetics> PlayerCybernetics { get; } = new List<PlayerCybernetics>();

    public virtual SurgicalCode? SurgTypeNavigation { get; set; }

    public virtual CyberneticTypes? TypeNavigation { get; set; }
}
