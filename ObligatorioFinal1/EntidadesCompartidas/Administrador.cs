using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Administrador : Usuario
    {
        // Atributos
        public string _Cargo;

        // Constructor simple
        public Administrador() { }

        // Constructor completo
        public Administrador(string Nombre, string Apellido, string Contrasenia, int Documento, string UsuarioNombre, string Cargo) : base(Nombre, Apellido, Contrasenia, Documento, UsuarioNombre)
        {

            _Cargo = Cargo;

        }

        // Metodos
        public string Cargo
        {
            get { return _Cargo; }
            set { _Cargo = value; }           
        }

    }
}
