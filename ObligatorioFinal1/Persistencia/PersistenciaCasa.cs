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
    public class PersistenciaCasa
    {
        public static List<Casa> Listar(int id)
        {
            List<Casa> lista = new List<Casa>();
            
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ListarCasa", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroId = new SqlParameter("@IdEspeMostrar", id);

            comando.Parameters.Add(parametroId);
            
            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    Casa casa = new Casa();

                    casa.RUT = Convert.ToInt64(lector["Rut"].ToString());
                    casa.Especializacion = Convert.ToInt32(lector["IdEspe"].ToString());
                    casa.Nombre = lector["Nombre"].ToString();

                    lista.Add(casa);
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

        public static int Agregar(Casa casa)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_AgregarCasa", conexion);
            comando.CommandType = CommandType.StoredProcedure;


            SqlParameter parametroRut = new SqlParameter("@RutN", casa.RUT);
            SqlParameter parametroNombre = new SqlParameter("@NombreN", casa.Nombre);
            SqlParameter parametroEspecializacion = new SqlParameter("@IdEspeN", casa.Especializacion);
            
            comando.Parameters.Add(parametroRut);
            comando.Parameters.Add(parametroNombre);
            comando.Parameters.Add(parametroEspecializacion);
            
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

        public static Casa Buscar(long rut)
        {
            Casa casa = new Casa();

            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_BuscarCasa", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            // parametros del sp
            SqlParameter parametroRut = new SqlParameter("@RutB", rut);
            


            //agrega los parametros
            comando.Parameters.Add(parametroRut);

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    casa.RUT = Convert.ToInt32(lector["Rut"].ToString());
                    casa.Nombre = lector["Nombre"].ToString();
                    casa.Especializacion= Convert.ToInt32(lector["IdEspe"].ToString());

                }
                return casa;
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

        public static int Modificar(Casa casa)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ModificarCasa", conexion);
            comando.CommandType = CommandType.StoredProcedure;


            SqlParameter parametroRut = new SqlParameter("@RutM", casa.RUT);
            SqlParameter parametroNombre = new SqlParameter("@NombreM", casa.Nombre);
            SqlParameter parametroEspecializacion = new SqlParameter("@IdEspeM", casa.Especializacion);
            
            comando.Parameters.Add(parametroRut);
            comando.Parameters.Add(parametroNombre);
            comando.Parameters.Add(parametroEspecializacion);
            
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

        public static int Eliminar(long rut)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_BorrarCasa", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroRut = new SqlParameter("@RutB", rut);
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

        public static List<Casa> ListarPedido(int id)
        {
            List<Casa> lista = new List<Casa>();

            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("ListarCasaPedido", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroId = new SqlParameter("@IdEspe", id);

            comando.Parameters.Add(parametroId);

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    Casa casa = new Casa();

                    casa.RUT = Convert.ToInt64(lector["Rut"].ToString());
                    casa.Especializacion = Convert.ToInt32(lector["IdEspe"].ToString());
                    casa.Nombre = lector["Nombre"].ToString();

                    lista.Add(casa);
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