using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
namespace BLL
{
    public class Usuario
    {
        public string usuario { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }

        public Usuario(string usuario, string password, string role)
        {
            this.usuario = usuario;
            Password = password;
            Role = role;
        }

        public Usuario()
        {
        }

        public DataTable ConsultarUsuario(String usuario, String password)
        {

            if(usuario =="" && password=="")
                return new DAL.Usuario().ConsultarUsuario("","");
            return new DAL.Usuario().ConsultarUsuario(usuario,password); 

        }

    }


}
