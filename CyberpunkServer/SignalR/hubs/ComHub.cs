using CyberpunkServer.Models;
using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using Microsoft.AspNet.Identity;
using System.Security.Cryptography;
using System.Text;

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
        public void RejectJackInRequest(Models.DTO.PlayerData player)
        {
            Clients.Others.JackInRequestRejected(player);
        }
        public void Login(string email,string password)
        {
            var user=db.AspNetUsers.Include(x=>x.Player)
                .Include("Player.PlayerRoles")
                .Include("Player.PlayerSkill")
                .Include("Player.PlayerStat")
                .Include("Player.PlayerSkill.Skill")
                .Include("Player.PlayerSkill.Skill.SkillTypes")
                .Include("Player.PlayerWeapon")
                .Include("Player.PlayerArmor")
                .Include("Player.PlayerCybernetics")
                .Where(x => x.Email == email).FirstOrDefault();
            if(user==null)
            {
                Clients.Caller.onLoginRejected("User Email or Password is Invalid");
            }
            else
            {
                
                Clients.Caller.onLoginSuccessful(Models.DTO.PlayerData.ConvertList(user.Player));
            }
            //if(user.PasswordHash== SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(password + user.Id)).ToString())
            //{
            //    Clients.Caller.onLoginSuccessful(user.Player.First());
            //}
            //else
            //{
            //    Clients.Caller.onLoginRejected("User Email or Password is Invalid");
            //}
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