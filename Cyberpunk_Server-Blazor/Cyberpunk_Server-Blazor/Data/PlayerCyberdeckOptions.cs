using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerCyberdeckOptions
{
    public int id { get; set; }

    public int? PlayerCyberdeckID { get; set; }

    public int? CyberdeckOptionsID { get; set; }

    public virtual CyberdeckOptions? CyberdeckOptions { get; set; }

    public virtual PlayerCyberdeck? PlayerCyberdeck { get; set; }
}
