using EntidadesCompartidas;
using Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ObligatorioFinal1
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
            {
                List<Plato> listadoAdmin = new List<Plato>();
                Plato cliente = new Plato(1234, 1234, "Lasaña", 1234, 1);
                Plato cliente2 = new Plato(1111, 2222, "Ravioles", 1234, 1);

                listadoAdmin.Add(cliente);
                listadoAdmin.Add(cliente2);

                listadoPlatos.DataSource = listadoAdmin;
                listadoPlatos.DataBind();

                List<Especializacion> listadoEspecializaciones = new List<Especializacion>(LogicaEspecializacion.Listar());

                ddlEspecializacion.DataSource = listadoEspecializaciones;
                ddlEspecializacion.DataBind();

                List<Casa> listadoCasas = new List<Casa>(LogicaCasa.Listar());

                ddlCasas.DataSource = listadoCasas;
                ddlCasas.DataBind();

                }


            catch (Exception ex)
            {
                lbError.Text = ex.Message;
            }
         }
        }

        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {

        }

        protected void btAgregar_Click(object sender, EventArgs e)
        {

        }

        protected void btVender_Click(object sender, EventArgs e)
        {

        }

        protected void btQuitar_Click(object sender, EventArgs e)
        {

        }

        protected void GridPlatos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void ddlEspecializacion_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlCasas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridPlatos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridPlatos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void btnSeleccionar_Click1(object sender, EventArgs e)
        {

        }

        protected void btQuitarCarrito_Click(object sender, EventArgs e)
        {

        }

        protected void btAgregarCarrito_Click(object sender, EventArgs e)
        {

        }
    }
}