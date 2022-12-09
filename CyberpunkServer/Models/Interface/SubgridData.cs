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

    public partial class SubgridData : iConvert
    {
        public static ICollection<CyberpunkServer.Models. Subgrid> CopyProperties(ICollection< SubgridData> orig, ICollection<CyberpunkServer.Models. Subgrid> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models. Subgrid> dictionary1 = new Dictionary<int, CyberpunkServer.Models. Subgrid>();
                Dictionary<int,  SubgridData> dictionary2 = new Dictionary<int,  SubgridData>();
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
                         SubgridData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models. Subgrid();
                        dest.Add( SubgridData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models. Subgrid> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any< SubgridData>())
                dest.Clear();
            return dest;
        }
        public static explicit operator SubgridData(CyberpunkServer.Models.Subgrid Subgrid)
        {
            var ret = Converter<SubgridData, Models.Subgrid>.ConvertType(Subgrid, new SubgridData());
            return ret;
        }

        public static List<SubgridData> ConvertList(ICollection<CyberpunkServer.Models.Subgrid> origs)
        {

            var ret = Converter<SubgridData, Subgrid>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.Subgrid CopyProperties(SubgridData Subgrid, Models.Subgrid dest, CyberpunkEntities db)
        {
            Converter<SubgridData, Subgrid>.ConvertType<SubgridData>(Subgrid, dest, "CopyProperties");
            return dest;
        }

    }
}