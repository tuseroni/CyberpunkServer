using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class FortressRemotes
{
    public int id { get; set; }

    public int xPos { get; set; }

    public int yPos { get; set; }

    public int? FortressID { get; set; }

    public int Type { get; set; }

    public virtual Fortress? Fortress { get; set; }

    public virtual NetObjType TypeNavigation { get; set; } = null!;
}
