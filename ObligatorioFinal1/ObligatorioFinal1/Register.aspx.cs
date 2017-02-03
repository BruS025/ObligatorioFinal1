using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;

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
                Response.Redirect("MantenimientoCrearPedido.aspx");
            }
            catch (Exception ex)
            {

                lbError.Text = ex.Message;
            }         
        }

    }
}