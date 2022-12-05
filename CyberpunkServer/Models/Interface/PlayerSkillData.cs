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
    public partial class PlayerSkillData
    {
        
        public static ICollection<PlayerSkillData> ConvertList(ICollection<CyberpunkServer.Models.PlayerSkill> origs)
        {
            var ret = new HashSet<PlayerSkillData>();
            foreach (var orig in origs)
            {
                var dest = new PlayerSkillData();
                dest.id = orig.id;
                dest.Ranks = orig.Ranks;
                dest.Bonus = orig.Bonus;
                dest.CurrentIP = orig.CurrentIP;
                dest.PlayerID = orig.PlayerID;
                dest.SkillID = orig.SkillID;
                dest.Skill = (SkillData)orig.Skill;
                ret.Add(dest);
            }
            return ret;
        }
        public static ICollection<CyberpunkServer.Models.PlayerSkill> CopyProperties(ICollection<PlayerSkillData> orig, ICollection<CyberpunkServer.Models.PlayerSkill> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.PlayerSkill> dictionary1 = new Dictionary<int, CyberpunkServer.Models.PlayerSkill>();
                Dictionary<int, PlayerSkillData> dictionary2 = new Dictionary<int, PlayerSkillData>();
                if (dest.Any())
                {
                    foreach (var obj in dest)
                        dictionary1.Add(obj.id, obj);
                }
                foreach (var orig1 in orig)
                {
                    if (dictionary1.ContainsKey(orig1.id))
                    {
                        var dest1 = dictionary1[orig1.id];
                        PlayerSkillData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.PlayerSkill();
                        dest.Add(PlayerSkillData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models.PlayerSkill> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any<PlayerSkillData>())
                dest.Clear();
            return dest;
        }
        public static CyberpunkServer.Models.PlayerSkill CopyProperties(PlayerSkillData orig, CyberpunkServer.Models.PlayerSkill dest, CyberpunkEntities db)
        {
            dest.Ranks = orig.Ranks;
            dest.Bonus = orig.Bonus;
            dest.CurrentIP = orig.CurrentIP;
            dest.id = orig.id;
            dest.PlayerID = orig.PlayerID;
            dest.SkillID = orig.SkillID;
            return dest;
        }
        public static explicit operator PlayerSkillData(CyberpunkServer.Models.PlayerSkill orig)
        {
            var dest = new PlayerSkillData();
            dest.id = orig.id;
            dest.Ranks = orig.Ranks;
            dest.Bonus = orig.Bonus;
            dest.CurrentIP = orig.CurrentIP;
            dest.PlayerID = orig.PlayerID;
            dest.SkillID = orig.SkillID;
            dest.Skill = (SkillData)orig.Skill;
            return dest;
        }
    }
}
