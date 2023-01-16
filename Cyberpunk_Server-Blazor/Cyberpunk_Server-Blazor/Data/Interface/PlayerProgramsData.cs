using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CyberpunkServer.Models.DTO
{
    public partial class PlayerProgramsData : iConvert
    {
        public static ICollection<CyberpunkServer.Models.PlayerPrograms> CopyProperties(ICollection<PlayerProgramsData> orig, ICollection<CyberpunkServer.Models.PlayerPrograms> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.PlayerPrograms> dictionary1 = new Dictionary<int, CyberpunkServer.Models.PlayerPrograms>();
                Dictionary<int, PlayerProgramsData> dictionary2 = new Dictionary<int, PlayerProgramsData>();
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
                        PlayerProgramsData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.PlayerPrograms();
                        dest.Add(PlayerProgramsData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models.PlayerPrograms> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                    {
                        db.Entry(keyValuePair.Value).State = EntityState.Deleted;
                        dest.Remove(keyValuePair.Value);
                    }
                }
            }
            else if (dest != null && !orig.Any<PlayerProgramsData>())
                dest.Clear();
            return dest;
        }
        public static explicit operator PlayerProgramsData(CyberpunkServer.Models.PlayerPrograms PlayerPrograms)
        {
            var ret = Converter<PlayerProgramsData, Models.PlayerPrograms>.ConvertType(PlayerPrograms, new PlayerProgramsData());
            return ret;
        }

        public static List<PlayerProgramsData> ConvertList(ICollection<CyberpunkServer.Models.PlayerPrograms> origs)
        {

            var ret = Converter<PlayerProgramsData, PlayerPrograms>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.PlayerPrograms CopyProperties(PlayerProgramsData PlayerPrograms, Models.PlayerPrograms dest, CyberpunkEntities db)
        {
            Converter<PlayerProgramsData, PlayerPrograms>.ConvertType<PlayerProgramsData>(PlayerPrograms, dest, "CopyProperties",db);
            return dest;
        }


    }
}