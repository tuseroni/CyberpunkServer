//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CyberpunkServer.Models.DTO
{
    using System;
    using System.Collections.Generic;

    public partial class FortressData
    {
        
        public FortressData()
        {
            this.FortressCPU = new List<FortressCPUData>();
            this.FortressCodeGates = new List<FortressCodeGatesData>();
            this.FortressMemory = new List<FortressMemoryData>();
            this.FortressWalls = new List<FortressWallsData>();
            this.FortressRemotes = new List<FortressRemotesData>();
            this.FortressSkills = new List<FortressSkillsData>();
            this.FortressPrograms = new List<FortressProgramsData>();
        }

        public int id { get; set; }
        public Nullable<int> subgridID { get; set; }
        public Nullable<int> WallStrength { get; set; }
        public Nullable<int> Int 
        { 
            get
            {
                return FortressCPU.Count * 3;
            }
            set
            {

            }
        }
        public int? AI_Personality_ID { get; set; }

        public int? AI_ICON_ID { get; set; }

        public bool isAI 
        { 
            get
            {
                return FortressCPU.Count >= 4;
            }
            set
            { 
            }
        }
        public string Name { get; set; }
        public int TotalMU
        {
            get
            {
                return FortressMemory.Count * 10;

			}
        }
        public int AvailableMU
        {
            get
            {
                return TotalMU - (FortressPrograms.Sum(x => x.MU));
            }
        }

        public virtual AI_ICONData? AI_ICON { get; set; }

        public virtual AI_PersonalityData? AI_Personality { get; set; }


        public virtual List<FortressCPUData> FortressCPU { get; set; }
        public virtual List<FortressCodeGatesData> FortressCodeGates { get; set; }
        public virtual List<FortressMemoryData> FortressMemory { get; set; }
        public virtual List<FortressWallsData> FortressWalls { get; set; }
        public virtual List<FortressRemotesData> FortressRemotes { get; set; }
        public virtual List<FortressSkillsData> FortressSkills { get; set; }
        public virtual List<FortressProgramsData> FortressPrograms { get; set; }


    }
}
