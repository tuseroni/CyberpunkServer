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
    using System.Data.Entity;

    public partial class PlayerData
    {
        public static explicit operator PlayerData(CyberpunkServer.Models.Player player)
        {
            var ret = new PlayerData
            {
                id = player.id,
                Handle = player.Handle,
                SIN = player.SIN,
                IP = player.IP,
                REP = player.REP,
                Humanity = player.Humanity,
                Dammage = player.Dammage,
                RoleID = player.RoleID,
                aspUserID = player.aspUserID
            };
            ret.PlayerStat = DTO.PlayerStatData.ConvertList(player.PlayerStat).ToList();
            ret.PlayerArmor = DTO.PlayerArmorData.ConvertList(player.PlayerArmor);
            ret.PlayerCybernetics = DTO.PlayerCyberneticsData.ConvertList(player.PlayerCybernetics);
            ret.PlayerWeapon = DTO.PlayerWeaponData.ConvertList(player.PlayerWeapon);
            ret.PlayerSkill = DTO.PlayerSkillData.ConvertList(player.PlayerSkill).ToList();
            ret.SkillLookup = ret.PlayerSkill.ToDictionary(x => x.id, x => x);
            ret.StatLookup = ret.PlayerStat.ToDictionary(x => x.Stat.ABBR, x => x);
            return ret;
        }

        public static CyberpunkServer.Models.Player CopyProperties(PlayerData player,Models.Player dest, CyberpunkEntities db)
        {
            dest.id = player.id;
            dest.Handle = player.Handle;
            dest.SIN = player.SIN;
            dest.IP = player.IP;
            dest.REP = player.REP;
            dest.Humanity = player.Humanity;
            dest.Dammage = player.Dammage;
            dest.RoleID = player.RoleID;
            dest.aspUserID = player.aspUserID;
            DTO.PlayerStatData.CopyProperties(player.PlayerStat, dest.PlayerStat, db);
            DTO.PlayerArmorData.CopyProperties(player.PlayerArmor, dest.PlayerArmor, db);
            DTO.PlayerCyberneticsData.CopyProperties(player.PlayerCybernetics, dest.PlayerCybernetics, db);
            DTO.PlayerWeaponData.CopyProperties(player.PlayerWeapon, dest.PlayerWeapon, db);
            DTO.PlayerSkillData.CopyProperties(player.PlayerSkill, dest.PlayerSkill, db);
            return dest;
        }
        
    }
}