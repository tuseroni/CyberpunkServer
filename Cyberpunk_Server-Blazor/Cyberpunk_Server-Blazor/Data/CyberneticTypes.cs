using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class CyberneticTypes
{
    public int id { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Cybernetics> Cybernetics { get; } = new List<Cybernetics>();
}
