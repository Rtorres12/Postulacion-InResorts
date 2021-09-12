using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EjercicioTecnico_RodrigoTorres.DAO;
using EjercicioTecnico_RodrigoTorres.Models;
namespace EjercicioTecnico_RodrigoTorres.Controllers
{

    [ApiController]
    [Route("[controller]")]
    public class TareaController : ControllerBase
    {
        private readonly TareaDAO tareadao;
        public TareaController()
        {

            tareadao = new TareaDAO();
        }
        [HttpGet]
        public IEnumerable<TareaBEAN> Get()
        {
            
            return tareadao.getTareas();

        }
        [HttpPost]
        public void NuevaTarea([FromBody] TareaBEAN tareaBean) {

            if (ModelState.IsValid) {
                tareadao.addTarea(tareaBean);   

            }
        }

        [HttpDelete]
        public void Delete(int id) {
            tareadao.DeleteTarea(id);
        
        }
        [HttpPut("{id}")]
        public void update(int id, [FromBody] TareaBEAN tareabean)
        {
            tareabean.Id = id;
            if (ModelState.IsValid)
            {
                tareadao.UpdateTarea(tareabean);
            }
        }
        [HttpGet("{id},{estado}")]
        public IEnumerable<TareaBEAN> getByEstado( int id, String estado) {

            return tareadao.getByEstado(id, estado);
        }
        [HttpPut("{id},{estado}")]
        public void updateEstado(int id,String estado, [FromBody] TareaBEAN tareabean)
        {
            tareabean.Id = id;
            tareabean.Estado = estado;
            if (ModelState.IsValid)
            {
                tareadao.UpdateEstado(tareabean);
            }
        }

    }
}
