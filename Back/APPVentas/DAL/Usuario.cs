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
       

       

        public Usuario()
        {
        }



        public UserInfo[] GetusersDAL() {

            ConnectBBDD conexion = new ConnectBBDD();

            DataTable res = conexion.LeerPorComando($"select u.id,u.usuario,u.password,u.email,u.direccion,u.nombre,r.nombre as role  from usuarios as u, Roles  as r where r.id = u.id_role;");
           
            if (res.Rows.Count > 0) {
                UserInfo[] arrUser = new UserInfo[res.Rows.Count];



                for(int i = 0; i < res.Rows.Count; i++) {
                    arrUser[i] = new UserInfo(res.Rows[i]["usuario"].ToString(), res.Rows[i]["password"].ToString(), res.Rows[i]["role"].ToString(), res.Rows[i]["nombre"].ToString(), res.Rows[i]["email"].ToString(), res.Rows[i]["direccion"].ToString(),0,int.Parse(res.Rows[i]["id"].ToString()));
                }

                return arrUser;

            } else {
                UserInfo[] datoNull = null;
                return datoNull;

            }



        }
        public UserInfo[] getEmplDAL(int id =0) {
            ConnectBBDD conexion = new ConnectBBDD();

            if ( !(id > 0))  {
                DataTable res = conexion.LeerPorComando($"select Empleados.id_empl,Empleados.nombre,Empleados.usuario,Roles.nombre as 'rol',Sucursales.id as 'idsucursal' from Empleados , Roles, Sucursales where Empleados.id_role = Roles.id and Empleados.id_sucursal = Sucursales.id;");

                if (res.Rows.Count > 0) {
                    UserInfo[] arrEmpl = new UserInfo[res.Rows.Count];



                    for (int i = 0; i < res.Rows.Count; i++) {
                        arrEmpl[i] = new UserInfo(res.Rows[i]["usuario"].ToString(), string.Empty, res.Rows[i]["rol"].ToString(), res.Rows[i]["nombre"].ToString(), string.Empty, string.Empty, int.Parse(res.Rows[i]["idsucursal"].ToString()), int.Parse(res.Rows[i]["id_empl"].ToString()));
                    }

                    return arrEmpl;

                } else {
                    UserInfo[] datoNull = null;
                    return datoNull;

                }
            } else {
                DataTable res = conexion.LeerPorComando($"select Empleados.id_empl, Empleados.password, Empleados.nombre,Empleados.usuario,Roles.nombre as 'rol',Sucursales.id as 'idsucursal' from Empleados , Roles, Sucursales where Empleados.id_role = Roles.id and Empleados.id_sucursal = Sucursales.id and Empleados.id_empl ={id};");

                if (res.Rows.Count > 0) {
                    UserInfo[] arrEmpl = new UserInfo[res.Rows.Count];



                    for (int i = 0; i < res.Rows.Count; i++) {
                        arrEmpl[i] = new UserInfo(res.Rows[i]["usuario"].ToString(), res.Rows[i]["password"].ToString(), res.Rows[i]["rol"].ToString(), res.Rows[i]["nombre"].ToString(), string.Empty, string.Empty, int.Parse(res.Rows[i]["idsucursal"].ToString()), int.Parse(res.Rows[i]["id_empl"].ToString()));
                    }

                    return arrEmpl;

                } else {
                    UserInfo[] datoNull = null;
                    return datoNull;

                }
            }

            

            



        }
        public UserInfo[] GetusersDAL(int id) {

            ConnectBBDD conexion = new ConnectBBDD();
            DataTable res = conexion.LeerPorComando($"select u.id,u.usuario,u.password,u.nombre,u.email,u.direccion,r.nombre as role  from usuarios as u, Roles  as r where r.id = u.id_role and  u.id={id}");

            if (res.Rows.Count > 0) {
                UserInfo[] arrUser = new UserInfo[res.Rows.Count];



                for (int i = 0; i < res.Rows.Count; i++) {
                    arrUser[i] = new UserInfo(res.Rows[i]["usuario"].ToString(), res.Rows[i]["password"].ToString(), res.Rows[i]["role"].ToString(), res.Rows[i]["nombre"].ToString(), res.Rows[i]["email"].ToString(), res.Rows[i]["direccion"].ToString(),0, int.Parse(res.Rows[i]["id"].ToString()));
                }

                return arrUser;

            } else {
                UserInfo[] datoNull = null;
                return datoNull;

            }



        }

        public String eliminarEMPLDAL(int id) {
            ConnectBBDD conexion = new ConnectBBDD();

            int res = conexion.EscribirPorComando($"delete from empleados where id_empl = {id}");
            if (res > 0) {
                return "Empleado Eliminado correctamente.";
            }

            return "No se ah pido eliminar al usuario.";


        }

        public UserInfo EmplUpdateDAL(UserInfo user, int id) {

            ConnectBBDD conexion = new ConnectBBDD();

            int res = conexion.EscribirPorComando($"update Empleados set nombre = '{user.Nombre}', password = '{user.Password}', id_role ={ int.Parse(user.Role)},id_sucursal ={ user.id_sucursal}where id_empl = {id}");
            if(res > 0) {

                return user;
            }
            return null;
        }

        public ENTITY.Roles[] getRolesDAL() {
            ConnectBBDD conexion = new ConnectBBDD();

            DataTable res = conexion.LeerPorComando($"select * from roles");

            if (res.Rows.Count > 0) {
                Roles[] arrUser = new Roles[res.Rows.Count];



                for (int i = 0; i < res.Rows.Count; i++) {
                    arrUser[i] = new Roles(int.Parse(res.Rows[i]["id"].ToString()) , res.Rows[i]["nombre"].ToString());
                }

                return arrUser;

            } else {

                Roles[] datoNull = null;
                return datoNull;
            }


        }

        public bool ConsultarUsuarioDAL(UserInfo model) {
            ConnectBBDD conexion = new ConnectBBDD();

           
                DataTable empleados = conexion.LeerPorComando($"select u.id_empl,u.usuario,u.password,u.nombre,r.nombre as role  from Empleados as u, Roles  as r where r.id = u.id_role and usuario='{model.Usuario}'");
                DataTable usuarios = conexion.LeerPorComando($"select u.id,u.usuario,u.password,u.email,u.direccion,u.nombre,r.nombre as role  from usuarios as u, Roles  as r where r.id = u.id_role and usuario='{model.Usuario}'");


                if ((empleados.Rows.Count > 0 && empleados.Rows[0]["usuario"].ToString().Equals(model.Usuario)) || (usuarios.Rows.Count > 0 && usuarios.Rows[0]["usuario"].ToString().Equals(model.Usuario))) {
                        return true;
                    }
                    return false;



                

            
            

           

        }

        public UserInfo LoginDAL(UserInfo model) {
            ConnectBBDD conexion = new ConnectBBDD();
            DataTable res = conexion.LeerPorComando($"select u.id,u.usuario,u.password,u.email,u.direccion,u.nombre,r.nombre as role  from usuarios as u, Roles  as r where r.id = u.id_role and usuario='{model.Usuario}'");
            DataTable resempl = conexion.LeerPorComando($"select u.id_empl,u.usuario,u.password,u.nombre,r.nombre as role ,u.id_sucursal  from Empleados as u, Roles  as r  where r.id = u.id_role and usuario='{model.Usuario}'");

            if (res.Rows.Count > 0) {
                return new UserInfo(res.Rows[0]["usuario"].ToString(), res.Rows[0]["password"].ToString(), res.Rows[0]["role"].ToString(), res.Rows[0]["nombre"].ToString(), res.Rows[0]["email"].ToString(), res.Rows[0]["direccion"].ToString(),0, int.Parse(res.Rows[0]["id"].ToString()));


            } else if(resempl.Rows.Count > 0) {
                return new UserInfo(resempl.Rows[0]["usuario"].ToString(), resempl.Rows[0]["password"].ToString(), resempl.Rows[0]["role"].ToString(), resempl.Rows[0]["nombre"].ToString(), string.Empty, string.Empty, int.Parse(resempl.Rows[0]["id_sucursal"].ToString()), int.Parse(res.Rows[0]["id"].ToString()));


            } else {
                UserInfo datoNull = null;
                return datoNull;

            }



        }

        public String[] CrearUsuarioDAL(UserInfo model) {
            ConnectBBDD conexion = new ConnectBBDD();

            if (model.id_sucursal != 0) {

                if (model.Usuario != null && model.Password != null & model.Role != null) {
                    if (conexion.EscribirPorComando($"INSERT INTO [dbo].[Empleados]([nombre],[password],[id_role],[id_sucursal],[usuario])VALUES('{model.Nombre}','{model.Password}',{int.Parse(model.Role)},{model.id_sucursal},'{model.Usuario}'); ") != 0) {
                        return new string[] { "OK", $"Usuario {model.Password}, creado" };
                    }
                    return new string[] { "ERROR", "El usuario no se ah podido Crear" };
                }

                return new string[] { "ERROR", "revise la entrada de datos al CrearUsuarioBLL" };

            } else {
                if (model.Usuario != null && model.Password != null & model.Role != null) {
                    if (conexion.EscribirPorComando($"INSERT INTO [dbo].[usuarios]([usuario],[password],[id_role],[nombre],[direccion],[email])VALUES('{model.Usuario}','{model.Password}',{model.Role},'{model.Nombre}','{model.Direccion}','{model.Email}'); ") != 0) {
                        return new string[] { "OK", $"Usuario {model.Password}, creado" };
                    }
                    return new string[] { "ERROR", "El usuario no se ah podido Crear" };
                }

                return new string[] { "ERROR", "revise la entrada de datos al CrearUsuarioBLL" };
            }

            


        }

    }


}
