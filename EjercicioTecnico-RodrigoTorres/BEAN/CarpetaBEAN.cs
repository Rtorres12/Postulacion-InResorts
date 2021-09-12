using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EjercicioTecnico_RodrigoTorres.BEAN
{
    public class CarpetaBEAN
    {
      
            [Key]
            public int Id { get; set; }
             public String Nom_carpeta { get; set; }


    }
}
