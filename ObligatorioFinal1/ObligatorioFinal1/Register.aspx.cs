using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

namespace ObligatorioFinal1
{
    public partial class Register : System.Web.UI.Page
    {
        // Cargar pagina
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    // Chequear que el usuario no tiene una session abierta, si la tiene redirigir a pantalla next dependiendo el tipo de usuario
                    if (Session["Usuario"] != null)
                    {
                        Usuario cliente = new Usuario();
                        cliente = (Usuario)Session["Usuario"];

                        if (cliente is Usuario)
                        {
                            Response.Redirect("MantenimientoCrearPedido.aspx");
                        }

                        else if (cliente is Administrador)
                        {
                            Response.Redirect("BienvenidaAdministrador.aspx");
                        }
                    }
                }

                catch (Exception ex)
                {
                    lbError.Text = ex.Message;
                }
            }
        }

        // Registrar un cliente
        protected void btRegister_Click(object sender, EventArgs e)
        {
            try
            {
                Cliente registrar = new Cliente();

                if (inputPassword.Value == inputPasswordRepeat.Value)//Verificamos error en la contraseña
                {
                    registrar.Nombre = inputEmail.Value;
                    registrar.Apellido = "AgregarPrueba2";
                    byte[] stringAByte = System.Text.ASCIIEncoding.ASCII.GetBytes(inputPassword.Value);
                    string contrasenia = Convert.ToBase64String(stringAByte);

                    registrar.Contrasenia = contrasenia;
                    registrar.Documento = Convert.ToInt32(inputDocumento.Value);
                    registrar.UsuarioNombre = inputUsername.Value;
                    registrar.Tarjeta = Convert.ToInt64(inputTarjeta.Value);
                    registrar.Calle = "AgregarPrueba2";
                    registrar.Puerta = "14142";

                    int resultado = LogicaUsuario.Agregar(registrar);
                    //-1 doc usado
                    //-2 nomlog usado
                    // 2 se agrego

                    //Problema al devolver errores de la bd (agrega bien de bien)


                    lbError.Text = resultado.ToString();
                }
                else
                {
                    lbError.Text = "La contraseña debe coicidir".ToString();
                }

                // Excepciones verificar
                // Agregar nuevo cliente (verificaciones bd) , si ya existe error

                //Response.Redirect("MantenimientoCrearPedido.aspx");
            }
            catch (Exception ex)
            {

                lbError.Text = ex.Message;
            }         
        }

    }
}