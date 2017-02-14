using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaPlato
    {
        public static List<Plato> Listar(long rut)
        {
            List<Plato> lista = new List<Plato>();

            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("ListarPlato", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroRut = new SqlParameter("@rut", rut);

            comando.Parameters.Add(parametroRut);

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    Plato plato = new Plato();

                    plato.Id = Convert.ToInt32(lector["IdPlatoCasa"].ToString());
                    plato.Nombre = lector["Nombre"].ToString();
                    plato.Precio = Convert.ToInt32(lector["Precio"].ToString());
                    plato.Foto = lector["Foto"].ToString();

                    //VER COMO ES LO DE LA FOTO

                    lista.Add(plato);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }

        public static int Agregar(Plato plato, long rut)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_AgregarPlato", conexion);
            comando.CommandType = CommandType.StoredProcedure;


            SqlParameter parametroRut = new SqlParameter("@rut", rut);
            SqlParameter parametroNombre = new SqlParameter("@NombreA", plato.Nombre);
            SqlParameter parametroPrecio = new SqlParameter("@PrecioA", plato.Precio);
            SqlParameter parametroFoto = new SqlParameter("@FotoA", plato.Foto);

            comando.Parameters.Add(parametroRut);
            comando.Parameters.Add(parametroNombre);
            comando.Parameters.Add(parametroPrecio);
            comando.Parameters.Add(parametroFoto);

            try
            {
                conexion.Open();
                int resultado = comando.ExecuteNonQuery();
                return resultado;

            }
            catch (SqlException sqlex)
            {

                throw sqlex;
            }

            finally
            {
                conexion.Close();
            }
        }

        public static Plato Buscar(int id)
        {
            Plato plato = new Plato();

            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            // parametros del sp
            SqlParameter parametroId = new SqlParameter("@", id);



            //agrega los parametros
            comando.Parameters.Add(parametroId);

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    plato.Id = Convert.ToInt32(lector["Rut"].ToString());
                    plato.Precio = Convert.ToInt32(lector["IdEspe"].ToString());
                    plato.Nombre = lector["nombre"].ToString();

                    //VER LO DE LA FOTO
                }
                return plato;
            }
            catch (SqlException)
            {
                throw new Exception();
            }
            catch (Exception)
            {
                throw new Exception();

            }
            finally
            {
                conexion.Close();
            }


        }

        public static int Eliminar(int id, long rut)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_BorrarPlato", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroId = new SqlParameter("@IdPlatoB", id);
            SqlParameter parametroRut = new SqlParameter("@rut", rut);

            comando.Parameters.Add(parametroId);
            comando.Parameters.Add(parametroRut);

            try
            {
                conexion.Open();
                int resultado = comando.ExecuteNonQuery();
                return resultado;
            }
            catch (SqlException sqlex)
            {
                throw sqlex;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }

        public static List<Plato> ListarPedido(int id, long rut)
        {
            List<Plato> lista = new List<Plato>();

            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("ListarPlatoPedido", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroId = new SqlParameter("@IdEspe", id);
            SqlParameter parametroRut = new SqlParameter("@rut", rut);

            comando.Parameters.Add(parametroId);
            comando.Parameters.Add(parametroRut);

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    Plato plato = new Plato();

                    plato.Id = Convert.ToInt32(lector["IdPlato"].ToString());
                    plato.Nombre = lector["Nombre"].ToString();
                    plato.Precio = Convert.ToDouble(lector["Precio"].ToString());
                    plato.Foto = lector["Foto"].ToString();

                    //VER COMO ES LO DE LA FOTO

                    lista.Add(plato);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }

    

    public static int Modificar(Plato plato, long rut)
    {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ModificarPlato", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroRut = new SqlParameter("@RutOriginal", rut);
            SqlParameter parametroNombre = new SqlParameter("@NombreM", plato.Nombre);
            SqlParameter parametroPrecio = new SqlParameter("@PrecioM", plato.Precio);
            SqlParameter parametroFoto = new SqlParameter("@FotoM", plato.Foto);

            comando.Parameters.Add(parametroRut);
            comando.Parameters.Add(parametroNombre);
            comando.Parameters.Add(parametroPrecio);
            comando.Parameters.Add(parametroFoto);

                try
            {
                conexion.Open();
                int resultado = comando.ExecuteNonQuery();
                return resultado;

            }
            catch (SqlException sqlex)
            {

                throw sqlex;
            }

            finally
            {
                conexion.Close();
            }
         }
    }
}
