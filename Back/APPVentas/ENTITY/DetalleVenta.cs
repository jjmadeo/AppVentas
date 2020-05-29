using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
    public class DetalleVenta {
		private int _idVenta;

		public int idVenta {
			get { return _idVenta; }
			set { _idVenta = value; }
		}

		private Producto _producto;

		public Producto rproducto {
			get { return _producto; }
			set { _producto = value; }
		}
		private int _cantidad;

		public int Cantidad {
			get { return _cantidad; }
			set { _cantidad = value; }
		}
		private int _valor;

		public int Valor {
			get { return _valor; }
			set { _valor = value; }
		}




	}
}
