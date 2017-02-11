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

        <div class="col-md-3">
            <asp:Label ID="idV" ForeColor="Black" runat="server" Height="34px" Text="Documento del administrador:" Font-Size="Large"></asp:Label>                      
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlEspecializacion" AutoPostBack="true" runat="server" Height="34px" DataTextField="Tipo" DataValueField="IdEspe" OnSelectedIndexChanged="ddlEspecializacion_SelectedIndexChanged" ></asp:DropDownList>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlCasas" runat="server" AutoPostBack="True" Height="34px" DataTextField="Nombre" DataValueField="RUT" OnSelectedIndexChanged="ddlCasas_SelectedIndexChanged" ></asp:DropDownList>
        </div>

        <br />
        <br />

        <div class="col-md-12">
            <asp:GridView ID="GridPlatos" runat="server" AllowPaging="true" OnPageIndexChanging="GridPlatos_PageIndexChanging"        
                          AutoGenerateColumns="False" RowStyle-Height="34px" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
                          Visible="True" Width="100%" ShowFooter="False" ShowHeaderWhenEmpty="True" PageSize="10" Font-Size="Large" CaptionAlign="Top"
                          HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" PagerSettings-Mode="NextPrevious" OnRowDeleting="GridPlatos_RowDeleting" OnSelectedIndexChanging="GridPlatos_SelectedIndexChanging">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

            <asp:TemplateField HeaderStyle-BorderWidth="2px" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium" ControlStyle-CssClass="btn-primary btn-md" HeaderText="Editar">
                <ItemTemplate>

                <asp:LinkButton ID="btnSeleccionar" runat="server" OnClick="btnSeleccionar_Click1" CommandName="select" CssClass="btn btn-md btn-danger" ForeColor="Black" BackColor="Transparent">
                    <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                </asp:LinkButton>
         
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Id" HeaderText="Id"/>
            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Nombre" HeaderText="Nombre" />     
            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Precio" HeaderText="Precio" /> 

          </Columns>

          <FooterStyle BackColor="DarkTurquoise" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="DarkTurquoise" ForeColor="#333333" HorizontalAlign="Center" />
          <RowStyle BackColor="White" ForeColor="#333333" />
          <SelectedRowStyle BackColor="LightGray" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="DarkTurquoise" ForeColor="White" />

        </asp:GridView>
       </div>

        <div class="col-md-12">
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
