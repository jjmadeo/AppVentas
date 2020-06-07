using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ENTITY;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;

namespace Servicios.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VentasController : ControllerBase
    {
        private readonly ILogger<VentasController> _logger;  //modulos para escribir logs,  siempre va definido en forma global.

        public VentasController(ILogger<VentasController> logger) {
            _logger = logger;
        }

        [HttpPost]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public IActionResult nuevaVenta([FromBody] Venta venta) {
            this._logger.LogInformation(venta.ToString());
            this._logger.LogInformation("LLEGO UNA PETICION A VENTAS.");


            try {
             Venta ventaRealizada = new BLL.Venta().IniciarVenta(venta);
              return Ok(new { MSJ = "Venta realizada", VentaRealizaad = ventaRealizada });

            } catch (Exception e) {

               return BadRequest(new { MSJ = e.Message });


            }

        }





    }
}