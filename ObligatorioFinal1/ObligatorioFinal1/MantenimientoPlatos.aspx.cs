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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    List<Plato> listadoAdmin = new List<Plato>();
                    Plato cliente = new Plato(1234,1234,"Lasaña",1234,1);
                    Plato cliente2 = new Plato(1111,2222,"Ravioles",1234,1);

                    listadoAdmin.Add(cliente);
                    listadoAdmin.Add(cliente2);

                    GridPlatos.DataSource = listadoAdmin;
                    GridPlatos.DataBind();

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
            try
                {

                }

            catch
                {

                }
        }

        protected void GridPlatos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}