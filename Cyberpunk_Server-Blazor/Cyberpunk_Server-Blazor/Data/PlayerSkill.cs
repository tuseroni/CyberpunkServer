using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerSkill
{
    public int id { get; set; }

    public int Ranks { get; set; }

    public int Bonus { get; set; }

    public int CurrentIP { get; set; }

    public int? PlayerID { get; set; }

    public int? SkillID { get; set; }

    public string? Name { get; set; }

    public virtual Player? Player { get; set; }

    public virtual ICollection<PlayerSkillModifiers> PlayerSkillModifiers { get; } = new List<PlayerSkillModifiers>();

    public virtual Skill? Skill { get; set; }
}
