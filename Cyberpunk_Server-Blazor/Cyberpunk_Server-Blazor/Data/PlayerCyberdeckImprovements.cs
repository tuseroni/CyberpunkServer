using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerCyberdeckImprovements
{
    public int id { get; set; }

    public int? PlayerCyberdeckID { get; set; }

    public int? CyberdeckImprovementsID { get; set; }

    public int? Quantity { get; set; }

    public virtual CyberdeckImprovements? CyberdeckImprovements { get; set; }

    public virtual PlayerCyberdeck? PlayerCyberdeck { get; set; }
}
