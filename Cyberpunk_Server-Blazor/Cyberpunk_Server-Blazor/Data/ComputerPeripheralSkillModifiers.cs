using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class ComputerPeripheralSkillModifiers
{
    public int id { get; set; }

    public string? name { get; set; }

    public int? SkillID { get; set; }

    public int Modifier { get; set; }

    public int? ComputerPeripheralID { get; set; }

    public virtual ComputerPeripherals? ComputerPeripheral { get; set; }

    public virtual Skill? Skill { get; set; }
}
