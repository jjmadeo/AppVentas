using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTITY;

namespace BLL {
    public class Sucursal {
        public ENTITY.Sucursal CreateSucursalBLL(ENTITY.Sucursal sucursal) {

            return new DAL.Sucursal().CreateSucursalBLL(sucursal);

        }

        public ENTITY.Sucursal[] SucursalesBLL() {
            return new DAL.Sucursal().SucursalesDAL();
        }
    }
}
