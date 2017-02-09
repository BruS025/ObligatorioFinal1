using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public class Conexion
    {
        //Conexion A
        //private static string cnnString = "Data Source=.;Initial Catalog = OBLIGATORIOFINAL; Integrated Security= true;";

        //Conexion B NO COMITEAR
        private static string cnnString = "Data Source=.\\SQLEXPRESS;Initial Catalog = OBLIGATORIOFINAL; Integrated Security= true;Connection Timeout=3500";

        public static string CnnString
        {
            get
            {
                return cnnString;
            }
        }
    }
}