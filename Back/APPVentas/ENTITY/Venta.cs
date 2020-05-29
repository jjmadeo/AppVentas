using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace ENTITY {
    public class Venta {
		private int _id;

		public int ID {
			get { return _id; }
			set { _id = value; }
		}
		private UserInfo _emplado;

		public UserInfo Empleado {
			get { return _emplado; }
			set { _emplado = value; }
		}

		private UserInfo _usuario;

		public UserInfo Cliente {
			get { return _usuario; }
			set { _usuario = value; }
		}

		private Tarjeta _tarjeta;

		public Tarjeta TarjetaClie {
			get { return _tarjeta; }
			set { _tarjeta = value; }
		}

		private DateTime _fecha;

		public DateTime Fecha {
			get { return _fecha; }
			set { _fecha = value; }
		}

		private MedioDePago _MedioDePago;

		public MedioDePago MedioDePago {
			get { return _MedioDePago; }
			set { _MedioDePago = value; }
		}

		private string _nombreCompleClie;

		public string NombreCompletoClie {
			get { return _nombreCompleClie; }
			set { _nombreCompleClie = value; }
		}

		private string _cuilClie;

		public string CuilClie {
			get { return _cuilClie; }
			set { _cuilClie = value; }
		}

		private float _Total;

		public float Total {
			get { return _Total; }
			set { _Total = value; }
		}

		private string _DireccionClie;

		public string  DireccionClie {
			get { return _DireccionClie; }
			set { _DireccionClie = value; }
		}

		private DetalleVenta[] _DetalleVentas;

		public DetalleVenta[] DetalleVentas {
			get { return _DetalleVentas; }
			set { _DetalleVentas = value; }
		}




	}
}
