using ENTITY;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL {
   public  class Auditoria {

        public bool loggearEnModuloAuditoria(ENTITY.Auditoria auditoria) {
            ConnectBBDD conexion = new ConnectBBDD();


            int insert = conexion.EscribirPorComando($"INSERT INTO Auditoria(Modulo,Usuario,detalle,fecha_hora,role,id_empl) VALUES('{auditoria.Modulo}','{auditoria.Usuario}','{auditoria.Detalle}',SYSDATETIME(),{auditoria.Role},{auditoria.Idempl})");

            if(insert > 0) {
                return true;
            }


            return false;

        }

        public ENTITY.Auditoria[] ObtenerAuditoriaDAL() {
            ConnectBBDD conexion = new ConnectBBDD();

            DataTable res = conexion.LeerPorComando($"select a.Usuario usuario ,c.nombre 'nombrecompleto' ,b.nombre 'rol' , a.Modulo modelo,a.detalle,a.fecha_hora fechahora from Auditoria a , Roles b, Empleados c where a.id_empl = c.id_empl and b.id = a.role");

            if (res.Rows.Count > 0) {
                ENTITY.Auditoria[] arrAuditoria = new ENTITY.Auditoria[res.Rows.Count];



                for (int i = 0; i < res.Rows.Count; i++) {
                    arrAuditoria[i] = new ENTITY.Auditoria(res.Rows[i]["modelo"].ToString(), res.Rows[i]["usuario"].ToString(), res.Rows[i]["detalle"].ToString(), res.Rows[i]["fechahora"].ToString(), res.Rows[i]["nombrecompleto"].ToString(), res.Rows[i]["rol"].ToString()  );
                }

                return arrAuditoria;

            } else {
                ENTITY.Auditoria[] datoNull = null;
                return datoNull;

            }

        }

    }
}
