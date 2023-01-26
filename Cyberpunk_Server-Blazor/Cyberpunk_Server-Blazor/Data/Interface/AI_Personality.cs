using System;
using System.Collections.Generic;
using System.Linq;


namespace CyberpunkServer.Models.DTO;

public partial class AI_PersonalityData:iConvert
{

    public static ICollection<CyberpunkServer.Models.AI_Personality> CopyProperties(ICollection<AI_PersonalityData> orig, ICollection<CyberpunkServer.Models.AI_Personality> dest, CyberpunkEntities db)
    {
        if (orig.Any())
        {
            Dictionary<int, CyberpunkServer.Models.AI_Personality> dictionary1 = new Dictionary<int, CyberpunkServer.Models.AI_Personality>();
            Dictionary<int, AI_PersonalityData> dictionary2 = new Dictionary<int, AI_PersonalityData>();
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
                    AI_PersonalityData.CopyProperties(orig1, dest1, db);
                }
                else
                {
                    var dest2 = new Models.AI_Personality();
                    dest.Add(AI_PersonalityData.CopyProperties(orig1, dest2, db));
                }
                if (orig1.id != 0)
                {
                    dictionary2.Add(orig1.id, orig1);
                }
            }
            foreach (KeyValuePair<int, Models.AI_Personality> keyValuePair in dictionary1)
            {
                if (!dictionary2.ContainsKey(keyValuePair.Key))
                    dest.Remove(keyValuePair.Value);
            }
        }
        else if (dest != null && !orig.Any<AI_PersonalityData>())
            dest.Clear();
        return dest;
    }
    public static explicit operator AI_PersonalityData(CyberpunkServer.Models.AI_Personality AI_Personality)
    {
        var ret = Converter<AI_PersonalityData, Models.AI_Personality>.ConvertType(AI_Personality, new AI_PersonalityData());
        return ret;
    }

    public static List<AI_PersonalityData> ConvertList(ICollection<CyberpunkServer.Models.AI_Personality> origs)
    {

        var ret = Converter<AI_PersonalityData, AI_Personality>.ConvertList(origs);
        return ret;
    }

    public static CyberpunkServer.Models.AI_Personality CopyProperties(AI_PersonalityData AI_Personality, Models.AI_Personality dest, CyberpunkEntities db)
    {
        Converter<AI_PersonalityData, AI_Personality>.ConvertType<AI_PersonalityData>(AI_Personality, dest, "CopyProperties");
        return dest;
    }

}
