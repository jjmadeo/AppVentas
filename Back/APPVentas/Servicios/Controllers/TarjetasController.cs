using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Servicios.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TarjetasController : ControllerBase
    {

        [HttpGet("user/{id}", Name = "obtenerTarjetasUser")]
        public IActionResult obtenerTarjetasUser(int id) {

           return Ok(new { Tarjetas = "asd" });
        }



    }



}