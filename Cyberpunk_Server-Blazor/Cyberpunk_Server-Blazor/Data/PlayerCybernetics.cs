using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerCybernetics
{
    public int id { get; set; }

    public int? HL { get; set; }

    public int? Cost { get; set; }

    public int? CyberneticID { get; set; }

    public int? PlayerID { get; set; }

    public virtual Cybernetics? Cybernetic { get; set; }

    public virtual Player? Player { get; set; }
}
