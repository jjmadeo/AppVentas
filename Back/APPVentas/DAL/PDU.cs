using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL {
   public class PDU {
		
		public  string getPropertiePDUDAL(string Clave) {
            ConnectBBDD conexion = new ConnectBBDD();


            DataTable PDU = conexion.LeerPorComando($"select PDUVALOR from PDU where PDUCLAVE='{Clave}'");


            if ((PDU.Rows.Count > 0 && PDU.Rows[0]["PDUVALOR"].ToString() != string.Empty)) {
                return PDU.Rows[0]["PDUVALOR"].ToString();
            }
            return null;

		}
	}

}
