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
    public class PersistenciaUsuario
    {
       public static List<Administrador> Listar()
        {
            List<Administrador> lista = new List<Administrador>();

            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ListarAdministradores", conexion);
            comando.CommandType = CommandType.StoredProcedure;
                        
            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    Administrador admin = new Administrador();

                    admin.Nombre = lector["Nombre"].ToString();
                    admin.Apellido = lector["Apellido"].ToString();
                    admin.Documento = Convert.ToInt32(lector["NroDoc"].ToString());
                    admin.UsuarioNombre = lector["NombreLogueo"].ToString();
                    admin.Contrasenia= lector["Contrasenia"].ToString();
                                        
                    lista.Add(admin);
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

       public static int Agregar(Cliente user)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_AgregarCliente", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter PNombre = new SqlParameter("@NombreN", user.Nombre);
            SqlParameter PApellido = new SqlParameter("@ApellidoN", user.Apellido);
            SqlParameter PContrasenia = new SqlParameter("@ContraseniaN", user.Contrasenia);
            SqlParameter PNroDoc = new SqlParameter("@NroDocN", user.Documento);
            SqlParameter PNomLogueo = new SqlParameter("@NombreLogueoN", user.UsuarioNombre);
            SqlParameter PNroTarjeta = new SqlParameter("@NroTarjetaN", user.Tarjeta);
            SqlParameter PCalle = new SqlParameter("@CalleN", user.Calle);
            SqlParameter PNroPuerta = new SqlParameter("@NroPuertaN", user.Puerta);
            
            comando.Parameters.Add(PNombre);
            comando.Parameters.Add(PApellido);
            comando.Parameters.Add(PContrasenia);
            comando.Parameters.Add(PNroDoc);
            comando.Parameters.Add(PNomLogueo);
            comando.Parameters.Add(PNroTarjeta);
            comando.Parameters.Add(PCalle);
            comando.Parameters.Add(PNroPuerta);

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

       public static Administrador Buscar(int documento)
        {
            Administrador admin = new Administrador();

            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            // parametros del sp
           // SqlParameter parametro = new SqlParameter("@", );



            //agrega los parametros
            //comando.Parameters.Add(parametro);

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    admin.Nombre = lector["Nombre"].ToString();
                    admin.Apellido = lector["Apellido"].ToString();
                    admin.Documento = Convert.ToInt32(lector["NroDoc"].ToString());
                    admin.UsuarioNombre = lector["NombreLogueo"].ToString();
                    admin.Contrasenia = lector["Contrasenia"].ToString();

                }
                return admin;
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

       public static int Eliminar(int documento)
    {
        SqlConnection conexion = new SqlConnection(Conexion.CnnString);
        SqlCommand comando = new SqlCommand("", conexion);
        comando.CommandType = CommandType.StoredProcedure;

        //SqlParameter parametroRut = new SqlParameter("@", );
        //comando.Parameters.Add(parametroRut);

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

       public static int Redireccionar (string username,string pass)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("Redireccionar", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroNomLog = new SqlParameter ("'"+"@NombreLogueo"+"'", username);
            SqlParameter parametroPassword = new SqlParameter("'" + "@Contrasenia" + "'", pass);

            comando.Parameters.Add(parametroNomLog);
            comando.Parameters.Add(parametroPassword);

            try
            {
                conexion.Open();
                int resultado =comando.ExecuteNonQuery();
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
