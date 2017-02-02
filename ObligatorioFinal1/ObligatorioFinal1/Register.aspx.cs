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
                    // Chequear que el usuario no tiene una session abierta, si la tiene redirigir a pantalla next dependiendo el tipo de usuario
                    if (Session["Cliente"] == null)
                    {
                       
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

    }
}