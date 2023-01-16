using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class ProgramType
{
    public int id { get; set; }

    public string? name { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Program> Program { get; } = new List<Program>();
}
