using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerCyberdeck
{
    public int id { get; set; }

    public string? name { get; set; }

    public int? CyberdeckID { get; set; }

    public int? PlayerID { get; set; }

    public string? description { get; set; }

    public virtual Cyberdeck? Cyberdeck { get; set; }

    public virtual Player? Player { get; set; }

    public virtual ICollection<PlayerCyberdeckImprovements> PlayerCyberdeckImprovements { get; } = new List<PlayerCyberdeckImprovements>();

    public virtual ICollection<PlayerCyberdeckOptions> PlayerCyberdeckOptions { get; } = new List<PlayerCyberdeckOptions>();

    public virtual ICollection<PlayerCyberdeckPrograms> PlayerCyberdeckPrograms { get; } = new List<PlayerCyberdeckPrograms>();
}
