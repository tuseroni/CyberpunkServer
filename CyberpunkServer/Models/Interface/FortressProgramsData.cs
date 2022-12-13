using System;
using System.Collections.Generic;
using System.Linq;

namespace CyberpunkServer.Models.DTO
{
    public partial class FortressProgramsData : iConvert
    {
        public static ICollection<CyberpunkServer.Models.FortressPrograms> CopyProperties(ICollection<FortressProgramsData> orig, ICollection<CyberpunkServer.Models.FortressPrograms> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.FortressPrograms> dictionary1 = new Dictionary<int, CyberpunkServer.Models.FortressPrograms>();
                Dictionary<int, FortressProgramsData> dictionary2 = new Dictionary<int, FortressProgramsData>();
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
                        FortressProgramsData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.FortressPrograms();
                        dest.Add(FortressProgramsData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models.FortressPrograms> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any<FortressProgramsData>())
                dest.Clear();
            return dest;
        }
        public static explicit operator FortressProgramsData(CyberpunkServer.Models.FortressPrograms FortressPrograms)
        {
            var ret = Converter<FortressProgramsData, Models.FortressPrograms>.ConvertType(FortressPrograms, new FortressProgramsData());
            return ret;
        }

        public static List<FortressProgramsData> ConvertList(ICollection<CyberpunkServer.Models.FortressPrograms> origs)
        {

            var ret = Converter<FortressProgramsData, FortressPrograms>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.FortressPrograms CopyProperties(FortressProgramsData FortressPrograms, Models.FortressPrograms dest, CyberpunkEntities db)
        {
            Converter<FortressProgramsData, FortressPrograms>.ConvertType<FortressProgramsData>(FortressPrograms, dest, "CopyProperties");
            return dest;
        }


    }
}