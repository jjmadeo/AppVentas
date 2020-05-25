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
    public class Usuario {


        public Usuario() {
        }






        public UserInfo[] GetusersBLL() {

            return new DAL.Usuario().GetusersDAL();

        }

        public UserInfo[] GetusersBLL(int id) {

            return new DAL.Usuario().GetusersDAL(id);

        }

        public String[] LoginBLL(UserInfo model) {

            if (model.Usuario != string.Empty && model.Password != string.Empty) {
                UserInfo Userloguiado = new DAL.Usuario().LoginDAL(model);
                if ((model != null && Userloguiado != null) && (model.Usuario.Equals(Userloguiado.Usuario) && model.Password.Equals(Seguridad.DesencriptarTDES(Userloguiado.Password)))) {
                    return new string[] { "OK", $"Datos Correctos, Bienvenido {Userloguiado.Usuario}", $"{Userloguiado.Role}" };

                } else {
                    return new string[] { "Error", $"EL usuario o password  no coincide." };

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
                if (new DAL.Usuario().ConsultarUsuarioDAL(model)) {
                    return true;
                }
                return false;

            }
            return false;




        }

        public String[] CrearUsuario(UserInfo model) {
            model.Role = model.Role.ToUpper();

            String ROLES = "1,2,3";

            if (model.Usuario != null && model.Password != null && model.Role != null) {

                if (!ConsultarUsuario(model)) {
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


        public UserInfo[] getEmplBLL() {
            return new DAL.Usuario().getEmplDAL();
        }
        public UserInfo getEmplBLL(int id) {

            try {
                return new DAL.Usuario().getEmplDAL(id)[0];

            } catch (NullReferenceException) {

                UserInfo a = null;

                return a;


            }
        }

        public ENTITY.Roles[]  getRolesBLL() {


            return new DAL.Usuario().getRolesDAL();



        }
    }


}
