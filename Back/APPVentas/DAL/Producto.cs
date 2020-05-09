using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTITY;

namespace DAL {
    public class Producto {







        public ENTITY.Producto[] getProductoDAL() {


            ConnectBBDD conexion = new ConnectBBDD();
            DataTable res = conexion.LeerPorComando($"select *  from productos");

            if (res.Rows.Count > 0) {
                ENTITY.Producto[] arrProduct = new ENTITY.Producto[res.Rows.Count];



                for (int i = 0; i < res.Rows.Count; i++) {
                    arrProduct[i] = new ENTITY.Producto(
                        res.Rows[i]["nombre"].ToString(), 
                        res.Rows[i]["detalle"].ToString(),
                       float.Parse(res.Rows[i]["precio"].ToString()),
                        Int32.Parse(res.Rows[i]["stock"].ToString()),
                       Int32.Parse (res.Rows[i]["fecha"].ToString()), 
                       bool.Parse(res.Rows[i]["visible"].ToString()),
                       Int32.Parse (res.Rows[i]["id"].ToString())

                        );
                }

                return arrProduct;

            } else {
                ENTITY.Producto[] datoNull = null;
                return datoNull;

            }



        }






    }

}

