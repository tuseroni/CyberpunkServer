using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Fortress
{
    public int id { get; set; }

    public int? subgridID { get; set; }

    public int? WallStrength { get; set; }

    public int? Int { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<FortressCPU> FortressCPU { get; } = new List<FortressCPU>();

    public virtual ICollection<FortressCodeGates> FortressCodeGates { get; } = new List<FortressCodeGates>();

    public virtual ICollection<FortressMemory> FortressMemory { get; } = new List<FortressMemory>();

    public virtual ICollection<FortressPrograms> FortressPrograms { get; } = new List<FortressPrograms>();

    public virtual ICollection<FortressRemotes> FortressRemotes { get; } = new List<FortressRemotes>();

    public virtual ICollection<FortressSkills> FortressSkills { get; } = new List<FortressSkills>();

    public virtual ICollection<FortressWalls> FortressWalls { get; } = new List<FortressWalls>();

    public virtual Subgrid? subgrid { get; set; }
}
