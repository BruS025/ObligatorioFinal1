using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Persistencia;
using EntidadesCompartidas;

namespace Logica
{
    public class LogicaCargo
    {
        public static List<Cargo> Listar()
        {
            return PersistenciaCargo.Listar();
        }
    }
}
