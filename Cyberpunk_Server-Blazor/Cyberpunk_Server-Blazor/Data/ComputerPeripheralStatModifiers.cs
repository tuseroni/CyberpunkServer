using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class ComputerPeripheralStatModifiers
{
    public int id { get; set; }

    public string? name { get; set; }

    public int? StatID { get; set; }

    public int Modifier { get; set; }

    public int? ComputerPeripheralID { get; set; }

    public virtual ComputerPeripherals? ComputerPeripheral { get; set; }

    public virtual Stat? Stat { get; set; }
}
