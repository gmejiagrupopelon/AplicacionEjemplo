using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AplicacionEjemplo.PersonService;

namespace AplicacionEjemplo.Controllers
{
    public class TelerikController : Controller
    {
        private readonly PersonServiceClient psc = new PersonServiceClient();
        public ActionResult Index()
        {
            return View(psc.FindAll());
        }
	}
}