using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaCasa
    {
        public static Casa Buscar(int rut)
        {
            return PersistenciaCasa.Buscar(rut);

        }

        public static int Agregar(Casa casa)
        {
            throw new NotImplementedException();
        }

        public static int Modificar(Casa casa)
        {
            throw new NotImplementedException();
        }

        public static int Eliminar(int rut)
        {
            throw new NotImplementedException();
        }

        public static List<Casa> Listar()
        {
            throw new NotImplementedException();
        }
    }
}
