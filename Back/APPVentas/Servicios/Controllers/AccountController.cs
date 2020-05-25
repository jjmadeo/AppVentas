using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.Extensions.Logging;
using BLL;
using DAL;
using System.Data;

using ENTITY;

namespace Servicios.Controllers
{   // le decimos que entienda JSON
    [Produces("application/json")]
    [Route("api/[controller]")] //esto toma el nombre del controller como parte de la ruta es decir en este caso seria API/ACCOUNT/[Method]
    [ApiController]
    public class AccountController : ControllerBase
    {
         private readonly ILogger<AccountController> _logger;  //modulos para escribir logs,  siempre va definido en forma global.

        public AccountController(ILogger<AccountController> logger)
        {
            _logger = logger;
        }
        
        [HttpGet]
        public IActionResult getUsuarios(){

            UserInfo[] usuarios = new BLL.Usuario().GetusersBLL();


            if (usuarios != null) {
                return Ok(new { usuarios = usuarios });
            }

            return BadRequest(new { data = "Hubo un error"});

           

        }
        [HttpGet("{id}", Name = "getUsuario")]
        public IActionResult getUsuario(int id) {

            UserInfo[] usuarios = new BLL.Usuario().GetusersBLL(id);


            if (usuarios != null) {
                return Ok(new { usuarios = usuarios });
            }

            return BadRequest(new { data = "Hubo un error" });



        }



        /// <summary>
        /// Crea un uusario, Recibe un model usuario definido en entity
        /// </summary>
        /// <param name="model"></param>
        /// <returns>retorna un  usaurio creado.</returns>
        /// 
        [Route("Create")]
        [HttpPost]
        public IActionResult CreateUser([FromBody] UserInfo model)
        {
            _logger.LogInformation("Usaurio=>" + model.Usuario + "Pasword =>"+model.Password +"Role=>"+model.Role);
            if (ModelState.IsValid){
                if (model.Role == null) {
                    model.Role = "3";
                }
                string[] resultado = new BLL.Usuario().CrearUsuario(model);
                if ("OK".Equals(resultado[0])) {
                    return Ok(new { res = new { Stado = resultado[0], Info = resultado[1] } });
                } else {
                    return BadRequest(new { res = new {  Stado =resultado[0], Info = resultado[1] } });
                }
            }
            else{
                return BadRequest(ModelState);
            }
        }


        [HttpPost]
        [Route("Login")]
        public IActionResult Login([FromBody] UserInfo userInfo) {
            _logger.LogInformation("Usaurio: " + userInfo.Usuario);
            if (ModelState.IsValid) {
                String[] resCore = new BLL.Usuario().LoginBLL(userInfo);
                if ("OK".Equals(resCore[0])) {
                    userInfo.Role = resCore[2];
                    return BuildToken(userInfo);
                } else {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    return NotFound(new { res = new { Stado = resCore[0], Info = resCore[1] }});
                }
            } else {
                return BadRequest(ModelState);
            }
        }


        [HttpGet]
        [Route("Empleados")]
        public IActionResult getEmpleados() {

            return Ok(new { Empleados =  new BLL.Usuario().getEmplBLL() });

        }
        
        [HttpGet("Empleados/{id}", Name = "getEmpleado")]
       // [Route("Empleados")]
        public IActionResult GetEmpleado(int id) {



            return Ok(new { Empleados = new BLL.Usuario().getEmplBLL(id) });

        }
        [HttpGet]
        [Route("Roles")]
        public IActionResult getSucursal() {

            return Ok(new { roles = new BLL.Usuario().getRolesBLL() });

        }




        /// <summary>
        /// Genera  el token para la autenticacion.
        /// </summary>
        /// <param name="userInfo"></param>
        /// <returns></returns>
        private IActionResult BuildToken(UserInfo userInfo)
        {
            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.UniqueName, userInfo.Usuario),
                new Claim("Role", userInfo.Role),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("asdasdasdasdasgsaherezdasdcsadsadasdasdsadasdsadssssssssssssssssssssssadasdadasd")); // llevarlo a la pdu
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var expiration = DateTime.UtcNow.AddHours(1);

            JwtSecurityToken token = new JwtSecurityToken(
               issuer: "upe.com",
               audience: "upe.com",
               claims: claims,
               expires: expiration,
               signingCredentials: creds);

            return Ok(new
            {
                token = new JwtSecurityTokenHandler().WriteToken(token),
                expiration = expiration
                
            });

        }
                
    }
}
