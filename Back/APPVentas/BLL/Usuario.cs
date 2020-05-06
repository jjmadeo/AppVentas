using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using ENTITY;
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




     

        public UserInfo[] GetusersBLL() {

            return new DAL.Usuario().GetusersDAL();

        }

        public UserInfo[] GetusersBLL(int id) {

            return new DAL.Usuario().GetusersDAL(id);

        }

        public String[] LoginBLL(UserInfo model) {

            if (model.Usuario !="" && model.Password != "") {
                UserInfo Userloguiado = new DAL.Usuario().LoginDAL(model);
                 if((model !=null && Userloguiado !=null)&&(model.Usuario.Equals(Userloguiado.Usuario) && model.Password.Equals(Seguridad.DesencriptarTDES(Userloguiado.Password)))) {
                    return new string[] { "OK", $"Datos Correctos, Bienvenido {Userloguiado.Usuario}",$"{Userloguiado.Role}" };

                } else {
                    return new string[] { "Error", $"EL usuario o password  no coincide."};

                }

            } else {
                return new string[] { "OK", $"Debe completar ambos campos" };

            }

            throw new ArgumentException("Ubo un error al Crear el Usuario");
        }

        //public DataTable ConsultarUsuario(UserInfo model)
        //{

        //    if(model.Usuario =="" && model.Password=="")
        //        return new DAL.Usuario().ConsultarUsuarioDAL("","");
        //    return new DAL.Usuario().ConsultarUsuarioDAL(model); 

        //}
        private bool ConsultarUsuario(UserInfo model) {

            if (model.Usuario != null) {
                if(new DAL.Usuario().ConsultarUsuarioDAL(model)) {
                    return true;
                }
                return false;

            }
            return false;




        }

        public String[] CrearUsuario(UserInfo model) {
                  model.Role = model.Role.ToUpper();

            String ROLES = "ADM,VENTAS,CLIENTE";

                if (model.Usuario != null && model.Password != null && model.Role != null) {

                if (!ConsultarUsuario(model)){
                        if (ROLES.Contains(model.Role)) {
                        model.Password = Seguridad.EncriptarTDES(model.Password);
                            if ("OK".Equals(new DAL.Usuario().CrearUsuarioDAL(model)[0])) {
                                return new string[] { "OK", $"Clave encriptada,Registro Realizado" };
                            }
                        } else {
                               return new string[] { "ERROR", $"El ROLE {model.Role} Ingresado no es un rol valido." };
                         }
                } else {
                             return new string[] { "ERROR", $"El usuario {model.Usuario} ya se encuentra registrado" };
                        }                  


                } else {

                    return new string[] { "ERROR", $"Valide los datos de entrada" };
                }

            throw new ArgumentException("Ubo un error al Crear el Usuario");


        }

    }


}
