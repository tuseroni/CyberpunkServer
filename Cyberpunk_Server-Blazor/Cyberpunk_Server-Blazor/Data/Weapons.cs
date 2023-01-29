using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class Weapons
{
    public int id { get; set; }

    public string? Name { get; set; }

    public int? NumDice { get; set; }

    public int? DiceType { get; set; }

    public int? Bonus { get; set; }

    public int? ROF { get; set; }

    public int? REL { get; set; }

    public int? Type { get; set; }

    public int? Conc { get; set; }

    public int? Shots1 { get; set; }

    public int? Shots2 { get; set; }

    public int? Range { get; set; }

    public string? Description { get; set; }

    public virtual WeaponConcTypes? ConcNavigation { get; set; }

    public virtual WeaponTypes? TypeNavigation { get; set; }
}
