using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;
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
                    Plato cliente3 = new Plato(1111, 2222, "Ravioles", 1234, 1);
                    Plato cliente4 = new Plato(1111, 2222, "Ravioles", 1234, 1);
                    Plato cliente5 = new Plato(1111, 2222, "Ravioles", 1234, 1);
                    Plato cliente6 = new Plato(1111, 2222, "Ravioles", 1234, 1);
                    Plato cliente7 = new Plato(1111, 2222, "Ravioles", 1234, 1);
                    Plato cliente8 = new Plato(1111, 2222, "Ravioles", 1234, 1);
                    Plato cliente9 = new Plato(1111, 2222, "Ravioles", 1234, 1);
                    Plato cliente10 = new Plato(1111, 2222, "Ravioles", 1234, 1);
                    Plato cliente11 = new Plato(1111, 2222, "Ravioles", 1234, 1);

                    listadoAdmin.Add(cliente);
                    listadoAdmin.Add(cliente2);
                    listadoAdmin.Add(cliente3);
                    listadoAdmin.Add(cliente4);
                    listadoAdmin.Add(cliente5);
                    listadoAdmin.Add(cliente6);
                    listadoAdmin.Add(cliente7);
                    listadoAdmin.Add(cliente8);
                    listadoAdmin.Add(cliente9);
                    listadoAdmin.Add(cliente10);
                    listadoAdmin.Add(cliente11);

                    GridPlatos.DataSource = listadoAdmin;
                    GridPlatos.DataBind();

                    List<Casa> listadoCasas = new List<Casa>(LogicaCasa.Listar());

                    ddlPlatoBuscar.DataSource = listadoCasas;
                    ddlPlatoBuscar.DataBind();

                    ddlCasaModificar.DataSource = listadoCasas;
                    ddlCasaModificar.DataBind();

                    ddlCasasPlato.DataSource = listadoCasas;
                    ddlCasasPlato.DataBind();

                    //CargarGrilla();
                }

                catch (Exception ex)
                {
                    lbError.Text = ex.Message;
                }
            }
        }

        protected void GridPlatos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        // Cargar Grilla
        private void CargarGrilla()
        {
            try
            {

                List<Plato> listadoPlatos = LogicaPlato.Listar();

                GridPlatos.DataSource = null;

                if (listadoPlatos != null)
                {
                    if (listadoPlatos.Count > 0)
                    {
                        GridPlatos.Visible = true;
                        GridPlatos.DataSource = listadoPlatos;
                        GridPlatos.DataBind();
                    }

                    else
                    {
                        GridPlatos.Visible = false;
                        lbError.Text = "No existen platos registrados";
                    }

                }

                else
                {
                    GridPlatos.Visible = false;
                    lbError.Text = "No existen platos registrados";
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
                List<Plato> listadoPlatos = new List<Plato>();

                if (id.Text != "")
                {

                    Plato plato = LogicaPlato.Buscar(Convert.ToInt32(id.Text));

                    if (plato.Id == 0)
                    {
                        CargarGrilla();
                        throw new Exception("ERROR: No se encontraron coinciencias");
                    }

                    listadoPlatos.Add(plato);

                    GridPlatos.DataSource = null;

                    if (listadoPlatos != null)
                    {
                        if (listadoPlatos.Count > 0)
                        {
                            GridPlatos.Visible = true;
                            GridPlatos.DataSource = listadoPlatos;
                            GridPlatos.DataBind();
                        }
                    }

                    else
                    {
                        GridPlatos.Visible = false;
                        lbError.Text = "No existen platos registrados.";
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

    // Boton seleccionar
    protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            try
            {
                btModificar.Visible = true;
                foto.Visible = true;

            }

            catch (Exception ex)
            {

                lbError.Text = (ex.Message);
            }
        }

        // Agregar un plato
        protected void btAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
                {
                    String nombreOriginal = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    String[] extensionFoto = nombreOriginal.Split('.');
                    string nombreFoto = "1" + "." + extensionFoto[1]; // Sacar ultimo ID de foto en la bd para colocar como nombre del archivo

                    string SaveLocation = Server.MapPath("Imagenes") + "\\" + nombreFoto;
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(SaveLocation);
                        lbError.Text = ("Foto subida.");
                    }
                    catch (Exception ex)
                    {
                        lbError.Text = ("Error: " + ex.Message);
                    }
                }
                else
                {
                    lbError.Text = ("Seleccione una foto.");
                }
            }
            catch (Exception ex)
            {

                lbError.Text = (ex.Message);
            }

        }

        // Editar un plato
        protected void btGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if ((FileUpload2.PostedFile != null) && (FileUpload2.PostedFile.ContentLength > 0))
                {
                    String nombreOriginal = Path.GetFileName(FileUpload2.PostedFile.FileName);
                    String[] extensionFoto = nombreOriginal.Split('.');
                    string nombreFoto = "1" + "." + extensionFoto[1]; // Sacar ultimo ID de foto en la bd para colocar como nombre del archivo

                    string SaveLocation = Server.MapPath("Imagenes") + "\\" + nombreFoto;
                    try
                    {
                        FileUpload2.PostedFile.SaveAs(SaveLocation);
                        lbError.Text = ("Foto subida.");
                    }
                    catch (Exception ex)
                    {
                        lbError.Text = ("Error: " + ex.Message);
                    }
                }
                else
                {
                    lbError.Text = ("Seleccione una foto.");
                }
            }
            catch (Exception ex)
            {

                lbError.Text = (ex.Message);
            }
        }

        protected void GridCasas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                int resultado = 0;
                int IdEliminar = Convert.ToInt32(GridPlatos.Rows[e.RowIndex].Cells[1].Text);


                resultado = LogicaPlato.Eliminar(IdEliminar);

                if (resultado == 1) // ok
                {
                    lbError.Text = "Se ha eliminado el plato.";

                    if (modalNombrePlato.Text != null && modalNombrePlato.Text != "")
                    {
                        if (IdEliminar == Convert.ToInt32(modalNombrePlato.Text))
                        {
                           // modId.Text = "";
                            modalNombrePlato.Text = "";
                           // modDdl.SelectedIndex = 0;
                          //  lbError3.Text = "";
                            btModificar.Visible = false;
                        }
                    }

                    CargarGrilla();
                }

                else if (resultado == -1)
                {
                    lbError.Text = "No es posible eliminar el plato con pedidos asociados.";
                }

                else
                {
                    GridPlatos.Visible = false;
                    lbError.Text = "No existen platos registrados.";
                }

            }

            catch (Exception ex)
            {
                lbError.Text = ex.Message;
            }
        }

        protected void ddlPlatoBuscar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlCasasPlato_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void casaModificar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}