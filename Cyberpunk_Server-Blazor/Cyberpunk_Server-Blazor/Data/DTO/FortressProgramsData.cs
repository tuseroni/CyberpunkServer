using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CyberpunkServer.Models.DTO
{
    public partial class FortressProgramsData:RunningProgram
    {
        public int id { get; set; }
        public Nullable<int> ProgramID { get; set; }
        public Nullable<int> FortressID { get; set; }
        public bool Rezzed { get; set; }
        public int Strength { get; set; }
        public int xPos { get; set; }
        public int yPos { get; set; }
        public virtual ProgramData Program { get; set; }
		public int Type { get; set; } = 5;
		public virtual NetObjTypeData TypeNavigation
		{
			get
			{
				return NetObjType;

			}
			set
			{
				NetObjType = value;

			}
		}
		public virtual NetObjTypeData NetObjType { get; set; }
        public int? OwnerID { get; set; }

        public int DeviceID
        {
            get
            {
                return FortressID.Value;
            }
            set
            {

            }
        }
        public string DeviceType { get; set; } = "Fortress";
        public bool Packed { get => false; set { } }

        public int MU
        {
            get
            {
                return Convert.ToInt32(Program.MU * (Packed ? 0.5 : 1));
            }
        }

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

	}
}