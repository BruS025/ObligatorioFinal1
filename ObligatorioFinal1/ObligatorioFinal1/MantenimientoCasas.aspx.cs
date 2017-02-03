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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    CargarGrilla();
                }

                catch (Exception ex)
                {
                   // lbResultado.Text = ex.Message;  RO FALTARIA DONDE PONER MENSAJES Y SI HAY NO LO ENCONTRE!!
                }

            }
        }

        // Index Grilla
        protected void GridCasas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridCasas.PageIndex = e.NewPageIndex;
            CargarGrilla();
        }

        // Cargar Grilla
        private void CargarGrilla()
        {
            try
            {

                List<Casa> listadoCasa = LogicaCasa.Listar();

                GridCasas.DataSource = null;

                if (listadoCasa != null)
                {
                    if (listadoCasa.Count > 0)
                    {
                        GridCasas.Visible = true;
                        GridCasas.DataSource = listadoCasa;
                        GridCasas.DataBind();
                    }

                }

                else
                {
                    GridCasas.Visible = false;
                   // lbResultado.Text = "No existen casas registradas";
                }
            }
            catch (Exception)
            {
               // lbResultado.Text = "Ha ocurrido un error";
            }
        }

    }
}