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


            return Ok(new { venta = "Venta" });
        }





    }
}