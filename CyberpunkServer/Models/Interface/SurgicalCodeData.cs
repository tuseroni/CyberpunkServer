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

    public partial class SurgicalCodeData : iConvert
    {
        public static ICollection<CyberpunkServer.Models.SurgicalCode> CopyProperties(ICollection<SurgicalCodeData> orig, ICollection<CyberpunkServer.Models.SurgicalCode> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.SurgicalCode> dictionary1 = new Dictionary<int, CyberpunkServer.Models.SurgicalCode>();
                Dictionary<int, SurgicalCodeData> dictionary2 = new Dictionary<int, SurgicalCodeData>();
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
                        SurgicalCodeData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.SurgicalCode();
                        dest.Add(SurgicalCodeData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models.SurgicalCode> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any<SurgicalCodeData>())
                dest.Clear();
            return dest;
        }
        public static explicit operator SurgicalCodeData(CyberpunkServer.Models.SurgicalCode SurgicalCode)
        {
            var ret = Converter<SurgicalCodeData, Models.SurgicalCode>.ConvertType(SurgicalCode, new SurgicalCodeData());
            return ret;
        }

        public static List<SurgicalCodeData> ConvertList(ICollection<CyberpunkServer.Models.SurgicalCode> origs)
        {

            var ret = Converter<SurgicalCodeData, SurgicalCode>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.SurgicalCode CopyProperties(SurgicalCodeData SurgicalCode, Models.SurgicalCode dest, CyberpunkEntities db)
        {
            Converter<SurgicalCodeData, SurgicalCode>.ConvertType<SurgicalCodeData>(SurgicalCode, dest, "CopyProperties");
            return dest;
        }

    }
}