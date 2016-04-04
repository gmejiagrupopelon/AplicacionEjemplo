using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AplicacionEjemplo.Models
{
    public class PersonaModel
    {
        [Display(Name = "Cédula")]
        [Key]
        public String Cedula { get; set; }

        [Required]
        public String Nombre { get; set; }

        [Required]
        public String Apellido { get; set; }

        [Required]
        [DataType(DataType.PhoneNumber)]
        public String Telefono { get; set; }

        [Required]
        public String Direccion { get; set; }
    }
}