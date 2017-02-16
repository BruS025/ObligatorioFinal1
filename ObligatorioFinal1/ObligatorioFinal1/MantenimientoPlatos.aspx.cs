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
        // Page load plato
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    Usuario user = new Usuario();

                    if (Session["Usuario"] == null)
                    {
                        //Response.Redirect("Default.aspx");
                    }

                    else
                    {
                        user = (Usuario)Session["Usuario"];

                        if (user is Cliente)
                        {
                            Response.Redirect("MantenimientoRealizarPedido.aspx");
                        }

                        else if (user is Administrador)
                        {
                            string foto = "";
                            Session["Foto"] = foto;
                        }
                    }

                    ActualizarCasas();
                    CargarGrilla();

                }

                catch (Exception ex)
                {
                    lbError.Text = ex.Message;
                }
            }
        }

        // Paginado grilla platos
        protected void GridPlatos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridPlatos.PageIndex = e.NewPageIndex;
            CargarGrilla();
        }

        // Actualizar DDL casas
        private void ActualizarCasas()
        {
            List<Casa> listadoCasas = new List<Casa>(LogicaCasa.ListarTodas());

            ddlPlatoBuscar.DataSource = listadoCasas;
            ddlPlatoBuscar.DataBind();

            ddlCasaModificar.DataSource = listadoCasas;
            ddlCasaModificar.DataBind();

            ddlCasasPlato.DataSource = listadoCasas;
            ddlCasasPlato.DataBind();
        }

        // Cargar Grilla
        private void CargarGrilla()
        {
            try
            {

                List<Plato> listadoPlatos = LogicaPlato.Listar(Convert.ToInt64(ddlCasasPlato.SelectedValue));

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
            catch (Exception ex)
            {
                lbError.Text = ex.Message; //"Ha ocurrido un error";
            }
        }

        // Modificar plato
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
                string nombreFoto = "";

                if (id.Text == "")
                {
                    lbError2.Text = ("ERROR: Ingrese un Rut.");
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");

                }

                if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
                {
                    String nombreOriginal = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    String[] extensionFoto = nombreOriginal.Split('.');
                    nombreFoto = "1" + "." + extensionFoto[1]; // Sacar ultimo ID de foto en la bd para colocar como nombre del archivo. Hacer HasH

                    string SaveLocation = Server.MapPath("Imagenes") + "\\" + nombreFoto;

                    FileUpload1.PostedFile.SaveAs(SaveLocation);                    
                }

                else
                {
                    lbError2.Text = ("Seleccione una foto..");
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");
                }

                Plato nuevoPlato = new Plato();

                nuevoPlato.Id = 0;
                nuevoPlato.Nombre = nombrePlato.Text;
                nuevoPlato.Precio = Convert.ToDouble(precioPlato.Text);
                nuevoPlato.Foto = nombreFoto;

                int resultado = LogicaPlato.Agregar(nuevoPlato, Convert.ToInt64(ddlCasasPlato.SelectedValue));

                if (resultado == 2)
                {
                    lbError.Text = "Se ha agregado plato satisfactoriamente..";
                    CargarGrilla();

                    id.Text = "";
                    nombrePlato.Text = "";
                    precioPlato.Text = "";
                    lbError2.Text = "";

                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi4();</script>");

                }

                else if (resultado == 1)
                {
                    lbError2.Text = " El Plato ingresado ya se encuentra registrado.";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");
                }

                else
                {
                    lbError2.Text = "No se ha agregado el Plato..";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");

                }
            }

            catch (Exception ex)
            {
                lbError2.Text = ex.Message;
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");
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

        // Eliminar un plato
        protected void GridPlatos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                int resultado = 0;
                int IdEliminar = Convert.ToInt32(GridPlatos.Rows[e.RowIndex].Cells[1].Text);
                long rut = Convert.ToInt64(ddlPlatoBuscar.SelectedValue);              

                resultado = LogicaPlato.Eliminar(IdEliminar, rut);

                if (resultado == 1) // ok
                {
                    lbError.Text = "Se ha eliminado el plato.";

                    /* Control para eliminar EDICION del plalto que se esta eliminando*/
                    if (idModificar.Text != null && idModificar.Text != "")
                    {
                        if (Convert.ToInt32(idModificar.Text) == IdEliminar)
                        {
                            idModificar.Text = "";
                            nombreModificar.Text = "";
                            ddlCasaModificar.SelectedIndex = 0;
                            precioModificar.Text = "";
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

        // DDL Buscar
        protected void ddlPlatoBuscar_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                List<Plato> listadoCasa = LogicaPlato.Listar(Convert.ToInt64(ddlPlatoBuscar.SelectedValue));

                GridPlatos.DataSource = null;

                if (listadoCasa != null)
                {
                    if (listadoCasa.Count > 0)
                    {
                        GridPlatos.Visible = true;
                        GridPlatos.DataSource = listadoCasa;
                        GridPlatos.DataBind();
                        lbError.Text = "";
                    }

                    else
                    {
                        GridPlatos.Visible = false;
                        GridPlatos.DataSource = listadoCasa;
                        GridPlatos.DataBind();
                        lbError.Text = "No existen platos registrados";
                    }

                }

                else
                {
                    GridPlatos.Visible = false;
                    GridPlatos.DataSource = listadoCasa;
                    GridPlatos.DataBind();
                    lbError.Text = "No existen platos registrados";
                }
            }

            catch (Exception ex)
            {
                lbError.Text = "Error :" + ex.Message;
            }
        }

        // DDL agregar
        protected void ddlCasasPlato_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Error en js
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi();</script>");
        }

        protected void casaModificar_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Plato plato = new Plato();

                
                plato.Id = Convert.ToInt32(idModificar.Text);
                plato.Nombre = nombreModificar.Text;
                plato.Precio = Convert.ToDouble(precioModificar.Text);
                long rut = Convert.ToInt64(ddlPlatoBuscar.SelectedValue);
                

                if (nombreModificar.Text == "")
                {
                    lbError.Text = ("ERROR: Ingrese un Plato.");
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi2();</script>");
                }

                int resultado = LogicaPlato.Modificar(plato, rut);

                if (resultado == 1)
                {
                    lbError.Text = "Plato Modificado";
                    CargarGrilla();

                    //btAgregarModal.Visible = true;
                    //btGuardarModal.Visible = false;
                    btVerificar.Visible = false;
                    
                    // Reseteamos campos
                    id.Text = "";
                    nombrePlato.Text = "";
                    

                }
                else
                {
                    lbError.Text = "No se pudo modificar";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi2();</script>");
                }
            }

            catch (Exception ex)
            {
                lbError.Text = ex.Message;
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi2();</script>");
            }
        }
          
        // Ver foto
		protected void verFotoClick(object sender, EventArgs e)
        {
            string foto = "";
            foto = (string)(Session["Foto"]);

            fotoMostrar.Src = "/ImagenesPlato/" + foto; 
            fotoMostrar.DataBind();
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi3();</script>");
        }

        override protected void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        private void InitializeComponent()
        {
            this.foto.ServerClick += new System.EventHandler(this.verFotoClick);
            this.Load += new System.EventHandler(this.Page_Load);

        }

        // Seleccionar item
        protected void GridPlatos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

            idModificar.Text = this.GridPlatos.Rows[e.NewSelectedIndex].Cells[1].Text;
            nombreModificar.Text = this.GridPlatos.Rows[e.NewSelectedIndex].Cells[2].Text;
            precioModificar.Text = this.GridPlatos.Rows[e.NewSelectedIndex].Cells[3].Text;
            Session["Foto"] = this.GridPlatos.Rows[e.NewSelectedIndex].Cells[4].Text;

        }

        // DDL modificar
        protected void ddlCasaModificar_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "<script>javascript: vpi2();</script>");
        }

    }
}