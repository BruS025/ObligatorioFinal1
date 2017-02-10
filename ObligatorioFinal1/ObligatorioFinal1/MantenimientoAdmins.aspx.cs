using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;
using System.Web.UI.HtmlControls;
using System.IO;

namespace ObligatorioFinal1
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    // TEST
                    List<Administrador> listadoAdmin = new List<Administrador>();
                    Administrador cliente = new Administrador("Rodri","Antonazza","12341234",12341234,"ro","Admin");
                    Administrador cliente2 = new Administrador("Rodri2", "Antonazza2", "1231231", 12341245, "ro2", "Admin2");

                    listadoAdmin.Add(cliente);
                    listadoAdmin.Add(cliente2);

                    GridAdmins.DataSource = listadoAdmin;
                    GridAdmins.DataBind();
                    // TEST

                    //CargarGrilla();
                }

                catch (Exception ex)
                {
                    lbError.Text = ex.Message;
                }
            }
        }

        protected void btVerificar_Click(object sender, EventArgs e)
        {

        }

        protected void GridAdmins_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btGuardarModal_Click(object sender, EventArgs e)
        {

        }

        protected void btAgregarModal_Click(object sender, EventArgs e)
        {

        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            try
            {
                btModificarModal.Visible = true;

            }

            catch (Exception ex)
            {

                lbError.Text = (ex.Message);
            }
        }

        protected void GridAdmins_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridAdmins_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void ddlCargo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void editarDdl_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}