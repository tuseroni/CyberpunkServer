using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class SkillTypes
{
    public int id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Skill> Skill { get; } = new List<Skill>();
}
