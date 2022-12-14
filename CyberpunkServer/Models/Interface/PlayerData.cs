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
    public interface iConvert
    {

    }
    public static class Extensions
    {
        public static bool IsGenericList(this object o)
        {
            var oType = o.GetType();
            return (oType.IsGenericType && (oType.GetGenericTypeDefinition() == typeof(List<>)));
        }
    }
    public static class Converter<t, u> where t: iConvert, new() where u:new()
    {
        public static u ConvertType<t>(t orig,u dest, string converterMethod = "CopyProperties", CyberpunkEntities db = null)
        {
            if (dest == null)
            {
                dest = new u();
            }
            var props = orig.GetType().GetProperties();
            foreach (var prop in props)
            {
                var destProperty = dest.GetType().GetProperty(prop.Name);
                if (destProperty == null)
                {
                    Console.WriteLine($"Property {prop.Name} does not exist");
                    continue;
                }
                if (destProperty.PropertyType.IsAssignableFrom(prop.PropertyType))
                {
                    destProperty.SetValue(dest, prop.GetValue(orig));
                }
                else if (prop.PropertyType.IsGenericType && (prop.PropertyType.GetGenericTypeDefinition() == typeof(List<>) || prop.PropertyType.GetGenericTypeDefinition() == typeof(ICollection<>)))
                {
                    if (prop.PropertyType.GetGenericArguments()[0].GetMethod(converterMethod, new[] { prop.PropertyType, destProperty.PropertyType, typeof(CyberpunkEntities) }) != null)
                    {

                        prop.PropertyType.GetGenericArguments()[0].GetMethod(converterMethod, new[] { prop.PropertyType, destProperty.PropertyType, typeof(CyberpunkEntities) })
                        .Invoke(orig, new object[] { prop.GetValue(orig), destProperty.GetValue(dest), db });
                            
                    }
                }
                //else if (prop.PropertyType.GetMethod("op_Explicit") != null)
                //{
                //    destProperty.SetValue(dest, prop.PropertyType.GetMethod("op_Explicit").Invoke(dest, new object[] { prop.GetValue(orig) }));
                //}
            }
            return dest;
        }
        public static t ConvertType<u>(u orig,t dest,string converterMethod="ConvertList", CyberpunkEntities db = null)
        {
            if(dest==null)
            {
                dest = new t();
            }
            if(orig==null)
            {
                return default(t);
            }
            var props = dest.GetType().GetProperties();
            foreach (var prop in props)
            {
                var origProperty = orig.GetType().GetProperty(prop.Name);
                if (origProperty == null)
                {
                    Console.WriteLine($"Property {prop.Name} does not exist");
                    continue;
                }
                if (prop.PropertyType.IsAssignableFrom(origProperty.PropertyType))
                {
                    prop.SetValue(dest, origProperty.GetValue(orig));
                }
                else if (prop.PropertyType.IsGenericType && (prop.PropertyType.GetGenericTypeDefinition() == typeof(List<>) || prop.PropertyType.GetGenericTypeDefinition() == typeof(ICollection<>)))
                {
                    if (prop.PropertyType.GetGenericArguments()[0].GetMethod(converterMethod) != null)
                    {
                        prop.SetValue(dest, prop.PropertyType.GetGenericArguments()[0].GetMethod(converterMethod).Invoke(dest, new object[] { origProperty.GetValue(orig) }));
                    }
                }
                else if (prop.PropertyType.GetMethod("op_Explicit") != null)
                {
                    prop.SetValue(dest, prop.PropertyType.GetMethod("op_Explicit").Invoke(dest, new object[] { origProperty.GetValue(orig) }));
                }
            }
            return dest;
        }
        public static List<t> ConvertList<u>(ICollection<u> origs)
        {
            var ret = new List<t>();
            foreach (var orig in origs)
            {
                var dest = new t();
                var cast = dest.GetType().GetMethod("op_Explicit");
                if(cast !=null)
                {
                    dest=(t)cast.Invoke(dest, new object[] { orig });
                }
                else
                {
                    ConvertType<u>(orig, dest);
                }
                
                //var dest = ConvertType<u>(orig, new t());
                
                ret.Add(dest);
            }
            return ret;
        }
    }

    public partial class PlayerData: iConvert
    {

        public static ICollection<CyberpunkServer.Models.Player> CopyProperties(ICollection<PlayerData> orig, ICollection<CyberpunkServer.Models.Player> dest, CyberpunkEntities db)
        {
            if (orig.Any())
            {
                Dictionary<int, CyberpunkServer.Models.Player> dictionary1 = new Dictionary<int, CyberpunkServer.Models.Player>();
                Dictionary<int, PlayerData> dictionary2 = new Dictionary<int, PlayerData>();
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
                        PlayerData.CopyProperties(orig1, dest1, db);
                    }
                    else
                    {
                        var dest2 = new Models.Player();
                        dest.Add(PlayerData.CopyProperties(orig1, dest2, db));
                    }
                    if (orig1.id != 0)
                    {
                        dictionary2.Add(orig1.id, orig1);
                    }
                }
                foreach (KeyValuePair<int, Models.Player> keyValuePair in dictionary1)
                {
                    if (!dictionary2.ContainsKey(keyValuePair.Key))
                        dest.Remove(keyValuePair.Value);
                }
            }
            else if (dest != null && !orig.Any<PlayerData>())
                dest.Clear();
            return dest;
        }

        public static explicit operator PlayerData(CyberpunkServer.Models.Player player)
        {
            var ret = Converter<PlayerData, Models.Player>.ConvertType(player,new PlayerData());
            ret.SkillLookup = ret.PlayerSkill.ToDictionary(x => x.id, x => x);
            ret.StatLookup = ret.PlayerStat.ToDictionary(x => x.Stat.ABBR, x => x);
            return ret;
        }

        public static List<PlayerData> ConvertList(ICollection<CyberpunkServer.Models.Player> origs)
        {
            
            var ret = Converter<PlayerData, Player>.ConvertList(origs);
            return ret;
        }

        public static CyberpunkServer.Models.Player CopyProperties(PlayerData player,Models.Player dest, CyberpunkEntities db)
        {
            Converter<PlayerData, Player>.ConvertType<PlayerData>(player, dest, "CopyProperties", db);
            return dest;
        }
        
    }
}
