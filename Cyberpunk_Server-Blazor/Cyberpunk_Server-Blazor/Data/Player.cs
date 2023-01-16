using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Player
{
    public int id { get; set; }

    public string? Handle { get; set; }

    public string? SIN { get; set; }

    public int IP { get; set; }

    public int REP { get; set; }

    public int Humanity { get; set; }

    public int Dammage { get; set; }

    public int? RoleID { get; set; }

    public string? aspUserID { get; set; }

    public int xPos { get; set; }

    public int yPos { get; set; }

    public int Type { get; set; }

    public virtual ICollection<PlayerArmor> PlayerArmor { get; } = new List<PlayerArmor>();

    public virtual ICollection<PlayerComputer> PlayerComputer { get; } = new List<PlayerComputer>();

    public virtual ICollection<PlayerCyberdeck> PlayerCyberdeck { get; } = new List<PlayerCyberdeck>();

    public virtual ICollection<PlayerCybernetics> PlayerCybernetics { get; } = new List<PlayerCybernetics>();

    public virtual ICollection<PlayerPrograms> PlayerPrograms { get; } = new List<PlayerPrograms>();

    public virtual ICollection<PlayerSkill> PlayerSkill { get; } = new List<PlayerSkill>();

    public virtual ICollection<PlayerStat> PlayerStat { get; } = new List<PlayerStat>();

    public virtual ICollection<PlayerWeapon> PlayerWeapon { get; } = new List<PlayerWeapon>();

    public virtual PlayerRoles? Role { get; set; }

    public virtual NetObjType TypeNavigation { get; set; } = null!;

    public virtual AspNetUsers? aspUser { get; set; }
}
