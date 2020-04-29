using ENTITY;
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

        //public DataTable ConsultarUsuarioDAL(UserInfo model) {
        //    ConnectBBDD conexion = new ConnectBBDD();

        //    if (model.Usuario == "" && model.Password == "") {

        //        return conexion.LeerPorStoreProcedure("sp_usuarios");
        //    }

        //    return conexion.LeerPorComando($"select *  from usuarios where usuario='{model.Usuario}'");


        //}
        public bool ConsultarUsuarioDAL(UserInfo model) {
            ConnectBBDD conexion = new ConnectBBDD();

            DataTable prueba = conexion.LeerPorComando($"select *  from usuarios where usuario='{model.Usuario}'");

             
            if (prueba.Rows.Count >0 && prueba.Rows[0]["usuario"].ToString().Equals(model.Usuario)  ) {
                return true;
            }
            return false;


        }

        public UserInfo LoginDAL(UserInfo model) {
            ConnectBBDD conexion = new ConnectBBDD();
            DataTable res = conexion.LeerPorComando($"select *  from usuarios where usuario='{model.Usuario}'");
            if (res.Rows.Count > 0) {
                return new UserInfo(res.Rows[0]["usuario"].ToString(), res.Rows[0]["password"].ToString(), res.Rows[0]["role"].ToString());


            } else {
                UserInfo datoNull = null;
                return datoNull;

            }



        }

        public String[] CrearUsuarioDAL(UserInfo model) {
            ConnectBBDD conexion = new ConnectBBDD();

            if (model.Usuario!= null && model.Password != null & model.Role != null) {
                 if(conexion.EscribirPorComando($"INSERT INTO usuarios(usuario,password,role)VALUES('{model.Usuario}','{model.Password}','{model.Role}');") != 0) {
                    return new string[] {"OK", $"Usuario {model.Password}, creado" };
                }
                return new string[]{ "ERROR","El usuario no se ah podido Crear"}; 
             }

            return new string[] { "ERROR", "revise la entrada de datos al CrearUsuarioBLL" };


        }

    }


}
