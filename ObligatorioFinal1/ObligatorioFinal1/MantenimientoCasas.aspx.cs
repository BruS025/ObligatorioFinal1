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
    public partial class WebForm2 : System.Web.UI.Page
    {

        // Carga de pantalla
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {

                    List <Especializacion> listadoEspecializaciones = new List<Especializacion>(LogicaEspecializacion.Listar());

                    ddlEspecializacionAdd.DataSource = listadoEspecializaciones;
                    ddlEspecializacionAdd.DataBind();

                    ddlBuscar.DataSource = listadoEspecializaciones;
                    ddlBuscar.DataBind();

                    modDdl.DataSource = listadoEspecializaciones;
                    modDdl.DataBind();

                    // TEST

                    CargarGrilla();
                }

                catch (Exception ex)
                {
                     lbError.Text = ex.Message;  
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

                    else
                    {
                        GridCasas.Visible = false;
                        lbError.Text = "No existen casas registradas";
                    }

                }

                else
                {
                    GridCasas.Visible = false;
                    lbError.Text = "No existen casas registradas";
                }
            }
            catch (Exception ex)
            {
                lbError.Text = ex.Message; //"Ha ocurrido un error";
            }
        }

        // Buscar
        protected void btVerificar_Click(object sender, EventArgs e)
        {
            try
            {
                List<Casa> listadoCasa = new List<Casa>();

                if (rutVerificar.Text != "")
                {

                    Casa casa = LogicaCasa.Buscar(Convert.ToInt64(rutVerificar.Text));

                    if (casa.RUT == 0)
                    {
                        CargarGrilla();
                        throw new Exception("ERROR: No se encontraron coinciencias");
                    }

                    listadoCasa.Add(casa);

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
                        lbError.Text = "No existen casas registradas.";
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

        // Agregar
        protected void btAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (rutCasa.Text == "")
                {                  
                    lbError2.Text = ("ERROR: Ingrese un Rut.");
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");

                }
                
                Casa nuevaCasa = new Casa();

                nuevaCasa.RUT = Convert.ToInt64(rutCasa.Text);
                nuevaCasa.Nombre = nombreCasa.Text;
                nuevaCasa.Especializacion = Convert.ToInt32(ddlEspecializacionAdd.SelectedValue);

                int resultado = LogicaCasa.Agregar(nuevaCasa);

                if (resultado == 1)
                {
                    lbError.Text = "Casa agregada..";
                    CargarGrilla();

                    rutCasa.Text = "";
                    nombreCasa.Text = "";
                    ddlEspecializacionAdd.SelectedIndex = 0;
                    lbError2.Text = "";

                }

                else if (resultado == 1)
                {
                     lbError2.Text = " El Rut ingresado ya se encuentra registrado.";
                     ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");
                }

                else
                {
                    lbError2.Text = "No se ha agregado la Casa..";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");

                }

            }

            catch (Exception ex)
            {
                lbError2.Text = ex.Message;
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");
            }
        }

        protected void btModificar_Click(object sender, EventArgs e)
        {
            try
            {

                Casa casa = new Casa();
                casa.RUT = Convert.ToInt64(modRut.Text);
                casa.Nombre = modNombre.Text;
                casa.Especializacion = (modDdl.SelectedIndex + 1);


                if (modRut.Text == "")
                {
                    lbError3.Text = ("ERROR: Ingrese un Rut.");
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi2();</script>");
                }

                int resultado = LogicaCasa.Modificar(casa);

                if (resultado == 1)
                {
                    lbError.Text = "Casa Modificada";
                    CargarGrilla();

                    btAgregarModal.Visible = true;
                    btGuardarModal.Visible = false;
                    btVerificar.Visible = false;

                    // Reseteamos campos
                    modRut.Text = "";
                    modNombre.Text = "";
                    modDdl.SelectedIndex = 0;
                    
                }
                else
                {
                    lbError3.Text = "No se pudo modificar";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi2();</script>");
                }
            }

            catch (Exception ex)
            {
                 lbError3.Text = ex.Message;
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi2();</script>");
            }
        }

        // Seleccionar para editar
        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            try
            {
                btModificar.Visible = true;

            }

            catch (Exception ex)
            {

                lbError.Text = (ex.Message);
            }
        }

        // DDL modal
        protected void modDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi2();</script>");
        }

        // DDL modal
        protected void ddlEspecializacionAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");
        }

        // Filtrar por especializacion
        protected void ddlBuscar_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                List<Casa> listadoCasa = LogicaCasa.Listar(); //ListarEspecializacion(Convert.ToInt32(ddlBuscar.SelectedIndex));

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
                    GridCasas.DataBind();
                    lbError.Text = "No existen casas registradas";
                }
            }

            catch (Exception ex)
            {
                lbError.Text = "Error :" + ex.Message;
            }
        }

            // Borrar una casa
            protected void GridCasas_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
             try
             {
 
                 int resultado = 0;
                 long rutEliminar = Convert.ToInt64(GridCasas.Rows[e.RowIndex].Cells[1].Text);


                resultado = LogicaCasa.Eliminar(rutEliminar);
 
                if (resultado == 1) // ok
                {
                     lbError.Text = "Se ha eliminado casa.";

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
                   lbError.Text = "No es posible eliminar un cliente con ventas asociadas.";
               }

                else
                {
                    GridCasas.Visible = false;
                    lbError.Text = "No existen casas registradas.";
                }

            }
 
            catch (Exception ex)
            {
                 lbError.Text = ex.Message;
             }
            }
 
         // Cargar datos en editar
         protected void GridCasas_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
            {
             modRut.Text = this.GridCasas.Rows[e.NewSelectedIndex].Cells[1].Text;
             modNombre.Text = this.GridCasas.Rows[e.NewSelectedIndex].Cells[2].Text;
            modDdl.SelectedIndex = ddlBuscar.SelectedIndex;
            }
    }
}

