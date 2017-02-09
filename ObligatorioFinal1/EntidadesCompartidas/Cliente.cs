using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Cliente : Usuario
    {
        // Atributos
        public long _Tarjeta;
        public string _Calle;
        public string _Puerta;

        // Constructor simple
        public Cliente() { }

        // Constructor completo
        public Cliente (string Nombre, string Apellido, string Contrasenia, int Documento, string UsuarioNombre,  long Tarjeta, string Calle, string Puerta) : base (Nombre, Apellido, Contrasenia, Documento, UsuarioNombre)
        {

            _Tarjeta = Tarjeta;
            _Calle = Calle;
            _Puerta = Puerta;

        }

        // Metodos
        public long Tarjeta
        {
            get { return _Tarjeta; }
            set
            {
                if ((value < 1000000000000000) || (value > 9999999999999999))
                    throw new Exception("ERROR: El número de tarjeta debe ser de 16 dígitos...");
                else
                    _Tarjeta = value;
            }
        }

        public string Calle
        {
            get { return _Calle; }
            set
            {
                {
                    if (value.Trim().Length < 3)
                    {
                        throw new Exception("ERROR: El nombre de la calle debe tener al menos 3 caracteres...");
                    }

                    else
                    {
                        _Calle = value.Trim();
                    }
                }
            }
        }

        public string Puerta
        {
            get { return _Puerta; }
            set
            {
                {
                    if (value.Trim().Length < 4)
                    {
                        throw new Exception("ERROR: El número de puerta debe tener al menos 4 caracteres...");
                    }

                    else
                    {
                        _Puerta = value.Trim();
                    }
                }
            }
        }


    }
}
