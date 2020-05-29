using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
   public class Auditoria {

		private string _modulo;

		public string Modulo {
			get { return _modulo; }
			set { _modulo = value; }
		}

		private string _usuario;

		public string Usuario {
			get { return _usuario; }
			set { _usuario = value; }
		}
		private string _detalle;

		public string Detalle {
			get { return _detalle; }
			set { _detalle = value; }
		}

		private string _fecha;

		public string Fecha {
			get { return _fecha; }
			set { _fecha = value; }
		}

		private int _role;

		public int Role {
			get { return _role; }
			set { _role = value; }
		}

		private int _idempl;

		public int Idempl {
			get { return _idempl; }
			set { _idempl = value; }
		}
		private string _nombreRole;

		public string NombreRole {
			get { return _nombreRole; }
			set { _nombreRole = value; }
		}

		private string _NombreCompleEMPl;

		public string NombreCompleEMPL {
			get { return _NombreCompleEMPl; }
			set { _NombreCompleEMPl = value; }
		}


		public Auditoria(string modulo, string usuario, string detalle, string fecha, int role, int idempl) {
			_modulo = modulo;
			_usuario = usuario;
			_detalle = detalle;
			_fecha = fecha;
			_role = role;
			_idempl = idempl;
		}

		public Auditoria(string modulo, string usuario, string detalle, string fecha,string nombreCOmpletoEMPl,string nombreRole) {
			_modulo = modulo;
			_usuario = usuario;
			_detalle = detalle;
			_fecha = fecha;
			_nombreRole = nombreRole;
			_NombreCompleEMPl = nombreCOmpletoEMPl;
		}


	}
}
