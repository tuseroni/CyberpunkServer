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

    public partial class StatData
    {
        public static explicit operator StatData(CyberpunkServer.Models.Stat player)
        {
            var ret = new StatData
            {
                id = player.id,
                Name = player.Name,
                Description = player.Description,
                ABBR = player.ABBR
            };

            return ret;
        }
    }
}
