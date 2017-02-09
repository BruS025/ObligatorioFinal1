using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Persistencia;
using EntidadesCompartidas;

namespace Logica
{
    public class LogicaEspecializacion
    {
        public static List<Especializacion> Listar()
        {
            return PersistenciaEspecializacion.Listar();
        }
    }
}
