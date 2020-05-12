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

        public UserInfo(string usuario, string pass, string role) {
            _usuario = usuario;
            _pass = pass;
            _role = role;
        }
    }
}
