using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UnityEngine.UIElements;

namespace CyberpunkServer.Models.DTO
{
    public partial class FortressProgramsData : HasUiElement, RunningProgram
    {
        public int? OwnerID{ get; set; }
        public VisualElement UIElement { get; set; }
        
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
	}
}