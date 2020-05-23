using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.ModelBinding;

namespace ENTITY
{
    public class UserInfo
    {

        private String _usuario;

        public String Usuario {
            get { return _usuario; }
            set { _usuario = value; }
        }


        private String _pass;

        public String Password {
            get { return _pass; }
            set { _pass = value; }
        }

        private String _role;

        public String Role {
            get { return _role; }
            set { _role = value; }
        }
        private string _nombre;

        public string Nombre {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private string _email;

        public string Email {
            get { return _email; }
            set { _email = value; }
        }

        private string _direccion;

        public string Direccion {
            get { return _direccion; }
            set { _direccion = value; }
        }

        private int _id_sucursal;

        public int id_sucursal {
            get { return _id_sucursal; }
            set { _id_sucursal = value; }
        }





        

        public UserInfo(string usuario, string pass, string role, string nombre, string email, string direccion, int id_sucursal) {
            _usuario = usuario;
            _pass = pass;
            _role = role;
            _nombre = nombre;
            _email = email;
            _direccion = direccion;
            _id_sucursal = id_sucursal;

        }

        public UserInfo() {
        }

        
    }
}
