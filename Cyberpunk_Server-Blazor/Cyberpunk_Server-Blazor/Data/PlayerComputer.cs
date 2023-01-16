using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerComputer
{
    public int id { get; set; }

    public string? name { get; set; }

    public int? ComputerID { get; set; }

    public int? PlayerID { get; set; }

    public string? description { get; set; }

    public bool isCyberEnabled { get; set; }

    public virtual Computer? Computer { get; set; }

    public virtual Player? Player { get; set; }

    public virtual ICollection<PlayerComputerImprovements> PlayerComputerImprovements { get; } = new List<PlayerComputerImprovements>();

    public virtual ICollection<PlayerComputerOptions> PlayerComputerOptions { get; } = new List<PlayerComputerOptions>();

    public virtual ICollection<PlayerComputerPrograms> PlayerComputerPrograms { get; } = new List<PlayerComputerPrograms>();
}
