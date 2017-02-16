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
    public partial class Default : System.Web.UI.Page
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

        // Iniciar login
        protected void entrar_Click(object sender, EventArgs e)
        {
            try
            {
                // Agregar excepciones
                // 1 - Vacio
                // 2 - Tipo
                // 3 - Minimo
                // 4 - Maximo

                // Consultar si existe usuario y si la contraseña es correcta

                Usuario cliente = new Usuario();
                cliente = (Usuario)Session["Usuario"];

                string UsuarioNombre = inputEmail.Value;
                string PassUsuario = inputPassword.Value;

                int resultado = LogicaUsuario.Redireccionar(UsuarioNombre, PassUsuario);

                lbError.Text = resultado.ToString();


               /* if (cliente is Usuario)
                    {
                        Response.Redirect("MantenimientoCrearPedido.aspx");
                    }

                else if (cliente is Administrador)
                    {
                        Response.Redirect("BienvenidaAdministrador.aspx");
                    }   */            
            }

            catch (Exception ex)
            {
                lbError.Text = ex.Message;
            }
        }

        // Redirigir usuario a pagina de registro
        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}