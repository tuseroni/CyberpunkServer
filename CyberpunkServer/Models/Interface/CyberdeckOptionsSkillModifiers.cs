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
    
    public partial class CyberdeckOptionsSkillModifiersData : iConvert
    {
        public static explicit operator CyberdeckOptionsSkillModifiersData(CyberpunkServer.Models.CyberdeckOptionsSkillModifiers CyberdeckOptionsSkillModifiers)
        {
            var ret = Converter<CyberdeckOptionsSkillModifiersData, Models.CyberdeckOptionsSkillModifiers>.ConvertType(CyberdeckOptionsSkillModifiers, new CyberdeckOptionsSkillModifiersData());
            return ret;
        }

        public static List<CyberdeckOptionsSkillModifiersData> ConvertList(ICollection<CyberpunkServer.Models.CyberdeckOptionsSkillModifiers> origs)
        {

            var ret = Converter<CyberdeckOptionsSkillModifiersData, CyberdeckOptionsSkillModifiers>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.CyberdeckOptionsSkillModifiers CopyProperties(CyberdeckOptionsSkillModifiersData CyberdeckOptionsSkillModifiers, Models.CyberdeckOptionsSkillModifiers dest, CyberpunkEntities db)
        {
            Converter<CyberdeckOptionsSkillModifiersData, CyberdeckOptionsSkillModifiers>.ConvertType<CyberdeckOptionsSkillModifiersData>(CyberdeckOptionsSkillModifiers, dest, "CopyProperties");
            return dest;
        }

    }
}
