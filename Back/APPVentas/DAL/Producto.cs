using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTITY;

namespace DAL {
    public class Producto {







        public ENTITY.Producto[] getProductoDAL( int id =0) {
            ConnectBBDD conexion = new ConnectBBDD();

            if(id > 0) {
                DataTable res = conexion.LeerPorComando($"select b.nombre,b.precio,b.detalle ,b.visible,b.fecha,b.id,r.stock,c.nombre as categoria ,c.id as id__categoria from productos b, ProductoSucursalRela r, Sucursales s , Categorias c where b.id = r.id_producto and s.id = r.id_sucursal and b.id_Categoria = c.id and r.id_sucursal = {id}");

                if (res.Rows.Count > 0) {
                    ENTITY.Producto[] arrProduct = new ENTITY.Producto[res.Rows.Count];

                    for (int i = 0; i < res.Rows.Count; i++) {
                        arrProduct[i] = new ENTITY.Producto(
                            res.Rows[i]["nombre"].ToString(),
                            res.Rows[i]["detalle"].ToString(),
                           float.Parse(res.Rows[i]["precio"].ToString()),
                            Int32.Parse(res.Rows[i]["stock"].ToString()),
                           Int32.Parse(res.Rows[i]["fecha"].ToString()),
                           bool.Parse(res.Rows[i]["visible"].ToString()),
                           Int32.Parse(res.Rows[i]["id"].ToString()),
                           new Categoria(res.Rows[i]["categoria"].ToString(), Int32.Parse(res.Rows[i]["id__categoria"].ToString()))
                            );
                    }


                    return arrProduct;

                } else {
                    ENTITY.Producto[] datoNull = null;
                    return datoNull;

                }
            } else {
                DataTable res = conexion.LeerPorComando($"select a.detalle,a.fecha,a.id,a.nombre,a.precio,a.stock,a.visible,b.nombre as categoria,b.id as id__categoria from productos as a, categorias as b  where a.id_Categoria = b.id");

                if (res.Rows.Count > 0) {
                    ENTITY.Producto[] arrProduct = new ENTITY.Producto[res.Rows.Count];

                    for (int i = 0; i < res.Rows.Count; i++) {
                        arrProduct[i] = new ENTITY.Producto(
                            res.Rows[i]["nombre"].ToString(),
                            res.Rows[i]["detalle"].ToString(),
                           float.Parse(res.Rows[i]["precio"].ToString()),
                            Int32.Parse(res.Rows[i]["stock"].ToString()),
                           Int32.Parse(res.Rows[i]["fecha"].ToString()),
                           bool.Parse(res.Rows[i]["visible"].ToString()),
                           Int32.Parse(res.Rows[i]["id"].ToString()),
                           new Categoria(res.Rows[i]["categoria"].ToString(), Int32.Parse(res.Rows[i]["id__categoria"].ToString()))
                            );
                    }


                    return arrProduct;

                } else {
                    ENTITY.Producto[] datoNull = null;
                    return datoNull;

                }
            }

            



        }


        public ENTITY.Categoria[] getCategoriasDAL() {
            ConnectBBDD conexion = new ConnectBBDD();
            DataTable res = conexion.LeerPorComando($"select *  from categorias");

            if (res.Rows.Count > 0) {
                ENTITY.Categoria[] arrCategoria = new ENTITY.Categoria[res.Rows.Count];

                for (int i = 0; i < res.Rows.Count; i++) {
                    arrCategoria[i] = new ENTITY.Categoria(
                     res.Rows[i]["nombre"].ToString(),
                     Int32.Parse(res.Rows[i]["id"].ToString())

                        );
                }

                return arrCategoria;

            } else {
                ENTITY.Categoria[] datoNull = null;
                return datoNull;

            }



        }


        






    }

}

