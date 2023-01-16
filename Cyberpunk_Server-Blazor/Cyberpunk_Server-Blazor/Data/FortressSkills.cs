using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class FortressSkills
{
    public int id { get; set; }

    public int FortressID { get; set; }

    public int SkillID { get; set; }

    public int? Ranks { get; set; }

    public virtual Fortress Fortress { get; set; } = null!;

    public virtual Skill Skill { get; set; } = null!;
}
