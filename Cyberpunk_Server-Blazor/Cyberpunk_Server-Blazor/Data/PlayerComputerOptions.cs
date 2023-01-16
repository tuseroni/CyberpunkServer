using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerComputerOptions
{
    public int id { get; set; }

    public int? PlayerComputerID { get; set; }

    public int? ComputerPeripheralsID { get; set; }

    public virtual ComputerPeripherals? ComputerPeripherals { get; set; }

    public virtual PlayerComputer? PlayerComputer { get; set; }
}
