using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerCyberdeckPrograms
{
    public int id { get; set; }

    public int? ProgramID { get; set; }

    public int? PlayerCyberdeckID { get; set; }

    public bool? Rezzed { get; set; }

    public int Strength { get; set; }

    public bool Packed { get; set; }

    public int Type { get; set; }

    public virtual PlayerCyberdeck? PlayerCyberdeck { get; set; }

    public virtual Program? Program { get; set; }

    public virtual NetObjType TypeNavigation { get; set; } = null!;
}
