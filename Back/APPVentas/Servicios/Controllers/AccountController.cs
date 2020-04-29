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
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        /*
        List<UserInfo> user = new List<UserInfo>()
        {
            {new UserInfo(){ Usuario= "juan",Password="1234",Role="ADM" } },
            {new UserInfo(){ Usuario= "maria",Password="1234",Role="VENTAS" } },
            {new UserInfo(){ Usuario= "sergio",Password="1234",Role="INVITADO" } },
            {new UserInfo(){ Usuario= "salvador",Password="1234",Role="CLIENTE" } }
        };*/
        private readonly ILogger<AccountController> _logger;

        public AccountController(ILogger<AccountController> logger)
        {
            _logger = logger;
        }
        
        // GET: api/Account
        //[HttpGet]
        //public IActionResult Get()
        //{
        //    DataTable res = new BLL.Usuario().ConsultarUsuario("juan","jjmxyz");
        //    return Ok(res);
        //}
        

        [Route("Create")]
        [HttpPost]
        public IActionResult CreateUser([FromBody] UserInfo model)
        {
            _logger.LogInformation("Usaurio=>" + model.Usuario + "Pasword =>"+model.Password +"Role=>"+model.Role);
            if (ModelState.IsValid)
            {
                if(model.Role==null)
                    model.Role = "cliente";

                string[] resultado = new BLL.Usuario().CrearUsuario(model);
                if ("OK".Equals(resultado[0])) {

                    return Ok(new { res = new { Stado = resultado[0], Info = resultado[1] } });
                      /**Rtornar multiples valores.*/
//                    return Ok(new { Response = resultado[1], Status = StatusCode(200, new { Dato = "asd", Dato = "asd", Dato = "asd" }) });


                    //return BadRequest("Usaurio existente");
                } else {
                    return BadRequest(new { res = new {  Stado =resultado[0], Info = resultado[1] } });
                }
                              
            }
            else
            {
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
                    // UserInfo usuarioLoguiado = new UserInfo();

                    return BuildToken(userInfo);
                } else {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    return NotFound(new { res = new { Stado = resCore[0], Info = resCore[1] }});
                }
            } else {
                return BadRequest(ModelState);
            }
        }


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

        private UserInfo Exist(UserInfo inusuario)
        {
            _logger.LogInformation(" *** " + inusuario.Usuario +" ****  "+inusuario.Password);

            //Usuario usuariBLL = new Usuario();
            //usuariBLL.ConsultarUsuario(inusuario.Usuario, inusuario.Password);
            /*
            foreach ( UserInfo usuario in user)
            {
                _logger.LogInformation("Usaurio: Existe : " + usuario.Usuario);

                if (usuario.Usuario.Equals(inusuario.Usuario)) return usuario;
            }
            */
            return null;

        }
    }
}
