using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
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

        public DataTable ConsultarUsuario(string usuario, string password)
         {
            ConnectBBDD conexion = new ConnectBBDD();


            if (usuario == "" && password == "")
                return conexion.LeerPorStoreProcedure("sp_usuarios");
            return conexion.LeerPorComando($"select *  from usuarios where usuario='{usuario}'");
          
            





        }

    }


}
