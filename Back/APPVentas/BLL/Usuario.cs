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


        public String[] LoginBLL(String usuario, String password) {

            if (usuario !=null && password != null) {


            } else {
                return new string[] { "OK", $"Debe completar ambos campos" };

            }

            throw new ArgumentException("Ubo un error al Crear el Usuario");
        }

        public DataTable ConsultarUsuario(String usuario, String password)
        {

            if(usuario =="" && password=="")
                return new DAL.Usuario().ConsultarUsuarioDAL("","");
            return new DAL.Usuario().ConsultarUsuarioDAL(usuario,password); 

        }
        public bool ConsultarUsuario(String usuario) {

            if (usuario != null) {
                if(new DAL.Usuario().ConsultarUsuarioDAL(usuario)) {
                    return true;
                }
                return false;

            }
            return false;




        }

        public String[] CrearUsuario(String usuario, String password, String role) {
                  role = role.ToUpper();

            String ROLES = "ADM,VENTAS,CLIENTE";

                if (usuario != null && password != null && role != null) {

                if (!ConsultarUsuario(usuario)){
                        if (ROLES.Contains(role)) {
                            if ("OK".Equals(new DAL.Usuario().CrearUsuarioDAL(usuario, Seguridad.EncriptarTDES(password), role)[0])) {
                                return new string[] { "OK", $"Clave encriptada,Registro Realizado" };
                            }
                        } else {
                               return new string[] { "ERROR", $"El ROLE {role} Ingresado no es un rol valido." };
                         }
                } else {
                             return new string[] { "ERROR", $"El usuario {usuario} ya se encuentra registrado" };
                        }                  


                } else {

                    return new string[] { "ERROR", $"Valide los datos de entrada" };
                }

            throw new ArgumentException("Ubo un error al Crear el Usuario");


        }

    }


}
