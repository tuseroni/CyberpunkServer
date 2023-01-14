using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CyberpunkServer.Models.DTO
{
    public partial class PlayerProgramsData:iDevicePrograms
    {
        public int id { get; set; }
        public Nullable<int> ProgramID { get; set; }
        public int PlayerID { get; set; }
        public bool Rezzed { get; set; }
        public int Strength { get; set; }
        public virtual ProgramData Program { get; set; }
		public bool Packed { get; set; } = false;

		public int MU
		{
			get
			{
				return Convert.ToInt32(Program.MU * (Packed ? 0.5 : 1));
			}
		}


	}
}