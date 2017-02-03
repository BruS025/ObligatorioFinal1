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
        //private static string cnnString = "Data Source=.;Initial Catalog = OBLIGATORIO; Integrated Security= true;";

        //Conexion B
        private static string cnnString = "Data Source=.\\SQLEXPRESS;Initial Catalog = OBLIGATORIO; Integrated Security= true;Connection Timeout=3500";

        public static string CnnString
        {
            get
            {
                return cnnString;
            }
        }
    }
}