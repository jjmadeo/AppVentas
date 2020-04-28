using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ENTITY
{
    public class UserInfo
    {
        public String Usuario { get; set; }
        public String Password { get; set; }
        public String Role { get; set; }

        public UserInfo(string usuario, string password, string role)
        {
            Usuario = usuario;
            Password = password;
            Role = role;
        }
    }
}
