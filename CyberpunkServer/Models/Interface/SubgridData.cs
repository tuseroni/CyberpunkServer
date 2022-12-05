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

    public partial class SubgridData
    {
        public static explicit operator SubgridData(CyberpunkServer.Models.Subgrid orig)
        {
            var ret = new SubgridData
            {
                id = orig.id,
                width = orig.width,
                height = orig.height,
                Name = orig.Name
            };
            ret.Fortress = FortressData.ConvertList(orig.Fortress);
            return ret;
        }

        public static CyberpunkServer.Models.Subgrid CopyProperties(SubgridData orig, Models.Subgrid dest, CyberpunkEntities db)
        {
            dest.id = orig.id;
            dest.width = orig.width;
            dest.height = orig.height;
            dest.Name = orig.Name;
            FortressData.CopyProperties(orig.Fortress, dest.Fortress, db);
            return dest;
        }

    }
}