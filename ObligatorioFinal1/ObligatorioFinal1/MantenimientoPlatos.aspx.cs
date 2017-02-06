﻿using System;
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

        protected void btVerificar_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
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
                        lbError2.Text = ("Foto subida.");
                    }
                    catch (Exception ex)
                    {
                        lbError2.Text = ("Error: " + ex.Message);
                    }
                }
                else
                {
                    lbError2.Text = ("Seleccione una foto.");
                }
            }
            catch (Exception ex)
            {

                lbError2.Text = (ex.Message);
            }
        }
    }
}