using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;

namespace ObligatorioFinal1
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // TEST
            Usuario userTest = new Usuario("Rodrigo", "Antognazza", "12345678", 12345678, "Rodri");
            Session["Usuario"] = userTest;
            // FIN TEST

            Usuario user = new Usuario();

            if (Session["Usuario"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            else
            {
                user = (Usuario)Session["Usuario"];

                masterNombreUsuario.Text = user.Nombre;
            }




            /*
            if Session["Cliente"] != null
            if Session["Cliente"].count == 1
            {
            recorrer con foreach
            detectar cliente

            if cliente.role == admin
            { 
                activar menu admin / desactivar menu user

            else
            {
            desactivar menu admin / activar menu user
           
            {
            else 
            redirect Default
            trow new expection "Debe iniciar session"
            */
        }

        protected void btSalir_Click(object sender, EventArgs e)
        {
            Session["Cliente"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}