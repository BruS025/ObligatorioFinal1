using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Plato
    {

        // Atributos
        public int _Id;
        public int _IdPlato;
        public string _Nombre;
        public double _Precio;
        public int _Foto;

        // Constructor simple
        public Plato() { }

        // Constructor completo
        public Plato(int Id, int IdPlato, string Nombre, double Precio, int Foto)
        {
            _Id = Id;
            _IdPlato = IdPlato;
            _Nombre = Nombre;
            _Precio = Precio;
            _Foto = Foto;

        }

        // Metodos
        public int Id
        {
            get { return _Id; }
            set {_Id = value; }
        }

        public int IdPlato
        {
            get { return _IdPlato; }
            set { _IdPlato = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set
            {
                {
                    if (value.Trim().Length < 3)
                    {
                        throw new Exception("ERROR: El nombre del plato debe tener al menos 3 caracteres...");
                    }

                    else
                    {
                        _Nombre = value.Trim();
                    }
                }
            }
        }

        public double Precio
        {
            get { return _Precio; }
            set
            {
                if ((value < 1) || (value > 9999999999))
                    throw new Exception("ERROR: El precio debe ser mayor a cero...");
                else
                    _Precio = value;
            }
        }

    }
}
