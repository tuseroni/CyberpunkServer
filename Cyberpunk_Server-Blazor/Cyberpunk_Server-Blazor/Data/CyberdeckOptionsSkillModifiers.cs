using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class CyberdeckOptionsSkillModifiers
{
    public int id { get; set; }

    public string? name { get; set; }

    public int? SkillID { get; set; }

    public int Modifier { get; set; }

    public int? CyberdeckOptionID { get; set; }

    public virtual CyberdeckOptions? CyberdeckOption { get; set; }

    public virtual Skill? Skill { get; set; }
}
