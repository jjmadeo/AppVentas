using ENTITY;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL {
    public class Producto {




        public ENTITY.Producto[] getProductoBLL() {


            return new DAL.Producto().getProductoDAL();


        }
        public ENTITY.Producto[] getProductoBLL(int idsucursal) {


            return new DAL.Producto().getProductoDAL(idsucursal);


        }
        public ENTITY.Categoria[] getCategoriasBLL() {


            return new DAL.Producto().getCategoriasDAL();


        }

        
    }
}
