using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UnityEngine.UIElements;

namespace CyberpunkServer.Models.DTO
{
    public partial class FortressProgramsData : HasUiElement, RunningProgram
    {
        public VisualElement UIElement { get; set; }
        
    }
}