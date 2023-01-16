using System;
using System.Collections.Generic;

namespace CyberpunkServer.Models;

public partial class PlayerPrograms
{
    public int id { get; set; }

    public int? ProgramID { get; set; }

    public int PlayerID { get; set; }

    public bool? Rezzed { get; set; }

    public int? Strength { get; set; }

    public virtual Player Player { get; set; } = null!;

    public virtual Program? Program { get; set; }
}
