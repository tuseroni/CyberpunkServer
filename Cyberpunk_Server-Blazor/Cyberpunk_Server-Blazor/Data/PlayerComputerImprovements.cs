using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerComputerImprovements
{
    public int id { get; set; }

    public int? PlayerComputerID { get; set; }

    public int? ComputerImprovementsID { get; set; }

    public int? Quantity { get; set; }

    public virtual ComputerImprovements? ComputerImprovements { get; set; }

    public virtual PlayerComputer? PlayerComputer { get; set; }
}
