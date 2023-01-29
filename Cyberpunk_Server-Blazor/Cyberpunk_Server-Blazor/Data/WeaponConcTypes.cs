using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class WeaponConcTypes
{
    public int id { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<PlayerWeapon> PlayerWeapon { get; } = new List<PlayerWeapon>();

    public virtual ICollection<Weapons> Weapons { get; } = new List<Weapons>();
}
