using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class SurgicalCode
{
    public int id { get; set; }

    public string? Name { get; set; }

    public string? Area { get; set; }

    public string? time { get; set; }

    public int? NumDamageDice { get; set; }

    public int? DamageDiceType { get; set; }

    public int? DamageBonus { get; set; }

    public int? SurgicalCost { get; set; }

    public int? DIFF { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Cybernetics> Cybernetics { get; } = new List<Cybernetics>();
}
