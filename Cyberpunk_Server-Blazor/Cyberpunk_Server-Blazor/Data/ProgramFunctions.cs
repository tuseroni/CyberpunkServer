using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class ProgramFunctions
{
    public int id { get; set; }

    public string? name { get; set; }

    public string? description { get; set; }

    public int? diff { get; set; }

    public virtual ICollection<Program> Program { get; } = new List<Program>();
}
