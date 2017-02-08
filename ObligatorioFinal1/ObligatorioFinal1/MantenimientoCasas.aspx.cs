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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    // TEST
                    List<Casa> listadoAdmin = new List<Casa>();
                    Casa cliente = new Casa(1234, "La comilona", 500);
                    Casa cliente2 = new Casa(1555, "La come", 1500);

                    listadoAdmin.Add(cliente);
                    listadoAdmin.Add(cliente2);

                    GridCasas.DataSource = listadoAdmin;
                    GridCasas.DataBind();

                    ddlEspecializacionAdd.DataTextField = "Tipo";
                    ddlEspecializacionAdd.DataValueField = "IdEspe";
                    ddlEspecializacionAdd.DataSource = LogicaEspecializacion.Listar();
                    ddlEspecializacionAdd.DataBind();

                    // TEST

                    //CargarGrilla();
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

                }

                else
                {
                    GridCasas.Visible = false;
                    lbError.Text = "No existen casas registradas";
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

        protected void btAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (rutCasa.Text == "")
                {
                    throw new Exception("ERROR: Ingrese un Rut.");
                }
                
                Casa nuevaCasa = new Casa();

                nuevaCasa.RUT = Convert.ToInt64(rutCasa.Text);
                nuevaCasa.Nombre = nombreCasa.Text;
                nuevaCasa.Especializacion = Convert.ToInt32(ddlEspecializacionAdd.SelectedValue);
                //nuevaCasa.Especialidad = ddlEspecializacion.SelectedItem.ToString();

                int resultado = LogicaCasa.Agregar(nuevaCasa);

                if (resultado == 1)
                {
                    lbError.Text = "Casa agregada..";
                    CargarGrilla();

                    // Resetear campos
                        //FALTA HACER

                }

                else if (resultado == 1)
                {
                     lbError.Text = " El Rut ingresado ya se encuentra registrado.";
                }

                else
                {
                    lbError.Text = "No se ha agregado la Casa..";

                }

            }

            catch (Exception ex)
            {
                lbError.Text = ex.Message;
            }
        }

        protected void btModificar_Click(object sender, EventArgs e)
        {
            try
            {
                modDdl.DataTextField = "Tipo";
                modDdl.DataValueField = "IdEspe";
                modDdl.DataSource = LogicaEspecializacion.Listar();
                // modDdl.SelectedValue = TOMAR VALOR DE LA CASA SELECCIONADA
                modDdl.DataBind();

                Casa casa = new Casa();
                casa.RUT = Convert.ToInt32(Convert.ToInt32(modRut.Text));
                casa.Nombre = modNombre.Text;
                
                if (modRut.Text == "")
                {
                    throw new Exception("ERROR: Ingrese un Rut.");
                }

                casa.RUT = Convert.ToInt32(modRut.Text);



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
                    
                }
                else
                {
                    lbError.Text = "No se pudo modificar";
                }
            }

            catch (Exception ex)
            {
                 lbError.Text = ex.Message;
            }
        }

        protected void btEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btGuardar_Click(object sender, EventArgs e)
        {

        }

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
    }
}

