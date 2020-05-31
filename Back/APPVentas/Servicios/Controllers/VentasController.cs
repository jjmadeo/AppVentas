using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ENTITY;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Servicios.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VentasController : ControllerBase
    {
        [HttpPost]
        public IActionResult nuevaVenta([FromBody] Venta venta) {

            try {
             Venta ventaRealizada = new BLL.Venta().IniciarVenta(venta);
              return Ok(new { MSJ = "Venta realizada", VentaRealizaad = ventaRealizada });

            } catch (Exception e) {

               return BadRequest(new { MSJ = e.Message });


            }

        }





    }
}