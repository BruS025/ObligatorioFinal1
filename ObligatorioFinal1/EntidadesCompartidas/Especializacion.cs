using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
        public class Especializacion
        {
            // Atributos
            public string _Nombre;
            public int _IdEspecializacion;
            //public string _Especialidad;

            // Constructor simple
            public Especializacion() { }

            // Constructor completo
            public Especializacion(string Nombre, int IdEspecializacion)
            {
                _Nombre = Nombre;
                _IdEspecializacion = IdEspecializacion;

            }

            // Metodos
            public string Tipo
            {
                get { return _Nombre; }
                set
                {
                    {
                        if (value.Trim().Length < 3)
                        {
                            throw new Exception("ERROR: El nombre de la casa debe tener al menos 3 caracteres...");
                        }

                        else
                        {
                            _Nombre = value.Trim();
                        }
                    }
                }
            }

            public int IdEspe
            {
                get { return _IdEspecializacion; }
                set { _IdEspecializacion = value; }
            }     
    }
}
