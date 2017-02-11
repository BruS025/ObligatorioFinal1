using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaPlato
    {
        public static Plato Buscar(int id)
        {
            return PersistenciaPlatos.Buscar(id);
        }

        public static int Agregar(Plato plato)
        {
            throw new NotImplementedException();
        }

        public static int Modificar(Plato plato)
        {
            throw new NotImplementedException();
        }

        public static int Eliminar(int id)
        {
            return PersistenciaPlatos.Eliminar(id);
        }

        public static List<Plato> Listar()
        {
            throw new NotImplementedException();
        }
    }
}
