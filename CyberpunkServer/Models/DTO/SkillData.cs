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

    public partial class SkillData
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SkillData()
        {
        }

        public int id { get; set; }
        public string Name { get; set; }
        public Nullable<int> SkillType { get; set; }
        public Nullable<int> StatID { get; set; }
        public string Description { get; set; }
        public int Multiplier { get; set; }
        public virtual StatData Stat { get; set; }
        public virtual SkillTypesData SkillTypes { get; set; }
       
    }
}
