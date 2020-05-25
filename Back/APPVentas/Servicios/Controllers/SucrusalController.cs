using ENTITY;
using Microsoft.AspNetCore.Mvc;

namespace Servicios.Controllers {
    [Route("api/[controller]")]
    [ApiController]
    public class SucrusalController : ControllerBase
    {
        

        [HttpPost]
        public IActionResult NuevaSucursal([FromBody] Sucursal sucursal) {

            Sucursal sucursalCreada = new BLL.Sucursal().CreateSucursalBLL(sucursal);
               if(sucursalCreada != null) {
                return Ok(new {MSJ="OK",sucursalCreada= sucursalCreada });

            }
            return Ok(new { MSJ = "Error", ERROR="no se pudo crear la sucursal," });


        }

        [HttpGet]
        public IActionResult Sucursales() {

            Sucursal []  sucursales = new BLL.Sucursal().SucursalesBLL();
            if (sucursales != null) {
                return Ok(new { MSJ = "OK", sucursales = sucursales });

            }
            return Ok(new { MSJ = "OK", sucursales = sucursales });



        }

    }
}