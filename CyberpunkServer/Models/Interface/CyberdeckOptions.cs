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
    
    public partial class CyberdeckOptionsData : iConvert
    {
        public static explicit operator CyberdeckOptionsData(CyberpunkServer.Models.CyberdeckOptions CyberdeckOptions)
        {
            var ret = Converter<CyberdeckOptionsData, Models.CyberdeckOptions>.ConvertType(CyberdeckOptions, new CyberdeckOptionsData());
            return ret;
        }

        public static List<CyberdeckOptionsData> ConvertList(ICollection<CyberpunkServer.Models.CyberdeckOptions> origs)
        {

            var ret = Converter<CyberdeckOptionsData, CyberdeckOptions>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.CyberdeckOptions CopyProperties(CyberdeckOptionsData CyberdeckOptions, Models.CyberdeckOptions dest, CyberpunkEntities db)
        {
            Converter<CyberdeckOptionsData, CyberdeckOptions>.ConvertType<CyberdeckOptionsData>(CyberdeckOptions, dest, "CopyProperties");
            return dest;
        }


    }
}
