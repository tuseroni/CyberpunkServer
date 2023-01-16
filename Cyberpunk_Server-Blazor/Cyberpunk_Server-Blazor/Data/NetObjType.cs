using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class NetObjType
{
    public int id { get; set; }

    public string? Name { get; set; }

    public string? Title { get; set; }

    public string? SVG { get; set; }

    public virtual ICollection<FortressCPU> FortressCPU { get; } = new List<FortressCPU>();

    public virtual ICollection<FortressCodeGates> FortressCodeGates { get; } = new List<FortressCodeGates>();

    public virtual ICollection<FortressMemory> FortressMemory { get; } = new List<FortressMemory>();

    public virtual ICollection<FortressPrograms> FortressPrograms { get; } = new List<FortressPrograms>();

    public virtual ICollection<FortressRemotes> FortressRemotes { get; } = new List<FortressRemotes>();

    public virtual ICollection<FortressWalls> FortressWalls { get; } = new List<FortressWalls>();

    public virtual ICollection<Player> Player { get; } = new List<Player>();

    public virtual ICollection<PlayerComputerPrograms> PlayerComputerPrograms { get; } = new List<PlayerComputerPrograms>();

    public virtual ICollection<PlayerCyberdeckPrograms> PlayerCyberdeckPrograms { get; } = new List<PlayerCyberdeckPrograms>();
}
