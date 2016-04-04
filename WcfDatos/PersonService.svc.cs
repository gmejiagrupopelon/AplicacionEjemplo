using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WcfDatos
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "PersonService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select PersonService.svc or PersonService.svc.cs at the Solution Explorer and start debugging.
    public class PersonService : IPersonService
    {
        private BD_AplicacionEjemploEntities mde = new BD_AplicacionEjemploEntities();
        public List<VPersonas> FindAll()
        {
            try
            {
               return mde.V_Personas.ToList();
            }
            catch
            {
                return null;
            }
        }

        public VPersonas Find(string id)
        {
            try
            {
                return (VPersonas)mde.V_Personas.Where(p => p.Cedula == id).ToList().First();
            }
            catch
            {
                return null;
            }
        }

        public List<VPersonas> Encontrar(string id)
        {
            try
            {
                return mde.V_Personas.Where(p => p.Cedula == id).ToList();
            }
            catch
            {
                return null;
            }   
        }

        public int EditPerson(string accion, string cedula, string nombre, string apellidos, string telefono, string direccion)
        {
            try
            {
                return mde.SP_Mantenimiento_Personas(accion, cedula, nombre, apellidos, telefono, direccion);
            }
            catch
            {
                return 0;
            }
        }
    }
}
