using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
   public class Categoria {
		private string _nombre;

		public string Nombre {
			get { return _nombre; }
			set { _nombre = value; }
		}

		private int _id;

		public int Id {
			get { return _id; }
			set { _id = value; }
		}

		public Categoria(string nombre, int id) {
			_nombre = nombre;
			_id = id;
		}
		public Categoria(string nombre) {
			_nombre = nombre;
		}
	}
}
