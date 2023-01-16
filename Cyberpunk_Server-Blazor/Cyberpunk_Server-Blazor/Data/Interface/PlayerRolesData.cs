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
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public partial class PlayerRolesData : iConvert
    {
        public static ICollection<CyberpunkServer.Models.PlayerRoles> CopyProperties(ICollection<PlayerRolesData> orig, ICollection<CyberpunkServer.Models.PlayerRoles> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.PlayerRoles> dictionary1 = new Dictionary<int, CyberpunkServer.Models.PlayerRoles>();
                Dictionary<int, PlayerRolesData> dictionary2 = new Dictionary<int, PlayerRolesData>();
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
                        PlayerRolesData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.PlayerRoles();
                        dest.Add(PlayerRolesData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models.PlayerRoles> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any<PlayerRolesData>())
                dest.Clear();
            return dest;
        }
        public static explicit operator PlayerRolesData(CyberpunkServer.Models.PlayerRoles PlayerRoles)
        {
            var ret = Converter<PlayerRolesData, Models.PlayerRoles>.ConvertType(PlayerRoles, new PlayerRolesData());
            return ret;
        }

        public static List<PlayerRolesData> ConvertList(ICollection<CyberpunkServer.Models.PlayerRoles> origs)
        {

            var ret = Converter<PlayerRolesData, PlayerRoles>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.PlayerRoles CopyProperties(PlayerRolesData PlayerRoles, Models.PlayerRoles dest, CyberpunkEntities db)
        {
            Converter<PlayerRolesData, PlayerRoles>.ConvertType<PlayerRolesData>(PlayerRoles, dest, "CopyProperties");
            return dest;
        }

    }
}
