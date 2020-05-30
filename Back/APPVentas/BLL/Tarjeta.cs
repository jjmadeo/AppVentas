using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTITY;

namespace BLL {
   public  class Tarjeta {

        public Tarjeta()
        {

        }

        public ENTITY.Tarjeta[] GetTarjetaBLL(int id)

        {
            return new DAL.Tarjeta().GetTarjetasDAL(id);
        }
    }
}
