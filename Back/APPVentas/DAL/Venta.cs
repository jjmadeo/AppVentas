using ENTITY;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL {
   public class Venta {

        public bool GrabarVenta(ENTITY.Venta venta) {
            ConnectBBDD conexion = new ConnectBBDD();
            string a = $"INSERT INTO [dbo].[Ventas]([id_empl],[id_usua],[Medio_Pago],[nombreClie],[cuilClie],[DireccionClie],[fecha],[total],[id_sucursal])VALUES({venta.Empleado.Id},{venta.Cliente.Id},'{venta.MedioDePago}','{venta.NombreCompletoClie}','{venta.CuilClie}','{venta.DireccionClie}',SYSDATETIME(),{venta.Total},{venta.Empleado.id_sucursal})";
            if (conexion.EscribirPorComando(a) > 0) {

                return true;
        }

            return false;
        }

        public bool GrabarDetalle(ENTITY.DetalleVenta detalle) {

            ConnectBBDD conexion = new ConnectBBDD();
             DataTable res = conexion.LeerPorComando($"SELECT IDENT_CURRENT ('ventas') AS Current_Identity;");

            int idVenta = int.Parse(res.Rows[0]["Current_Identity"].ToString());


            if (conexion.EscribirPorComando($"INSERT INTO dbo.DetalleVenta(id_venta,id_producto,cantidad,valor) VALUES({idVenta},{detalle.producto.id},{detalle.Cantidad},{detalle.Valor})") > 0) {

                return true;
            }

            return false;
        }



    }
}
