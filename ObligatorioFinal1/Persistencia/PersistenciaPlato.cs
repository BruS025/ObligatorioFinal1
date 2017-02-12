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
        public static List<Plato> Listar()
        {
            List<Plato> lista = new List<Plato>();

            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("", conexion);
            comando.CommandType = CommandType.StoredProcedure;


            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    Plato plato = new Plato();

                    plato.Id = Convert.ToInt32(lector["IdPlato"].ToString());
                    plato.Nombre = lector["Nombre"].ToString();
                    plato.Precio = Convert.ToInt32(lector["Precio"].ToString());
                    
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

        public static int Agregar(Plato plato)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("", conexion);
            comando.CommandType = CommandType.StoredProcedure;


            SqlParameter parametroId = new SqlParameter("@", plato.Id);
            SqlParameter parametroNombre = new SqlParameter("@", plato.Nombre);
            SqlParameter parametroPrecio = new SqlParameter("@", plato.Precio);

            //VER LO DE LA FOTO

            comando.Parameters.Add(parametroId);
            comando.Parameters.Add(parametroNombre);
            comando.Parameters.Add(parametroPrecio);

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

        public static int Eliminar(int id)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroId = new SqlParameter("@", id);
            comando.Parameters.Add(parametroId);

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
            SqlCommand comando = new SqlCommand("ListarPlato", conexion);
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

    }
}
