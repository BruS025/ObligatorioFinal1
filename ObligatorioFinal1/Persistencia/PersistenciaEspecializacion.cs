using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaEspecializacion
    {
        public static List<Especializacion> Listar()
        {
            List<Especializacion> lista = new List<Especializacion>();
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ListarEspecializaciones", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    Especializacion esp = new Especializacion();
                    esp.IdEspe = Convert.ToInt32(lector["IdEspe"].ToString());
                    esp.Tipo = lector["Tipo"].ToString();

                    lista.Add(esp);
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
