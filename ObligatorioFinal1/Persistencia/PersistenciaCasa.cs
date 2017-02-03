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
        public static List<Casa> Listar()
        {
            return null; 

        }

        public static int Agregar(Casa casa)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_AgregarCasa", conexion);
            comando.CommandType = CommandType.StoredProcedure;


            SqlParameter parametroRut = new SqlParameter("@RutN ", casa.RUT);
            SqlParameter parametroNombre = new SqlParameter("@NombreN ", casa.Nombre);
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
            return null;
            
        }

        public static int Modificar(Casa casa)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ModificarCasa", conexion);
            comando.CommandType = CommandType.StoredProcedure;


            SqlParameter parametroRut = new SqlParameter("@ciCliNue", casa.RUT);
            SqlParameter parametroNombre = new SqlParameter("@nomCliNue", casa.Nombre);
            SqlParameter parametroEspecializacion = new SqlParameter("@apeCliNue", casa.Especializacion);
            
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
    }
}