using ENTITY;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL {
    public class Venta {
        public ENTITY.Venta IniciarVenta(ENTITY.Venta venta) {
            if (venta.Empleado.Id == 0) {
                venta.Empleado.Id = int.Parse(new PDU().getPropertiePDUBLL("idUserVentaOnline"));
                venta.Empleado.id_sucursal = int.Parse(new PDU().getPropertiePDUBLL("SucursalOnline"));
            }
            venta.Total = int.Parse(venta.Total.ToString().Replace(",", "").Replace(".", ""));
            foreach (DetalleVenta item in venta.DetalleVentas) {
                item.Valor = int.Parse(item.Valor.ToString().Replace(",", "").Replace(".", ""));

            }

            if("2".Equals(venta.Empleado.Role) || "3".Equals(venta.Cliente.Role)) {


                if (! (venta.MedioDePago != "CREDITO" && venta.MedioDePago != "DEBITO")) {

                    if (new Tarjeta().ValidarTarjeta(venta.TarjetaClie)) { 
                        if (new DAL.Venta().GrabarVenta(venta)) {
                            foreach (DetalleVenta item in venta.DetalleVentas) {
                                if (!new DAL.Venta().GrabarDetalle(item)) {
                                    throw new Exception("Error al grabar uno de los detalles");

                                }
                            }
                            return venta;

                        } else {
                            throw new Exception("hubo un problem al grabar venta");

                        }
                    } else {
                        throw new Exception("Tarjeta Rechazada");

                    }





                } else {

                    if (new DAL.Venta().GrabarVenta(venta)) {
                        foreach (DetalleVenta item in venta.DetalleVentas) {
                            if (!new DAL.Venta().GrabarDetalle(item)) {
                                throw new Exception("Error al grabar uno de los detalles");

                            }
                        }
                        return venta;

                    } else {
                        throw new Exception("hubo un problem al grabar venta");

                    }
                }


            } else {
                throw new Exception("esta funcionalidad esta permitida para  Clientes o Vendedores");

            }





        }
    }
}
