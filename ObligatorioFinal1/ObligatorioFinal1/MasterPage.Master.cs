using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ObligatorioFinal1
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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