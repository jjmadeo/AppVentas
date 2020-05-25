using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
    public class Roles {
		private int _id;

		public int Id {
			get { return _id; }
			set { _id = value; }
		}

		private string _nombre;

		public string Nombre {
			get { return _nombre; }
			set { _nombre = value; }
		}

		public Roles(int id, string nombre) {
			_id = id;
			_nombre = nombre;
		}
	}
}
