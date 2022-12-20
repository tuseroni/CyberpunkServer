using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CyberpunkServer.Models;

namespace CyberpunkServer.Controllers
{
    public class FortressesController : Controller
    {
        private CyberpunkEntities db = new CyberpunkEntities();

        // GET: Fortresses
        public ActionResult Index()
        {
            var fortress = db.Fortress.Include(f => f.Subgrid);
            return View(fortress.ToList());
        }

        // GET: Fortresses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Fortress fortress = db.Fortress.Find(id);
            if (fortress == null)
            {
                return HttpNotFound();
            }
            return View(fortress);
        }

        // GET: Fortresses/Create
        public ActionResult Create()
        {
            ViewBag.subgridID = new SelectList(db.Subgrid, "id", "id");
            return View();
        }

        // POST: Fortresses/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Models.DTO.FortressData fortressData)
        {
            var fortress = new Fortress();
            if (ModelState.IsValid)
            {   
                Models.DTO.FortressData.CopyProperties(fortressData, fortress, db);
                db.Fortress.Add(fortress);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.subgridID = new Models.DTO.SubgridData();
            return View(fortress);
        }

        // GET: Fortresses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Fortress fortress = db.Fortress
                    .Include(x => x.FortressCodeGates)
                    .Include(x => x.FortressCPU)
                    .Include(x => x.FortressMemory)
                    .Include(x => x.FortressWalls)
                    .Include(x => x.FortressPrograms)
                    .AsNoTracking()
                    .Where(x => x.id == id).Single();
            if (fortress == null)
            {
                return HttpNotFound();
            }
            ViewBag.subgridID = new SelectList(db.Subgrid, "id", "id", fortress.subgridID);
            return View(fortress);
        }

        // POST: Fortresses/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,subgridID,WallStrength,Int")] Fortress fortress)
        {
            if (ModelState.IsValid)
            {
                db.Entry(fortress).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.subgridID = new SelectList(db.Subgrid, "id", "id", fortress.subgridID);
            return View(fortress);
        }

        // GET: Fortresses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Fortress fortress = db.Fortress.Find(id);
            if (fortress == null)
            {
                return HttpNotFound();
            }
            return View(fortress);
        }

        // POST: Fortresses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Fortress fortress = db.Fortress.Find(id);
            db.Fortress.Remove(fortress);
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
