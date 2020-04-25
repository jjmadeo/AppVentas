using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Servicios.Models;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.Extensions.Logging;
using BLL;
using DAL;
using System.Data;

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
        [HttpGet]
        public IActionResult Get()
        {
            DataTable res = new BLL.Usuario().ConsultarUsuario("juan","jjmxyz");
            return Ok(res);
        }
        /*
        // GET: api/Account/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Account
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Account/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }
        */

        [Route("Create")]
        [HttpPost]
        public IActionResult CreateUser([FromBody] UserInfo model)
        {
            _logger.LogInformation("Usaurio: " + model.Usuario);
            if (ModelState.IsValid)
            {

                if (Exist(model)!=null)
                {
                    return BadRequest("Usaurio existente");
                }
               // user.Add(model); 
                Console.WriteLine("Usaurio" + model.Usuario);



                return BuildToken(model);
                              
            }
            else
            {
                return BadRequest(ModelState);
            }
             
        }


        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login([FromBody] UserInfo userInfo)
        {
            _logger.LogInformation("Usaurio: " + userInfo.Usuario);

            if (ModelState.IsValid)
            {
                DataTable res = new BLL.Usuario().ConsultarUsuario(userInfo.Usuario, userInfo.Password);
                
                if (res.Rows[0]!=null)
                {
                    String dataRow = res.Rows[0]["usuario"].ToString();
                    _logger.LogInformation("asd"+dataRow);
                    userInfo.Role = res.Rows[0]["role"].ToString();

                    // UserInfo usuarioLoguiado = new UserInfo();

                    return BuildToken(userInfo);
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    return BadRequest(ModelState);
                }
            }
            else
            {
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
