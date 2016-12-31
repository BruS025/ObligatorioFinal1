using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ObligatorioFinal1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    if(ddlTipoUsuario.SelectedIndex == 0)
                    {
                        cargoDiv.Visible = false;
                    }

                    else
                    {
                        cargoDiv.Visible = true;
                    }
                    
                }

                catch
                {

                }
            }
        }

        protected void btRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ddlTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlTipoUsuario.SelectedIndex == 0)
                {
                    // Parte Admin
                    cargoDiv.Visible = false;

                    // Parte Usuario
                    usuarioDiv.Visible = true;
                }

                else
                {
                    // Parte Admin
                    cargoDiv.Visible = true;

                    // Parte usuario
                    usuarioDiv.Visible = false;
                }

            }

            catch
            {

            }
        }
    }
}