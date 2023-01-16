using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class FortressPrograms
{
    public int id { get; set; }

    public int? ProgramID { get; set; }

    public int FortressID { get; set; }

    public bool? Rezzed { get; set; }

    public int Strength { get; set; }

    public int xPos { get; set; }

    public int yPos { get; set; }

    public int Type { get; set; }

    public virtual Fortress Fortress { get; set; } = null!;

    public virtual Program? Program { get; set; }

    public virtual NetObjType TypeNavigation { get; set; } = null!;
}
