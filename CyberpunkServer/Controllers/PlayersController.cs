using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using CyberpunkServer.Models;
using Microsoft.AspNet.Identity;


namespace CyberpunkServer.Controllers
{
    public class PlayersController : Controller
    {
        private CyberpunkEntities db = new CyberpunkEntities();

        // GET: Players
        [System.Web.Mvc.Authorize]
        public ActionResult Index()
        {
            string userId = User.Identity.GetUserId();
            var player = db.Player.Include(p => p.PlayerRoles).Include(p=>p.PlayerSkill).Include(p => p.PlayerStat).Include(p => p.PlayerWeapon).Include(p => p.PlayerArmor).Include(p => p.PlayerCybernetics).Include(p => p.AspNetUsers).AsNoTracking().Where(p=>p.aspUserID== userId).ToList();
            
            return View(player);
        }

        // GET: Players/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Player player = db.Player.Find(id);
            if (player == null)
            {
                return HttpNotFound();
            }
            return View(player);
        }

        // GET: Players/Create
        public ActionResult Create()
        {
            ViewBag.RoleID = new SelectList(db.PlayerRoles, "id", "Name");
            ViewBag.aspUserID = new SelectList(db.AspNetUsers, "Id", "Email");
            var skills = db.Skill.Include(x => x.SkillTypes).Include(x => x.Stat).ToList();
            var stats = db.Stat.ToList();
            ViewBag.skill = skills;
            ViewBag.stats = stats;
            return View(new Models.DTO.PlayerData());
        }

        // POST: Players/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [System.Web.Mvc.HttpPost]
        
        public ActionResult Create(Models.DTO.PlayerData player)
        {
            if (ModelState.IsValid)
            {
                string userId = User.Identity.GetUserId();
                player.aspUserID = userId;
                var dest = Models.DTO.PlayerData.CopyProperties(player, new Player(), db);
                db.Player.Add(dest);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.RoleID = new SelectList(db.PlayerRoles, "id", "Name", player.RoleID);
            ViewBag.aspUserID = new SelectList(db.AspNetUsers, "Id", "Email", player.aspUserID);
            var skills = db.Skill.Include(x => x.SkillTypes).Include(x => x.Stat).ToList();
            var stats = db.Stat.ToList();
            ViewBag.skill = skills;
            ViewBag.stats = stats;
            return View(player);
        }

        // GET: Players/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Player player = db.Player
                .Include(p => p.PlayerRoles)
                .Include(p => p.PlayerSkill)
                .Include(p => p.PlayerStat)
                .Include("PlayerSkill.Skill")
                .Include(p => p.PlayerWeapon)
                .Include(p => p.PlayerArmor)
                .Include(p => p.PlayerCybernetics)
                .Include(p => p.PlayerPrograms)
                .Include(p => p.PlayerCyberdeck)
                .Include(p => p.PlayerComputer)
                .Include("PlayerCyberdeck.PlayerCyberdeckImprovements")
                .Include("PlayerCyberdeck.PlayerCyberdeckOptions")
                .Include("PlayerCyberdeck.PlayerCyberdeckPrograms")
                .Include("PlayerCyberdeck.PlayerCyberdeckPrograms.Program")
                .Include("PlayerComputer.PlayerComputerImprovements")
                .Include("PlayerComputer.PlayerComputerOptions")
                .Include("PlayerComputer.PlayerComputerPrograms")
                .Include("PlayerComputer.PlayerComputerPrograms.Program")
                .Include(p => p.AspNetUsers)
                .AsNoTracking()
                .Where(p => p.id == id).Single();
            if (player == null)
            {
                return HttpNotFound();
            }

            ViewBag.RoleID = new SelectList(db.PlayerRoles, "id", "Name", player.RoleID);
            var programs = db.Program
                .Include(x => x.ProgramFunctions)
                .Include(x => x.ProgramOptions).AsNoTracking().ToList().Select(x=>(Models.DTO.ProgramData)x).ToList();
            ViewBag.ProgramData = programs;
            var data = (Models.DTO.PlayerData)player;
            var js = Newtonsoft.Json.JsonConvert.SerializeObject(data);
            
            ViewBag.JSON = js;
            return View(data);
        }

        // POST: Players/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [System.Web.Mvc.Authorize]
        [System.Web.Mvc.HttpPost]
        
        public ActionResult Edit([FromBody]CyberpunkServer.Models.DTO.PlayerData player)
        {
            if (ModelState.IsValid)
            {
                var old_player = db.Player
                .Include(p => p.PlayerRoles)
                .Include(p => p.PlayerSkill)
                .Include(p => p.PlayerStat)
                .Include("PlayerSkill.Skill")
                .Include(p => p.PlayerWeapon)
                .Include(p => p.PlayerArmor)
                .Include(p => p.PlayerCybernetics)
                .Include(p => p.PlayerPrograms)
                .Include(p => p.PlayerCyberdeck)
                .Include(p => p.PlayerComputer)
                .Include("PlayerCyberdeck.PlayerCyberdeckImprovements")
                .Include("PlayerCyberdeck.PlayerCyberdeckOptions")
                .Include("PlayerCyberdeck.PlayerCyberdeckPrograms")
                .Include("PlayerCyberdeck.PlayerCyberdeckPrograms.Program")
                .Include("PlayerComputer.PlayerComputerImprovements")
                .Include("PlayerComputer.PlayerComputerOptions")
                .Include("PlayerComputer.PlayerComputerPrograms")
                .Include("PlayerComputer.PlayerComputerPrograms.Program")
                .Include(p => p.AspNetUsers)
                .Where(p => p.id == player.id).Single();

                string userId = User.Identity.GetUserId();
                player.aspUserID = userId;

                Models.DTO.PlayerData.CopyProperties(player, old_player, db);
                //db.SaveChanges();
                var retDTO = (CyberpunkServer.Models.DTO.PlayerData)old_player;
                var js = Newtonsoft.Json.JsonConvert.SerializeObject(retDTO);
                return Content(js);
            }
            ViewBag.RoleID = new SelectList(db.PlayerRoles, "id", "Name", player.RoleID);
            return View(player);
        }
        public ActionResult GetJSON(int? id)
        {
            Player player = db.Player
                .Include(p => p.PlayerRoles)
                .Include(p => p.PlayerSkill)
                .Include(p => p.PlayerStat)
                .Include("PlayerSkill.Skill")
                .Include(p => p.PlayerWeapon)
                .Include(p => p.PlayerArmor)
                .Include(p => p.PlayerCybernetics)
                .Include(p => p.PlayerPrograms)
                .Include(p => p.PlayerCyberdeck)
                .Include(p => p.PlayerComputer)
                .Include("PlayerCyberdeck.PlayerCyberdeckImprovements")
                .Include("PlayerCyberdeck.CyberdeckOptions")
                .Include("PlayerCyberdeck.Program")
                .Include("PlayerCyberdeck.Program.Program")
                .Include("PlayerComputer.PlayerComputerImprovements")
                .Include("PlayerComputer.PlayerComputerOptions")
                .Include("PlayerComputer.PlayerComputerPrograms")
                .Include("PlayerComputer.PlayerComputerPrograms.Program")
                .Include(p => p.AspNetUsers)
                .AsNoTracking()
                .Where(p => p.id == id).Single();
            var retDTO = (CyberpunkServer.Models.DTO.PlayerData)player;
            var js = Newtonsoft.Json.JsonConvert.SerializeObject(retDTO);
            return Content(js);
        }
        //[Authorize]
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult SaveJSON(string playerJSON)
        //{
        //    var player = Newtonsoft.Json.JsonConvert.DeserializeObject<Models.DTO.PlayerData>(playerJSON);
        //    if (ModelState.IsValid)
        //    {   
        //        var old_player = db.Player
        //        .Include(p => p.PlayerRoles)
        //        .Include(p => p.PlayerSkill)
        //        .Include(p => p.PlayerStat)
        //        .Include("PlayerSkill.Skill")
        //        .Include(p => p.PlayerWeapon)
        //        .Include(p => p.PlayerArmor)
        //        .Include(p => p.PlayerCybernetics)
        //        .Include(p => p.AspNetUsers)
        //        .Where(p => p.id == player.id).Single();

        //        string userId = User.Identity.GetUserId();
        //        player.aspUserID = userId;

        //        Models.DTO.PlayerData.CopyProperties(player, old_player, db);
        //        db.SaveChanges();
        //        return new EmptyResult();
        //    }
        //    ViewBag.RoleID = new SelectList(db.PlayerRoles, "id", "Name", player.RoleID);
        //    return View(player);
        //}
        // GET: Players/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Player player = db.Player.Find(id);
            if (player == null)
            {
                return HttpNotFound();
            }
            return View(player);
        }

        // POST: Players/Delete/5
        //[HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Player player = db.Player.Find(id);
            db.Player.Remove(player);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
