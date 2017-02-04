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
                    List<Casa> listadoAdmin = new List<Casa>();
                    Casa cliente = new Casa(1234,"La comilona", 500);
                    Casa cliente2 = new Casa(1555, "La come", 1500);

                    listadoAdmin.Add(cliente);
                    listadoAdmin.Add(cliente2);

                    GridCasas.DataSource = listadoAdmin;
                    GridCasas.DataBind();

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

                    Casa casa = LogicaCasa.Buscar(Convert.ToInt32(rutVerificar.Text));

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
                if (rut.Text == "")
                {
                    throw new Exception("ERROR: Ingrese un Rut.");
                }



                Casa nuevaCasa = new Casa();

                nuevaCasa.RUT = Convert.ToInt32(nuevaCasa.ToString());
                nuevaCasa.Nombre = nombre.Text;




                int resultado = LogicaCasa.Agregar(nuevaCasa);

                if (resultado == 1)
                {
                    lbError.Text = "Casa agregada..";
                    CargarGrilla();

                    // Resetear campos
                        //FALTA HACER

                }

                else if (resultado == -1)
                {
                     lbError.Text = " Poner mensaje";
                }

                else
                {
                    lbError.Text = "Poner mensaje..";

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

                Casa casa = new Casa();
                casa.RUT = Convert.ToInt32(Convert.ToInt32(rut.Text));
                casa.Nombre = nombre.Text;
                
                if (rut.Text == "")
                {
                    throw new Exception("ERROR: Ingrese un Rut.");
                }

                casa.RUT = Convert.ToInt32(rut.Text);



                int resultado = LogicaCasa.Modificar(casa);

                if (resultado == 1)
                {
                    lbError.Text = "Casa Modificada";
                    CargarGrilla();

                    btAgregar.Visible = true;
                    btModificar.Visible = false;
                    btVerificar.Visible = false;
                    btModificar.Visible = false;

                    // Reseteamos campos
                    rut.Text = "";
                    nombre.Text = "";
                    
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

        protected void btCancelar_Click(object sender, EventArgs e)
        {

        }

    }
}

