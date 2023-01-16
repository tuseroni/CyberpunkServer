
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Web;

namespace CyberpunkServer.Models.DTO
{
    public partial class PlayerProgramsData:RunningProgram
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

        public int? OwnerID { get => PlayerID; set { } }
        public int xPos { get; set; }
        public int yPos { get; set; }
        public int DeviceID { get; set; }
        public string DeviceType { get; set; }
        string _uuid = Guid.NewGuid().ToString();
        public string UUID
        {
            get
            {
                return _uuid;
            }
            set
            {
                _uuid = value;
            }
        }

		public NetObjTypeData NetObjType { get; set; }
	}
}