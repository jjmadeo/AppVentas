using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Cryptography;
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
            model.Usuario = model.Usuario.ToLower();


            if (model.Usuario != string.Empty && model.Password != string.Empty) {
                UserInfo Userloguiado = new DAL.Usuario().LoginDAL(model);
                if ((model != null && Userloguiado != null) && (model.Usuario.Equals(Userloguiado.Usuario.ToLower()) &&  Seguridad.ComputeHash(model.Password, new MD5CryptoServiceProvider()).Equals(Userloguiado.Password))) {
                    return new string[] { "OK", $"Datos Correctos, Bienvenido {Userloguiado.Usuario}", $"{Userloguiado.Role}",$"{Userloguiado.Direccion}", $"{Userloguiado.Nombre}", $"{Userloguiado.Id}", $"{Userloguiado.id_sucursal}", };

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
            model.Usuario = model.Usuario.ToLower();

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
            model.Usuario = model.Usuario.ToLower();

            String ROLES = "1,2,3";

            if (model.Usuario != null && model.Password != null && model.Role != null) {

                if (!ConsultarUsuario(model)) {
                    if (ROLES.Contains(model.Role)) {
                        model.Password = Seguridad.ComputeHash(model.Password, new MD5CryptoServiceProvider());
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

                UserInfo dato = new DAL.Usuario().getEmplDAL(id)[0];
                dato.Password = Seguridad.DesencriptarTDES(dato.Password);

                return dato;

            } catch (NullReferenceException) {

                UserInfo a = null;

                return a;


            }
        }

        public ENTITY.Roles[]  getRolesBLL() {


            return new DAL.Usuario().getRolesDAL();



        }

        public UserInfo EmplUpdateBLL(UserInfo user, int id) {
            String ROLES = "1,2";
            if (user.id_sucursal!=0 && user.Nombre != string.Empty && user.Role != string.Empty /*&& user.Password  != string.Empty*/ && ROLES.Contains(user.Role)) {
               if(user.Password != string.Empty) {
                    user.Password = Seguridad.ComputeHash(user.Password, new MD5CryptoServiceProvider());

                } 

                return new DAL.Usuario().EmplUpdateDAL(user, id);


            }

            return null;
        }

        public string eliminarEMPLBLL(int id) {
            return new DAL.Usuario().eliminarEMPLDAL(id);
        }

        public bool checkuserBLL(string user) {
            return new DAL.Usuario().checkuserDAL(user.ToLower());
        }
    }


}
