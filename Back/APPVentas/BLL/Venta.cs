using ENTITY;
using System;

namespace BLL {
    public class Venta {
        public ENTITY.Venta IniciarVenta(ENTITY.Venta venta) {
            DateTime fechaActual = DateTime.Today;
            string mes;
            string anio; 
            if ( venta.TarjetaClie.FechaVencimiento.ToString().Length == 4) {
                 mes = venta.TarjetaClie.FechaVencimiento.ToString().Substring(0, 2);
                 anio = venta.TarjetaClie.FechaVencimiento.ToString().Substring(2, 2);
            } else {
                 mes = "0"+venta.TarjetaClie.FechaVencimiento.ToString().Substring(0, 1);
                 anio = venta.TarjetaClie.FechaVencimiento.ToString().Substring(1, 2);
            }


            if( ! (int.Parse(mes)> 0 && int.Parse(mes) <= 12)) {
                throw new Exception("El mes es Invalido.");

            }

            if (!(int.Parse(anio) > 10 && int.Parse(anio) <= 30)) {
                throw new Exception("El Anio es Invalido.");

            }

            string fecha = fechaActual.Month.ToString() + fechaActual.Year.ToString().Substring(2,2);
            //string.Format("Mes actual {0}. Año actual {1}", fechaActual.ToString("MMMM"), fechaActual.Year)

            if(int.Parse(anio) < int.Parse(fechaActual.Year.ToString().Substring(2, 2)) || (int.Parse(anio) <= int.Parse(fechaActual.Year.ToString().Substring(2, 2)) && int.Parse(mes) < fechaActual.Month) ) {
                throw new Exception("Su Tarjeta ah Expirado.");


            }

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
