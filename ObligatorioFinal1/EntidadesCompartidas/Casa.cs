using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Casa
    {
        // Atributos
        public long _RUT;
        public string _Nombre;
        public int _IdEspecializacion;
        //public string _Especialidad;

        // Constructor simple
        public Casa() { }

        // Constructor completo
        public Casa(long RUT, string Nombre, int IdEspecializacion)
            {

                _RUT = RUT;
                _Nombre = Nombre;
                _IdEspecializacion = IdEspecializacion;
               // _Especialidad = Especialidad;

            }

        // Metodos
        public long RUT
        {
            get { return _RUT; }
            set
                {
                    if ((value < 1000000000000000) || (value > 9999999999999999))
                        throw new Exception("ERROR: El número de RUT debe ser de 16 dígitos...");
                    else
                    _RUT = value;
                }
            }

        public string Nombre
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

        public int Especializacion
        {
            get { return _IdEspecializacion; }
            set { _IdEspecializacion = value; }                                
        }

      /*  public string Especialidad
        {
            get { return _Especialidad; }
            set {
                _Especialidad = value;       
            }
        }*/
    }

}
