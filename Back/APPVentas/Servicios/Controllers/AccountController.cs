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
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using ENTITY;
using Microsoft.AspNetCore.Http;
using System.Linq;

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

        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [HttpGet]
        public IActionResult getUsuarios(){
            string tokenString = Request.Headers["Authorization"].ToString();
            var jwtEncodedString = tokenString.Substring(7); // trim 'Bearer ' from the start since its just a prefix for the token string
            var token = new JwtSecurityToken(jwtEncodedString: jwtEncodedString);
            string roleRequest = token.Claims.First(c => c.Type == "Role").Value;

            if(roleRequest == "ADM") {
                UserInfo[] usuarios = new BLL.Usuario().GetusersBLL();


                if (usuarios != null) {
                    return Ok(new { usuarios = usuarios });
                }

                return BadRequest(new { data = "Hubo un error" });
            } else {
                return Unauthorized(new { MSJ = "Esta funcionalidad solo esta disponible para administradores" });
            }

            

           

        }
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [HttpGet("{id}", Name = "getUsuario")]
        public IActionResult getUsuario(int id) {

            string tokenString = Request.Headers["Authorization"].ToString();
            var jwtEncodedString = tokenString.Substring(7); // trim 'Bearer ' from the start since its just a prefix for the token string
            var token = new JwtSecurityToken(jwtEncodedString: jwtEncodedString);
            string roleRequest = token.Claims.First(c => c.Type == "Role").Value;

            if (roleRequest == "ADM") {
                UserInfo[] usuarios = new BLL.Usuario().GetusersBLL(id);


                if (usuarios != null) {
                    return Ok(new { usuarios = usuarios });
                }

                return BadRequest(new { data = "Hubo un error" });

            } else {
                return Unauthorized(new { MSJ = "Esta funcionalidad solo esta disponible para administradores" });
            }





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
                    userInfo.Direccion = resCore[3];
                    userInfo.Nombre = resCore[4];
                    userInfo.Id = int.Parse(resCore[5]);
                    userInfo.id_sucursal = int.Parse(resCore[6]);


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
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public IActionResult getEmpleados() {

            string tokenString = Request.Headers["Authorization"].ToString();
            var jwtEncodedString = tokenString.Substring(7); // trim 'Bearer ' from the start since its just a prefix for the token string
            var token = new JwtSecurityToken(jwtEncodedString: jwtEncodedString);
            string roleRequest = token.Claims.First(c => c.Type == "Role").Value;

            if (roleRequest == "ADM") {
                return Ok(new { Empleados = new BLL.Usuario().getEmplBLL() });

            } else {
                return Unauthorized(new { MSJ = "Esta funcionalidad solo esta disponible para administradores" });
            }



        }
        
        [HttpGet("Empleados/{id}", Name = "getEmpleado")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public IActionResult GetEmpleado(int id) {
            string tokenString = Request.Headers["Authorization"].ToString();
            var jwtEncodedString = tokenString.Substring(7); // trim 'Bearer ' from the start since its just a prefix for the token string
            var token = new JwtSecurityToken(jwtEncodedString: jwtEncodedString);
            string roleRequest = token.Claims.First(c => c.Type == "Role").Value;

            if (roleRequest == "ADM") {
                return Ok(new { Empleados = new BLL.Usuario().getEmplBLL(id) });

            } else {
                return Unauthorized(new { MSJ = "Esta funcionalidad solo esta disponible para administradores" });
            }




        }
        [HttpGet]
        [Route("Roles")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public IActionResult getRoles() {

            return Ok(new { roles = new BLL.Usuario().getRolesBLL() });

        }
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [HttpPut("Empleados/{id}", Name = "updateEMPL")]
        public IActionResult updateEMPL(int id , [FromBody] UserInfo user) {

            string tokenString = Request.Headers["Authorization"].ToString();
            var jwtEncodedString = tokenString.Substring(7); // trim 'Bearer ' from the start since its just a prefix for the token string
            var token = new JwtSecurityToken(jwtEncodedString: jwtEncodedString);
            string roleRequest = token.Claims.First(c => c.Type == "Role").Value;
            _logger.LogInformation("Sucursal: " + user.id_sucursal.ToString());

            if (roleRequest == "ADM") {
                UserInfo dato = new BLL.Usuario().EmplUpdateBLL(user, id);
                if(dato != null) {
                    return Ok(new { EMPLupdate = dato });

                }
                return BadRequest(new { MSJ = "Verifique los datos de entrada."});



            } else {
                return Unauthorized(new { MSJ = "Esta funcionalidad solo esta disponible para administradores" });
            }


        }
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [HttpDelete("Empleados/{id}", Name = "deleteEmpl")]
        public IActionResult deleteEmpl(int id) {

            string tokenString = Request.Headers["Authorization"].ToString();
            var jwtEncodedString = tokenString.Substring(7); // trim 'Bearer ' from the start since its just a prefix for the token string
            var token = new JwtSecurityToken(jwtEncodedString: jwtEncodedString);
            string roleRequest = token.Claims.First(c => c.Type == "Role").Value;

            if (roleRequest == "ADM") {
                return Ok(new { emplDeleted = new BLL.Usuario().eliminarEMPLBLL(id) });

            } else {
                return Unauthorized(new { MSJ = "Esta funcionalidad solo esta disponible para administradores" });
            }



        }




        // [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [HttpGet("verifyUser/{usuario}", Name = "checkuser")]
        public IActionResult checkuser(string usuario) {


                return Ok(new { UserExist = new BLL.Usuario().checkuserBLL(usuario) });

           


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
                new Claim("Direccion", userInfo.Direccion ==null?"":userInfo.Direccion),
                new Claim("Role", userInfo.Role ==null?"":userInfo.Role),
                new Claim("Usuario", userInfo.Usuario ==null?"":userInfo.Usuario),
                new Claim("Nombre", userInfo.Nombre ==null?"":userInfo.Nombre),
                new Claim("id_sucursal", userInfo.id_sucursal.ToString() ==null?"":userInfo.id_sucursal.ToString()),
                new Claim("Id", userInfo.Id.ToString() ==null?"":userInfo.Id.ToString()),
               

                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(new BLL.PDU().getPropertiePDUBLL("ClaveToken"))); // llevarlo a la pdu
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var expiration = DateTime.UtcNow.AddYears(10);

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
