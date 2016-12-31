<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MantenimientoCasas.aspx.cs" Inherits="ObligatorioFinal1.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Mantenimiento de casas</title>

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
        <h2><strong>Mantenimiento de casas</strong></h2>
    </div>  
</header>

    <div class="container">
    <div class="row">

    <div class="col-md-12">

        <div class="col-md-1">
            <asp:Label ID="Label1" ForeColor="Black" runat="server" Height="34px" Text="RUT:" Font-Size="X-Large"></asp:Label>                      
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="rutVerificar" runat="server" Height="34px" ></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:Button ID="btVerificar" CssClass="btn btn-default" runat="server" Text="Verificar" Height="34px" />
        </div>

    </div>

    <div class="col-md-12" id="divCasa" runat="server">

        <div class="col-md-2">
            <asp:TextBox ID="rut" runat="server" Height="34px" Enabled="false" ></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="nombre" runat="server" Height="34px"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlEspecializacion" runat="server" AutoPostBack="True" Height="34px">
                <asp:ListItem Value="0">Cliente</asp:ListItem>
                <asp:ListItem Value="1">Administrador</asp:ListItem>
            </asp:DropDownList>
        </div>
                       
        <div class="col-md-1">
            <asp:Button ID="btAgregar" CssClass="btn btn-default" runat="server" Text="Agregar" Height="34px" />
        </div>

        <div class="col-md-1">
            <asp:Button ID="btModificar" CssClass="btn btn-default" runat="server" Text="Modificar" Height="34px" />
        </div>

        <div class="col-md-1">
            <asp:Button ID="btEliminar" CssClass="btn btn-default" runat="server" Text="Eliminar" Height="34px" />
        </div>

    </div>

</div>
</div>     

</asp:Content>
