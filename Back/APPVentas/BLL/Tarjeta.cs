using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTITY;

namespace BLL {
   public  class Tarjeta {

        
        public bool ValidarTarjeta(ENTITY.Tarjeta tarjeta) {

            int provConfig = int.Parse(new PDU().getPropertiePDUBLL("provTarjeta"));
            Random rand = new Random();
            int valor = rand.Next(1, 100);
            valor = provConfig - valor ;
            if (valor >0) {
                return true;

            }

            return false;

        }       


        public ENTITY.Tarjeta[] GetTarjetaBLL(int id)

        {
            return new DAL.Tarjeta().GetTarjetasDAL(id);
        }
    }
}
