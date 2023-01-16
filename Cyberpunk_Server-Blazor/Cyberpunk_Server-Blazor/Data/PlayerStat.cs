using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerStat
{
    public int id { get; set; }

    public int? StatID { get; set; }

    public int? Base { get; set; }

    public int? Bonus { get; set; }

    public int? Current { get; set; }

    public int? PlayerID { get; set; }

    public virtual Player? Player { get; set; }

    public virtual ICollection<PlayerStatModifiers> PlayerStatModifiers { get; } = new List<PlayerStatModifiers>();

    public virtual Stat? Stat { get; set; }
}
