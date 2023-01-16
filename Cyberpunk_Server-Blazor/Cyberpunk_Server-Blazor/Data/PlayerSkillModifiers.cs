using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerSkillModifiers
{
    public int id { get; set; }

    public int PlayerSkillID { get; set; }

    public string? name { get; set; }

    public double amount { get; set; }

    public virtual PlayerSkill PlayerSkill { get; set; } = null!;
}
