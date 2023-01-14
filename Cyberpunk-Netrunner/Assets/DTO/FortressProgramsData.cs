using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CyberpunkServer.Models.DTO
{
    public partial class FortressProgramsData
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

    }
}