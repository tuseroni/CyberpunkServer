using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CyberpunkServer.Models;
using Microsoft.AspNet.Identity;

namespace CyberpunkServer.Controllers
{
    public class SubgridsController : Controller
    {
        private CyberpunkEntities db = new CyberpunkEntities();

        // GET: Subgrids
        [Authorize]
        public ActionResult Index()
        {
            string userId = User.Identity.GetUserId();
            return View(db.Subgrid.AsNoTracking().Where(p => p.UserID == userId).AsNoTracking().ToList());
        }

        // GET: Subgrids/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Subgrid subgrid = db.Subgrid.Find(id);
            if (subgrid == null)
            {
                return HttpNotFound();
            }
            return View(subgrid);
        }

        // GET: Subgrids/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Subgrids/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Models.DTO.SubgridData subgridData)
        {
            var subgrid = new Subgrid();
            if (ModelState.IsValid)
            {   
                Models.DTO.SubgridData.CopyProperties(subgridData, subgrid, db);
                db.Subgrid.Add(subgrid);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(subgrid);
        }

        // GET: Subgrids/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Subgrid grid = db.Subgrid
               .Include(x => x.Fortress)
               .Include("Fortress.FortressCodeGates")
               .Include("Fortress.FortressCPU")
               .Include("Fortress.FortressMemory")
               .Include("Fortress.FortressWalls")
               .Include("Fortress.FortressCodeGates.NetObjType")
               .Include("Fortress.FortressCPU.NetObjType")
               .Include("Fortress.FortressMemory.NetObjType")
               .Include("Fortress.FortressWalls.NetObjType")
               .AsNoTracking()
               .Where(x=>x.id==id)
               .Single();
            if (grid == null)
            {
                return HttpNotFound();
            }
            var NetOBJType = Newtonsoft.Json.JsonConvert.SerializeObject(Models.DTO.NetObjTypeData.ConvertList(db.NetObjType.AsNoTracking().ToList()));
            var subgridData = (Models.DTO.SubgridData)grid;
            ViewBag.subgrid = Newtonsoft.Json.JsonConvert.SerializeObject(subgridData);
            ViewBag.NetOBJTypes = NetOBJType;
            return View(subgridData);
        }

        // POST: Subgrids/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Models.DTO.SubgridData subgrid)
        {
            if (ModelState.IsValid)
            {
                Subgrid grid = db.Subgrid
               .Include(x => x.Fortress)
               .Include("Fortress.FortressCodeGates")
               .Include("Fortress.FortressCPU")
               .Include("Fortress.FortressMemory")
               .Include("Fortress.FortressWalls")
               .AsNoTracking()
               .Where(x => x.id == subgrid.id)
               .Single();
                Models.DTO.SubgridData.CopyProperties(subgrid, grid, db);
                //db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(subgrid);
        }

        // GET: Subgrids/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Subgrid subgrid = db.Subgrid.Find(id);
            if (subgrid == null)
            {
                return HttpNotFound();
            }
            return View(subgrid);
        }

        // POST: Subgrids/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Subgrid subgrid = db.Subgrid.Find(id);
            db.Subgrid.Remove(subgrid);
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
