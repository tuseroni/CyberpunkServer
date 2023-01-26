using System;
using System.Collections.Generic;
using System.Linq;

namespace CyberpunkServer.Models.DTO;

public partial class AI_ICONData:iConvert
{
    public static ICollection<CyberpunkServer.Models.AI_ICON> CopyProperties(ICollection<AI_ICONData> orig, ICollection<CyberpunkServer.Models.AI_ICON> dest, CyberpunkEntities db)
    {
        if (orig.Any())
        {
            Dictionary<int, CyberpunkServer.Models.AI_ICON> dictionary1 = new Dictionary<int, CyberpunkServer.Models.AI_ICON>();
            Dictionary<int, AI_ICONData> dictionary2 = new Dictionary<int, AI_ICONData>();
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
                    AI_ICONData.CopyProperties(orig1, dest1, db);
                }
                else
                {
                    var dest2 = new Models.AI_ICON();
                    dest.Add(AI_ICONData.CopyProperties(orig1, dest2, db));
                }
                if (orig1.id != 0)
                {
                    dictionary2.Add(orig1.id, orig1);
                }
            }
            foreach (KeyValuePair<int, Models.AI_ICON> keyValuePair in dictionary1)
            {
                if (!dictionary2.ContainsKey(keyValuePair.Key))
                    dest.Remove(keyValuePair.Value);
            }
        }
        else if (dest != null && !orig.Any<AI_ICONData>())
            dest.Clear();
        return dest;
    }
    public static explicit operator AI_ICONData(CyberpunkServer.Models.AI_ICON AI_ICON)
    {
        var ret = Converter<AI_ICONData, Models.AI_ICON>.ConvertType(AI_ICON, new AI_ICONData());
        return ret;
    }

    public static List<AI_ICONData> ConvertList(ICollection<CyberpunkServer.Models.AI_ICON> origs)
    {

        var ret = Converter<AI_ICONData, AI_ICON>.ConvertList(origs);
        return ret;
    }

    public static CyberpunkServer.Models.AI_ICON CopyProperties(AI_ICONData AI_ICON, Models.AI_ICON dest, CyberpunkEntities db)
    {
        Converter<AI_ICONData, AI_ICON>.ConvertType<AI_ICONData>(AI_ICON, dest, "CopyProperties");
        return dest;
    }

}
