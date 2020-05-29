using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios {
   public class PDU {
		
		
		public static string getPropertiePDUaBLL(string Clave) {
			return new BLL.PDU().getPropertiePDUBLL(Clave);
		}
	}


}
