//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CyberpunkServer.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Fortress
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Fortress()
        {
            this.FortressCPU = new HashSet<FortressCPU>();
            this.FortressCodeGates = new HashSet<FortressCodeGates>();
            this.FortressMemory = new HashSet<FortressMemory>();
            this.FortressSkills = new HashSet<FortressSkills>();
            this.FortressWalls = new HashSet<FortressWalls>();
            this.FortressRemotes = new HashSet<FortressRemotes>();
            this.Program = new HashSet<Program>();
        }
    
        public int id { get; set; }
        public Nullable<int> subgridID { get; set; }
        public Nullable<int> WallStrength { get; set; }
        public Nullable<int> Int { get; set; }
        public string Name { get; set; }
    
        public virtual Subgrid Subgrid { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FortressCPU> FortressCPU { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FortressCodeGates> FortressCodeGates { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FortressMemory> FortressMemory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FortressSkills> FortressSkills { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FortressWalls> FortressWalls { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FortressRemotes> FortressRemotes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Program> Program { get; set; }
    }
}
