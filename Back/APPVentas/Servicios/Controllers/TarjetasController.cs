using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ENTITY;

namespace Servicios.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TarjetasController : ControllerBase
    {

        [HttpGet("user/{id}", Name = "obtenerTarjetasUser")]
        public IActionResult obtenerTarjetasUser(int id) {
            ENTITY.Tarjeta[] tarjetas = new BLL.Tarjeta().GetTarjetaBLL(id);





           return Ok(new { Tarjetas = tarjetas });
        }




    }



}