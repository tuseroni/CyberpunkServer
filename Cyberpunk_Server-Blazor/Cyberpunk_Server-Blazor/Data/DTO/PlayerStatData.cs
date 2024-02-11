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
    using System.Linq;
    [Serializable]
    public partial class PlayerStatData
    {
        public PlayerStatData()
        {
            this.PlayerStatModifiers = new List<PlayerStatModifiersData>();
        }
        public int id { get; set; }
        public Nullable<int> StatID { get; set; }
        public Nullable<int> Base { get; set; }
        public Nullable<int> Bonus { get; set; }
        public Nullable<int> Current { get; set; }
        public Nullable<int> PlayerID { get; set; }

        public virtual StatData Stat { get; set; }
        public virtual List<PlayerStatModifiersData> PlayerStatModifiers { get; set; }
        public int Total
        {
            get
            {
                return (int)(Base + (PlayerStatModifiers == null ? 0 : (int)PlayerStatModifiers.Sum(x => x.amount)));
            }
        }

    }
}
