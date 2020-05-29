using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Servicios {
    public class Auditoria {



        public bool loggearEnModuloAuditoria(ENTITY.Auditoria auditoria) {

            return new DAL.Auditoria().loggearEnModuloAuditoria(auditoria);

        }
    }
}
