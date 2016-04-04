using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Web;

namespace WcfDatos
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IPersonService" in both code and config file together.
    [ServiceContract]
    public interface IPersonService
    {
        [OperationContract]
        List<VPersonas> FindAll();

        [OperationContract]
        VPersonas Find(String id);

        [OperationContract]
        List<VPersonas> Encontrar(String id);

        [WebGet]
        int EditPerson(String accion,String cedula,String nombre,String apellidos,String telefono,String direccion);
     }
}
