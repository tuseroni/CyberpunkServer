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
    
    public partial class CyberdeckImprovementsData : iConvert
    {
        public static explicit operator CyberdeckImprovementsData(CyberpunkServer.Models.CyberdeckImprovements CyberdeckImprovements)
        {
            var ret = Converter<CyberdeckImprovementsData, Models.CyberdeckImprovements>.ConvertType(CyberdeckImprovements, new CyberdeckImprovementsData());
            return ret;
        }

        public static List<CyberdeckImprovementsData> ConvertList(ICollection<CyberpunkServer.Models.CyberdeckImprovements> origs)
        {

            var ret = Converter<CyberdeckImprovementsData, CyberdeckImprovements>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.CyberdeckImprovements CopyProperties(CyberdeckImprovementsData CyberdeckImprovements, Models.CyberdeckImprovements dest, CyberpunkEntities db)
        {
            Converter<CyberdeckImprovementsData, CyberdeckImprovements>.ConvertType<CyberdeckImprovementsData>(CyberdeckImprovements, dest, "CopyProperties");
            return dest;
        }


    }
}
