using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EjercicioTecnico_RodrigoTorres.Models
{
    public class TareaBEAN
    {
            [Key]
            public int Id { get; set; }
            
            public int Id_carpeta { get; set; }

            public String Nom_tarea { get; set; }
            public String Descripcion { get; set; }
             public String Estado { get; set; }



    }
}
