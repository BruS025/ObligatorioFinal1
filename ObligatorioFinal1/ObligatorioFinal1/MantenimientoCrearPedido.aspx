<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MantenimientoCrearPedido.aspx.cs" Inherits="ObligatorioFinal1.WebForm5" %>

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
                <asp:Label ID="Label2" ForeColor="Black" runat="server" Height="34px" Text="Carrito:" Font-Size="Large"></asp:Label>                      
            </div>
        </div>

        <div class="col-md-12">
            <div class="col-md-6">
                <asp:ListBox ID="listadoPlatos" runat="server" DataTextField="Nombre" DataValueField="Id" Font-Size="Medium"></asp:ListBox>
            </div>

            <div class="col-md-6">
                <asp:ListBox ID="listadoCarrito" runat="server" DataTextField="Nombre" DataValueField="Id" Font-Size="Medium"></asp:ListBox>
            </div>           
       </div>

        <div class="col-md-12">
            <br />
            <asp:Button ID="btQuitar" CssClass="btn btn-default" runat="server" Text="-" OnClick="btQuitar_Click" Height="34px" />
            <asp:Label ID="btCantidad" runat="server" Text="0" Width="20px"></asp:Label>
            <asp:Button ID="btAgregar" CssClass="btn btn-default" runat="server" Text="+" OnClick="btAgregar_Click" Height="34px" />
        </div>

        <div class="col-md-12">
            <asp:Button ID="btVender" CssClass="btn btn-default" runat="server" Text="Comprar!" OnClick="btVender_Click" Height="34px" />
        </div>

        <div class="col-md-12">
           <br />
           <p class="text-center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red"></asp:Label></p> 
           <br />
       </div>

    </div>
    </div>
</div>     

</asp:Content>
