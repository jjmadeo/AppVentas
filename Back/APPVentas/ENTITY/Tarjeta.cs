using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
   public class Tarjeta {
      
        private int _nTarjeta;

        public int nTarjeta {
            get { return _nTarjeta; }
            set { _nTarjeta = value; }
        }

        private int _fechaVencimiento;

        public int FechaVencimiento {
            get { return _fechaVencimiento; }
            set { _fechaVencimiento = value; }
        }
        private string _nombreCompleto;

        public string NombreCompleto {
            get { return _nombreCompleto; }
            set { _nombreCompleto = value; }
        }

        private int _pin;

        public int Pin {
            get { return _pin; }
            set { _pin = value; }
        }

        private int _idUsuario;
            
        public int id_usuario {
            get { return _idUsuario; }
            set { _idUsuario = value; }
        }





    }
}
