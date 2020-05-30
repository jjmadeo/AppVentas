using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
   public class Tarjeta {
      
        private string _nTarjeta;

        public string nTarjeta {
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

        public Tarjeta(string nTarjeta, int fechaVencimiento, string nombreCompleto, int pin, int idUsuario)
        {
            _nTarjeta = nTarjeta;
            _fechaVencimiento = fechaVencimiento;
            _nombreCompleto = nombreCompleto;
            _pin = pin;
            _idUsuario = idUsuario;
        }
    }
}
