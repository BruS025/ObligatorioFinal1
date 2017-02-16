﻿using System;
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

        public static int Agregar(Cliente user)
        {
            return PersistenciaUsuario.Agregar(user);
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

        public static int Redireccionar(string username, string pass)
        {
            return PersistenciaUsuario.Redireccionar(username,pass);
        }
    }
}
