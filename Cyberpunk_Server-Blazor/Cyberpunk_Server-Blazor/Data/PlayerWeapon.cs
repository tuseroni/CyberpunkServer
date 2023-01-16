using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerWeapon
{
    public int id { get; set; }

    public int? WeaponID { get; set; }

    public int? PlayerID { get; set; }

    public virtual Player? Player { get; set; }

    public virtual Weapons? Weapon { get; set; }
}
