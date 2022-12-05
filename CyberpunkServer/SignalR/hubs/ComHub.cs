using CyberpunkServer.Models;
using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;

namespace CyberpunkServer.SignalR.hubs
{
    public class ComHub : Hub
    {
        private CyberpunkEntities db = new CyberpunkEntities();
        public void Send(string name, string message)
        {
            Clients.All.addNewMessageToPage(name, message);
        }
        public void PlayerMove(int PlayerID, int x, int y)
        {
            Clients.Others.PlayerMove(PlayerID, x, y);
        }
        public void AcceptJackInRequest(Models.DTO.PlayerData player, Models.DTO.SubgridData gridData)
        {
            Clients.Others.JackInRequestAccepted(player, gridData);
        }
        public void JackInRequest(int id)
        {
            Player player = db.Player
                .Include(p => p.PlayerRoles)
                .Include(p => p.PlayerSkill)
                .Include(p => p.PlayerStat)
                .Include("PlayerSkill.Skill")
                .Include("PlayerSkill.Skill.SkillTypes")
                .Include(p => p.PlayerWeapon)
                .Include(p => p.PlayerArmor)
                .Include(p => p.PlayerCybernetics)
                .Include(p => p.AspNetUsers)
                .AsNoTracking()
                .Where(p => p.id == id).Single();
            //Subgrid grid = db.Subgrid
            //    .Include(x=>x.Fortress)
            //    .Include("Fortress.FortressCodeGates")
            //    .Include("Fortress.FortressCPU")
            //    .Include("Fortress.FortressMemory")
            //    .Include("Fortress.FortressWalls")
            //    .AsNoTracking()
            //    .Single();
            //Models.DTO.SubgridData gridData = (Models.DTO.SubgridData)grid;
            Models.DTO.PlayerData playerData = (Models.DTO.PlayerData)player;
            
            Clients.Others.JackInRequestReceived(playerData);
            //Clients.All.JackInRequestAccepted(playerData);
        }
    }
}