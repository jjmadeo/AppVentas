using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL {
    public class Sucursal {
        public ENTITY.Sucursal CreateSucursalBLL(ENTITY.Sucursal sucursal) {
            ConnectBBDD conexion = new ConnectBBDD();


            //DataTable res = conexion.LeerPorComando($"select * from Sucursales ");

            //if (res.Rows.Count > 0) {
            //    ENTITY.Sucursal[] arrProduct = new ENTITY.Sucursal[res.Rows.Count];

            //    for (int i = 0; i < res.Rows.Count; i++) {
            //        arrProduct[i] = new ENTITY.Sucursal(
            //            res.Rows[i]["nombre"].ToString(),
            //            res.Rows[i]["detalle"].ToString(),
            //           float.Parse(res.Rows[i]["precio"].ToString()),
            //            Int32.Parse(res.Rows[i]["stock"].ToString()),
            //           Int32.Parse(res.Rows[i]["fecha"].ToString()),
            //           bool.Parse(res.Rows[i]["visible"].ToString()),
            //           Int32.Parse(res.Rows[i]["id"].ToString()),
            //           new Categoria(res.Rows[i]["categoria"].ToString(), Int32.Parse(res.Rows[i]["id__categoria"].ToString()))
            //            );
            //    }


            //    return arrProduct;

            //} else {
            //    ENTITY.Sucursal[] datoNull = null;
            //    return datoNull;

            //}


            if (sucursal.razonSocial != string.Empty && sucursal.Direccion != string.Empty && sucursal.Cuil != string.Empty ) {
                if (conexion.EscribirPorComando($"INSERT INTO [dbo].[Sucursales] ([razon_social],[cuil],[direccion])VALUES('{sucursal.razonSocial}','{sucursal.Cuil}','{sucursal.Direccion}');") != 0) {
                    return sucursal;
                }
                return null;
            }

            return null;

        }

        public ENTITY.Sucursal[] SucursalesDAL() {

            ConnectBBDD conexion = new ConnectBBDD();



            DataTable res = conexion.LeerPorComando($"select * from Sucursales ");

            if (res.Rows.Count > 0) {
                ENTITY.Sucursal[] arrSucur = new ENTITY.Sucursal[res.Rows.Count];

                for (int i = 0; i < res.Rows.Count; i++) {
                    arrSucur[i] = new ENTITY.Sucursal(int.Parse(res.Rows[i]["id"].ToString()), 
                        res.Rows[i]["razon_social"].ToString(), 
                        res.Rows[i]["cuil"].ToString(), 
                        res.Rows[i]["direccion"].ToString()                       
                        );
                }


                return arrSucur;

            } else {
                ENTITY.Sucursal[] datoNull = null;
                return datoNull;

            }
        }
    }
}

