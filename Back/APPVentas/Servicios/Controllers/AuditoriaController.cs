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
    public class AuditoriaController : ControllerBase
    {

        [HttpGet]
        public IActionResult GetAuditorias() {

            ENTITY.Auditoria[] auditorias = new BLL.Auditoria().ObtenerAuditoriaBLL();

            return Ok(new { auditorias = auditorias });

        }


    }
}