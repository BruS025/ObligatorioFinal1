using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Usuario
    {
        // Atributos
        public string _Nombre;
        public string _Apellido;
        public string _Contrasenia;
        public int _Documento;
        public string _UsuarioNombre;

        // Constructor simple
        public Usuario() { }

        // Constructor completo
        public Usuario(string Nombre, string Apellido, string Contrasenia, int Documento, string UsuarioNombre)
        {
            _Nombre = Nombre;
            _Apellido = Apellido;
            _Contrasenia = Contrasenia;
            _Documento = Documento;
            _UsuarioNombre = UsuarioNombre;

        }

        // Metodos
        public string Nombre
        {
            get { return _Nombre; }
            set
            {
                if (value.Trim().Length < 3)
                    throw new Exception("ERROR: El nombre debe tener al menos 3 caracteres...");
                else
                    _Nombre = value.Trim();
            }
        }

        public string Apellido
        {
            get { return _Apellido; }
            set
            {
                {
                    if (value.Trim().Length < 3)
                    {
                        throw new Exception("ERROR: El apellido debe tener al menos 3 caracteres...");
                    }

                    else
                    {
                        _Apellido = value.Trim();
                    }
                }
            }
        }

        public string Contrasenia
        {
            get { return _Contrasenia; }
            set
            {
                {
                    if (value.Trim().Length < 3)
                    {
                        throw new Exception("ERROR: La contraseña debe tener al menos 3 caracteres...");
                    }

                    else
                    {
                        _Contrasenia = value.Trim();
                    }
                }
            }
        }

        public int Documento
        {
            get { return _Documento; }
            set
            {
                if ((value < 1000000) || (value > 99999999))
                    throw new Exception("ERROR: El documento debe ser un número de 8 dígitos...");
                else
                    _Documento = value;
            }
        }

        public string UsuarioNombre
        {
            get { return _UsuarioNombre; }
            set
            {
                {
                    if (value.Trim().Length < 3)
                    {
                        throw new Exception("ERROR: El nombre de usuario debe tener al menos 3 caracteres...");
                    }

                    else
                    {
                        _UsuarioNombre = value.Trim();
                    }
                }
            }
        }

    }
}
