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

        private void CargarGrilla()
        {
            try
            {

                List<Administrador> listadoUsuario = LogicaUsuario.Listar();

                GridAdmins.DataSource = null;

                if (listadoUsuario != null)
                {
                    if (listadoUsuario.Count > 0)
                    {
                        GridAdmins.Visible = true;
                        GridAdmins.DataSource = listadoUsuario;
                        GridAdmins.DataBind();
                    }

                    else
                    {
                        GridAdmins.Visible = false;
                        lbError.Text = "No existen usuarios registrados";
                    }

                }

                else
                {
                    GridAdmins.Visible = false;
                    lbError.Text = "No existen usuarios registrados";
                }
            }
            catch (Exception)
            {
                lbError.Text = "Ha ocurrido un error";
            }
        }

        protected void btVerificar_Click(object sender, EventArgs e)
        {
            try
            {
                List<Administrador> listadoUsuario = new List<Administrador>();

                if (id.Text != "")
                {

                    Administrador admin = LogicaUsuario.Buscar(Convert.ToInt32(id.Text));

                    if (admin.Documento == 0)
                    {
                        CargarGrilla();
                        throw new Exception("ERROR: No se encontraron coinciencias");
                    }

                    listadoUsuario.Add(admin);

                    GridAdmins.DataSource = null;

                    if (listadoUsuario != null)
                    {
                        if (listadoUsuario.Count > 0)
                        {
                            GridAdmins.Visible = true;
                            GridAdmins.DataSource = listadoUsuario;
                            GridAdmins.DataBind();
                        }
                    }

                    else
                    {
                        GridAdmins.Visible = false;
                        lbError.Text = "No existen Usuarios registrados.";
                    }
                }
                else
                {
                    CargarGrilla();
                }

            }
            catch (Exception ex)
            {
                lbError.Text = ex.Message;
            }
        }

        protected void GridAdmins_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridAdmins.PageIndex = e.NewPageIndex;
            CargarGrilla();
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
          /*  try
            {

                int resultado = 0;
                int docEliminar = Convert.ToInt32(GridAdmins.Rows[e.RowIndex].Cells[1].Text);


                resultado = LogicaUsuario.Eliminar(docEliminar);
            
               /  if (resultado == 1) // ok
                {
                    lbError.Text = "Se ha eliminado el usuario.";

                   if (modRut.Text != null && modRut.Text != "")
                    {
                        if (rutEliminar == Convert.ToInt64(modRut.Text))
                        {
                            modRut.Text = "";
                            modNombre.Text = "";
                            modDdl.SelectedIndex = 0;
                            lbError3.Text = "";
                            btModificar.Visible = false;
                        }
                    }

                    CargarGrilla();
                }
                
                else if (resultado == -1)
                {
                    lbError.Text = "No es posible eliminar el usuario.";
                }

                else
                {
                    GridAdmins.Visible = false;
                    lbError.Text = "No existen usuarios registrados.";
                }

            }

            catch (Exception ex)
            {
                lbError.Text = ex.Message;
            }
    */
        }

        protected void GridAdmins_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            nombreAdmin.Text = this.GridAdmins.Rows[e.NewSelectedIndex].Cells[1].Text;
            nombreAdmin.Text = this.GridAdmins.Rows[e.NewSelectedIndex].Cells[2].Text;
           // ddlCargo.SelectedIndex = 
        }

        protected void ddlCargo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void editarDdl_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlListar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlListar_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}