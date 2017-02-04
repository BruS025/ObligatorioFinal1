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

        // TEST

        override protected void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.Submit1.ServerClick += new System.EventHandler(this.Submit1_ServerClick);
            this.Load += new System.EventHandler(this.Page_Load);

        }

        private void Submit1_ServerClick(object sender, System.EventArgs e)
        {

            if ((File1.PostedFile != null) && (File1.PostedFile.ContentLength > 0))
            {
                string fn = Path.GetFileName(File1.PostedFile.FileName);
                string SaveLocation = Server.MapPath("Imagenes") + "\\" + fn;
                try
                {
                    File1.PostedFile.SaveAs(SaveLocation);
                    lbError.Text = ("The file has been uploaded.");
                }
                catch (Exception ex)
                {
                    lbError.Text = ("Error: " + ex.Message); 
                }
            }
            else
            {
                Response.Write("Please select a file to upload.");
            }
        }

    // TEST


}
}