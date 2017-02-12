<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MantenimientoCrearPedido.aspx.cs" Inherits="ObligatorioFinal1.WebForm5" %>

<%@ Register Src="~/verPlato.ascx" TagPrefix="uc1" TagName="verPlato" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
    <title>Creacion de pedidos</title>

    <link rel="stylesheet" href = "css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/login.css"/>
    <link rel="shortcut icon" href="Imagenes/favicon.ico"/> 
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href = "css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/login.css"/>
    <link rel="shortcut icon" href="Imagenes/favicon.ico"/> 
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

<header>
    <div class="container">
        <h2><strong>Creacion de pedidos</strong></h2>
    </div>  
</header>

<div class="container">
    <div class="row">

    <div class="col-md-12">

        <div class="col-md-2">
            <asp:Label ID="idV" ForeColor="Black" runat="server" Height="34px" Text="Filtrar platos" Font-Size="Large"></asp:Label>                      
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlEspecializacion" AutoPostBack="true" runat="server" Height="34px" DataTextField="Tipo" DataValueField="IdEspe" OnSelectedIndexChanged="ddlEspecializacion_SelectedIndexChanged" ></asp:DropDownList>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlCasas" runat="server" AutoPostBack="True" Height="34px" DataTextField="Nombre" DataValueField="RUT" OnSelectedIndexChanged="ddlCasas_SelectedIndexChanged" ></asp:DropDownList>
        </div>

        <br />
        <br />
        <br />

        <div class="col-md-12">
            <div class="col-md-6">
                <asp:Label ID="Label1" ForeColor="Black" runat="server" Height="34px" Text="Listado de productos:" Font-Size="Large"></asp:Label>                      
            </div>

            <div class="col-md-6">
                <asp:Label ID="Label2" ForeColor="Black" runat="server" Height="34px" Text="Carrito:" Font-Size="Large" Visible="false"></asp:Label>                      
            </div>
        </div>

        <div class="col-md-12">
            <div class="col-md-6">
                <asp:ListBox ID="listadoPlatos" runat="server" DataTextField="Nombre" DataValueField="Id" Font-Size="Medium" AutoPostBack="true"></asp:ListBox>
            </div>

            <div class="col-md-6">
                <asp:ListBox ID="listadoCarrito" runat="server" DataTextField="Nombre" DataValueField="Id" Font-Size="Medium" AutoPostBack="true" Visible="false"></asp:ListBox>
            </div>           
       </div>

        <div class="col-md-12">

            <br />

            <div class="col-md-2" runat="server">
                <button type="button" visible="true" id="verPlatoSeleccionado" runat="server" class="btn-md btn-success" data-toggle="modal" data-target="#detallesPlato" data-whatever="Ver plato"><span aria-hidden="true" class="glyphicon glyphicon-eye-open"></span> Ver</button>
            </div>

            <asp:LinkButton ID="btQuitarCarrito" runat="server" OnClick="btQuitarCarrito_Click" CssClass="btn-primary btn-md" ForeColor="Black" BackColor="Transparent">
                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
            </asp:LinkButton>

            <asp:Label ID="btCantidad" runat="server" Text="0"></asp:Label>

            <asp:LinkButton ID="btAgregarCarrito" runat="server" OnClick="btAgregarCarrito_Click" CssClass="btn-primary btn-md" ForeColor="Black" BackColor="Transparent">
                    <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
            </asp:LinkButton>

        </div>

        <div class="col-md-12">
            <br />
            <asp:Button ID="btVender" CssClass="btn btn-md btn-primary" runat="server" Text="Comprar!" OnClick="btVender_Click" Height="34px" />
        </div>

        <div class="col-md-12">
           <br />
           <p class="text-center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red"></asp:Label></p> 
           <br />
       </div>

    </div>
    </div>
</div>     

<div class="modal fade" id="detallesPlato" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" runat="server"><asp:Label ID="Label3" runat="server" Text="PlatoNombre"></asp:Label></h4>
      </div>
      <div class="modal-body">      
          <div class="form-group" >

              <uc1:verPlato runat="server" ID="verPlato" />

            <br />
          </div>      
      </div>
    </div>
  </div>
</div>

 <script>

     $('#detallesPlato').on('show.bs.modal', function (event) {
         var button = $(event.relatedTarget) // Button that triggered the modal
         var recipient = button.data('whatever')
         var modal = $(this)
     })       
   
 </script>

</asp:Content>
