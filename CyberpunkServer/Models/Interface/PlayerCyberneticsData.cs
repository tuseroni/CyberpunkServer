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

    public partial class PlayerCyberneticsData
    {
        
        public static ICollection<PlayerCyberneticsData> ConvertList(ICollection<CyberpunkServer.Models.PlayerCybernetics> origs)
        {
            var ret = new HashSet<PlayerCyberneticsData>();
            foreach (var orig in origs)
            {
                var dest = new PlayerCyberneticsData();
                dest.id = orig.id;
                dest.HL = orig.HL;
                dest.CyberneticID = orig.CyberneticID;
                dest.Cost = orig.Cost;
                dest.PlayerID = orig.PlayerID;
                ret.Add(dest);
            }
            return ret;
        }

        public static ICollection<CyberpunkServer.Models.PlayerCybernetics> CopyProperties(ICollection<PlayerCyberneticsData> orig, ICollection<CyberpunkServer.Models.PlayerCybernetics> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.PlayerCybernetics> dictionary1 = new Dictionary<int, CyberpunkServer.Models.PlayerCybernetics>();
                Dictionary<int, PlayerCyberneticsData> dictionary2 = new Dictionary<int, PlayerCyberneticsData>();
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
                        PlayerCyberneticsData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.PlayerCybernetics();
                        dest.Add(PlayerCyberneticsData.CopyProperties(orig1, dest2, db));
                    }
                    dictionary2.Add(orig1.id, orig1);
                }
                foreach (KeyValuePair<int, Models.PlayerCybernetics> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any<PlayerCyberneticsData>())
                dest.Clear();
            return dest;
        }
        public static CyberpunkServer.Models.PlayerCybernetics CopyProperties(PlayerCyberneticsData orig, CyberpunkServer.Models.PlayerCybernetics dest, CyberpunkEntities db)
        {
            dest.id = orig.id;
            dest.HL = orig.HL;
            dest.CyberneticID = orig.CyberneticID;
            dest.Cost = orig.Cost;
            dest.PlayerID = orig.PlayerID;
            return null;
        }
    }
}