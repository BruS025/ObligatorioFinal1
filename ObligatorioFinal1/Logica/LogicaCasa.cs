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
        public static Casa Buscar(long rut)
        {
            return PersistenciaCasa.Buscar(rut);

        }

        public static int Agregar(Casa casa)
        {
            return PersistenciaCasa.Agregar(casa);
        }

        public static int Modificar(Casa casa)
        {
            return PersistenciaCasa.Modificar(casa);
        }

        public static int Eliminar(long rut)
        {
            return PersistenciaCasa.Eliminar(rut);
        }

        public static List<Casa> Listar(int id)
        {
            return PersistenciaCasa.Listar(id);
        }

        public static List<Casa> ListarPedido(int id)
        {
            return PersistenciaCasa.ListarPedido(id);
        }

        public static List<Casa> ListarTodas()
        {
            return PersistenciaCasa.ListarTodas();
        }      

    }
}
