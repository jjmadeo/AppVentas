using ENTITY;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL {
    public class Auditoria {



        public bool loggearEnModuloAuditoria(ENTITY.Auditoria auditoria) {

            return new DAL.Auditoria().loggearEnModuloAuditoria(auditoria);

        }

        public ENTITY.Auditoria[] ObtenerAuditoriaBLL() {
            return new DAL.Auditoria().ObtenerAuditoriaDAL();
        }
    }
}
