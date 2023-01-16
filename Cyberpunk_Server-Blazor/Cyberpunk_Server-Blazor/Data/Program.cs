using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Program
{
    public int id { get; set; }

    public string? name { get; set; }

    public int Strength { get; set; }

    public int? ProgramTypeID { get; set; }

    public double cost { get; set; }

    public int MU { get; set; }

    public string? Description { get; set; }

    public bool isCustom { get; set; }

    public virtual ICollection<FortressPrograms> FortressPrograms { get; } = new List<FortressPrograms>();

    public virtual ICollection<PlayerComputerPrograms> PlayerComputerPrograms { get; } = new List<PlayerComputerPrograms>();

    public virtual ICollection<PlayerCyberdeckPrograms> PlayerCyberdeckPrograms { get; } = new List<PlayerCyberdeckPrograms>();

    public virtual ICollection<PlayerPrograms> PlayerPrograms { get; } = new List<PlayerPrograms>();

    public virtual ProgramType? ProgramType { get; set; }

    public virtual ICollection<ProgramFunctions> ProgramFunction { get; } = new List<ProgramFunctions>();

    public virtual ICollection<Program> ProgramNavigation { get; } = new List<Program>();

    public virtual ICollection<ProgramOptions> ProgramOptions { get; } = new List<ProgramOptions>();

    public virtual ICollection<Program> SubProgram { get; } = new List<Program>();
}
