using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL {
   public class Tarjeta {

        public Tarjeta()
        {

        }

        public ENTITY.Tarjeta[] GetTarjetasDAL(int id)
        {
            ConnectBBDD conexion = new ConnectBBDD();



            DataTable res = conexion.LeerPorComando($"select * from Tarjetas where id_usuario={id};");

            if (res.Rows.Count > 0)
            {
                ENTITY.Tarjeta[] arrEmpl = new ENTITY.Tarjeta[res.Rows.Count];



                for (int i = 0; i < res.Rows.Count; i++)
                {
                    arrEmpl[i] = new ENTITY.Tarjeta(res.Rows[i]["nTarjeta"].ToString(), int.Parse(res.Rows[i]["fechaVencimiento"].ToString()), res.Rows[i]["nombre"].ToString(), int.Parse(res.Rows[i]["pin"].ToString()),int.Parse(res.Rows[i]["id_usuario"].ToString()));
                }

                return arrEmpl;

            }
            else
            {
                ENTITY.Tarjeta[] datoNull = null;
                return datoNull;

            }
        }
    }
}
