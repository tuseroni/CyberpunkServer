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

    public partial class StatData : iConvert
    {
        public static ICollection<CyberpunkServer.Models.Stat> CopyProperties(ICollection<StatData> orig, ICollection<CyberpunkServer.Models.Stat> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.Stat> dictionary1 = new Dictionary<int, CyberpunkServer.Models.Stat>();
                Dictionary<int, StatData> dictionary2 = new Dictionary<int, StatData>();
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
                        StatData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.Stat();
                        dest.Add(StatData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models.Stat> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any<StatData>())
                dest.Clear();
            return dest;
        }
        public static explicit operator StatData(CyberpunkServer.Models.Stat Stat)
        {
            var ret = Converter<StatData, Models.Stat>.ConvertType(Stat, new StatData());
            return ret;
        }

        public static List<StatData> ConvertList(ICollection<CyberpunkServer.Models.Stat> origs)
        {

            var ret = Converter<StatData, Stat>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.Stat CopyProperties(StatData Stat, Models.Stat dest, CyberpunkEntities db)
        {
            Converter<StatData, Stat>.ConvertType<StatData>(Stat, dest, "CopyProperties");
            return dest;
        }

    }
}