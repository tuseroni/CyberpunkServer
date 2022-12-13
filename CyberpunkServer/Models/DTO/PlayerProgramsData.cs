using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CyberpunkServer.Models.DTO
{
    public partial class PlayerProgramsData
    {
        public int id { get; set; }
        public Nullable<int> ProgramID { get; set; }
        public Nullable<int> PlayerID { get; set; }
        public bool Rezzed { get; set; }
        public Nullable<int> Strength { get; set; }
        public virtual ProgramData Program { get; set; }
    }
}