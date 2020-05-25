using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
    public class Sucursal {
		private int _id;

		public int id {
			get { return _id; }
			set { _id = value; }
		}
		private string _razonSocial;

		public string razonSocial {
			get { return _razonSocial; }
			set { _razonSocial = value; }
		}
		private string _cuil;

		public string Cuil {
			get { return _cuil; }
			set { _cuil = value; }
		}
		private string _direccion;

		public string Direccion {
			get { return _direccion; }
			set { _direccion = value; }
		}

		public Sucursal(int id, string razonSocial, string cuil, string direccion) {
			_id = id;
			_razonSocial = razonSocial;
			_cuil = cuil;
			_direccion = direccion;
		}
	}
}
