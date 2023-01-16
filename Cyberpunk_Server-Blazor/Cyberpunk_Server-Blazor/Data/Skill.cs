using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Skill
{
    public int id { get; set; }

    public string? Name { get; set; }

    public int? SkillType { get; set; }

    public int? StatID { get; set; }

    public string? Description { get; set; }

    public int Multiplier { get; set; }

    public virtual ICollection<ComputerPeripheralSkillModifiers> ComputerPeripheralSkillModifiers { get; } = new List<ComputerPeripheralSkillModifiers>();

    public virtual ICollection<CyberdeckOptionsSkillModifiers> CyberdeckOptionsSkillModifiers { get; } = new List<CyberdeckOptionsSkillModifiers>();

    public virtual ICollection<FortressSkills> FortressSkills { get; } = new List<FortressSkills>();

    public virtual ICollection<PlayerSkill> PlayerSkill { get; } = new List<PlayerSkill>();

    public virtual SkillTypes? SkillTypeNavigation { get; set; }

    public virtual Stat? Stat { get; set; }
}
