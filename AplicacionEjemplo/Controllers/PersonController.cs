using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AplicacionEjemplo.PersonService;

namespace AplicacionEjemplo.Controllers
{
    public class PersonController : Controller
    {
        private readonly PersonServiceClient psc = new PersonServiceClient();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Cargar()
        {
            ViewBag.listPeople = psc.FindAll();
            return View("Index");
        }

        public ActionResult Search(FormCollection fc)
        {
            string cedula = fc["cedula"];
            ViewBag.listPeople = psc.Encontrar(cedula);
            return View("Index");
        }

        public ActionResult Edit(string cedula)
        {
            PersonService.VPersonas persona = new PersonService.VPersonas();

            persona = psc.Find(cedula);
            
            return View(persona);
        }

        [HttpPost]
        public ActionResult Edit(FormCollection collection)
        {
            int resultado;
            try 
            {
                resultado = psc.EditPerson("U",
                                         collection["Cedula"],
                                         collection["Nombre"],
                                         collection["Apellidos"],
                                         collection["Telefono"],
                                         collection["Direccion"]
                                         );
            }
            catch
            {
                resultado = 0;
            }
            ViewBag.resultado = resultado;
            return RedirectToAction("cargar");
        }
	}
}