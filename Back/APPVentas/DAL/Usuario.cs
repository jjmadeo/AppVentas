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

        public DataTable ConsultarUsuarioDAL(string usuario, string password) {
            ConnectBBDD conexion = new ConnectBBDD();

            if (usuario == "" && password == "") {

                return conexion.LeerPorStoreProcedure("sp_usuarios");
            }

            return conexion.LeerPorComando($"select *  from usuarios where usuario='{usuario}'");


        }
        public bool ConsultarUsuarioDAL(string usuario) {
            ConnectBBDD conexion = new ConnectBBDD();

            DataTable prueba = conexion.LeerPorComando($"select *  from usuarios where usuario='{usuario}'");

             
            if (prueba.Rows.Count >0 && prueba.Rows[0]["usuario"].ToString().Equals(usuario)  ) {
                return true;
            }
            return false;


        }

        public String[] LoginDAL(string usuario) {
            ConnectBBDD conexion = new ConnectBBDD();
            DataTable res = conexion.LeerPorComando($"select *  from usuarios where usuario='{usuario}'");
            if (res.Rows.Count > 0) {
                return new string[] { "ERROR", $"{res.Rows[0]["usuario"].ToString()}", $"{res.Rows[0]["password"].ToString()}", $"{res.Rows[0]["role"].ToString()}" };


            } else {

                return new string[] {"ERROR","El usuario no se ah podido Crear"};

            }



        }

        public String[] CrearUsuarioDAL(string usuario, string password ,string role) {
            ConnectBBDD conexion = new ConnectBBDD();

            if (usuario!= null && password != null & role != null) {
                 if(conexion.EscribirPorComando($"INSERT INTO usuarios(usuario,password,role)VALUES('{usuario}','{password}','{role}');") != 0) {
                    return new string[] {"OK", $"Usuario {password}, creado" };
                }
                return new string[]{ "ERROR","El usuario no se ah podido Crear"}; 
             }

            return new string[] { "ERROR", "revise la entrada de datos al CrearUsuarioBLL" };


        }

    }


}
