﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Persistencia;
using EntidadesCompartidas;



namespace Logica
{
    public class LogicaCasa
    {
        public static List<Casa> Listar()
        {
            return PersistenciaCasa.Listar();
        }
    }
}
