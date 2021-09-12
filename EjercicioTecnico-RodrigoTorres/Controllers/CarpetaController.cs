using EjercicioTecnico_RodrigoTorres.BEAN;
using EjercicioTecnico_RodrigoTorres.DAO;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EjercicioTecnico_RodrigoTorres.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CarpetaController : Controller
    {
        private readonly CarpetaDAO carpetadao;

        public CarpetaController()
        {
            carpetadao= new CarpetaDAO();
        }
        [HttpPost]
        public void NuevaCarpeta([FromBody] CarpetaBEAN carpeta) {
            if (ModelState.IsValid) {
                carpetadao.addCarpeta(carpeta);
            }
        }
        [HttpGet]

       public IEnumerable<CarpetaBEAN> getCarpetas()
        {

           return carpetadao.getCarpeta();

        }
        [HttpDelete]
        public void delete(int id) {

            carpetadao.DeleteCarpeta(id);
        }
        [HttpPut("{id}")]
        public void update(int id,[FromBody]CarpetaBEAN carpetabean) {
            carpetabean.Id = id;
            if (ModelState.IsValid)
            {
                carpetadao.UpdateCarpeta(carpetabean);
            }
        }


    }
}
