using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaUsuario
    {
        public static Administrador Buscar(int documento)
        {
            return PersistenciaUsuario.Buscar(documento);
        }

        public static int Agregar(Administrador admin)
        {
            throw new NotImplementedException();
        }

        public static int Modificar(Administrador admin)
        {
            throw new NotImplementedException();
        }

        public static int Eliminar(int documento)
        {
            throw new NotImplementedException();
        }

        public static List<Administrador> Listar()
        {
            return PersistenciaUsuario.Listar();
        }
    }
}
