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

    public partial class PlayerComputerData : iConvert
    {
        public static ICollection<CyberpunkServer.Models.PlayerComputer> CopyProperties(ICollection<PlayerComputerData> orig, ICollection<CyberpunkServer.Models.PlayerComputer> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.PlayerComputer> dictionary1 = new Dictionary<int, CyberpunkServer.Models.PlayerComputer>();
                Dictionary<int, PlayerComputerData> dictionary2 = new Dictionary<int, PlayerComputerData>();
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
                        PlayerComputerData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.PlayerComputer();
                        dest.Add(PlayerComputerData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models.PlayerComputer> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any<PlayerComputerData>())
                dest.Clear();
            return dest;
        }
        public static explicit operator PlayerComputerData(CyberpunkServer.Models.PlayerComputer PlayerComputer)
        {
            var ret = Converter<PlayerComputerData, Models.PlayerComputer>.ConvertType(PlayerComputer, new PlayerComputerData());
            ret.Improvements = ret.PlayerComputerImprovements.ToDictionary(x => x.ComputerImprovements.ImprovementFor, x => x.ComputerImprovements.ImprovementAmount * x.Quantity ?? 1);
            return ret;
        }

        public static List<PlayerComputerData> ConvertList(ICollection<CyberpunkServer.Models.PlayerComputer> origs)
        {

            var ret = Converter<PlayerComputerData, PlayerComputer>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.PlayerComputer CopyProperties(PlayerComputerData PlayerComputer, Models.PlayerComputer dest, CyberpunkEntities db)
        {
            Converter<PlayerComputerData, PlayerComputer>.ConvertType<PlayerComputerData>(PlayerComputer, dest, "CopyProperties");
            return dest;
        }

    }
}