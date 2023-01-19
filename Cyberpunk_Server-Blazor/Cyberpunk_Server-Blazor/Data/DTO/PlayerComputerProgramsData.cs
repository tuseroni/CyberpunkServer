﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;

namespace CyberpunkServer.Models.DTO
{
    public partial class PlayerComputerProgramsData: RunningProgram
	{
        public int id { get; set; }
        public Nullable<int> ProgramID { get; set; }
        public Nullable<int> PlayerComputerID { get; set; }
        public bool Rezzed { get; set; }
        public bool Packed { get; set; }
        public int Strength { get; set; }
        public int MU
        {
            get
            {
                return Convert.ToInt32(Program.MU * (Packed ? 0.5 : 1));
            }
        }
        public virtual ProgramData Program { get; set; }
        public int? OwnerID { get; set; }
        public int xPos { get; set; }
        public int yPos { get; set; }
        public int DeviceID
        {
            get
            {
                return PlayerComputerID.Value;
            }
            set
            {

            }
        }
        public string DeviceType { get; set; } = "Computer";
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

		public int Type { get; set; }
        public NetObjTypeData NetObjType { get; set; }
        public NetObjTypeData TypeNavigation
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
    }
}