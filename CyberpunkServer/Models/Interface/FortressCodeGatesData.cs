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
    public partial class FortressCodeGatesData : iConvert
    {
        public static ICollection<CyberpunkServer.Models.FortressCodeGates> CopyProperties(ICollection<FortressCodeGatesData> orig, ICollection<CyberpunkServer.Models.FortressCodeGates> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.FortressCodeGates> dictionary1 = new Dictionary<int, CyberpunkServer.Models.FortressCodeGates>();
                Dictionary<int, FortressCodeGatesData> dictionary2 = new Dictionary<int, FortressCodeGatesData>();
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
                        FortressCodeGatesData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.FortressCodeGates();
                        dest.Add(FortressCodeGatesData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models.FortressCodeGates> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any<FortressCodeGatesData>())
                dest.Clear();
            return dest;
        }
        public static explicit operator FortressCodeGatesData(CyberpunkServer.Models.FortressCodeGates FortressCodeGates)
        {
            var ret = Converter<FortressCodeGatesData, Models.FortressCodeGates>.ConvertType(FortressCodeGates, new FortressCodeGatesData());
            return ret;
        }

        public static List<FortressCodeGatesData> ConvertList(ICollection<CyberpunkServer.Models.FortressCodeGates> origs)
        {

            var ret = Converter<FortressCodeGatesData, FortressCodeGates>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.FortressCodeGates CopyProperties(FortressCodeGatesData FortressCodeGates, Models.FortressCodeGates dest, CyberpunkEntities db)
        {
            Converter<FortressCodeGatesData, FortressCodeGates>.ConvertType<FortressCodeGatesData>(FortressCodeGates, dest, "CopyProperties");
            return dest;
        }


    }
}
