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

        <div class="col-md-2">
            <asp:Label ID="Label1" ForeColor="Black" runat="server" Height="34px" Text="Buscar una casa:" Font-Size="Large"></asp:Label>                      
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="rutVerificar" runat="server" Height="34px" Placeholder=" Rut"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:Button ID="btVerificar" CssClass="btn btn-md btn-primary" runat="server" Text="Buscar" Height="34px" OnClick="btVerificar_Click" />
        </div>

    </div>

    <div class="col-md-12" id="divCasa" runat="server" height="34px">

        <div class="col-md-2">
            <asp:TextBox ID="rut" runat="server"  Height="34px" Placeholder=" Rut" ></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="nombre" runat="server" Height="34px" Placeholder=" Nombre"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlEspecializacion" runat="server" AutoPostBack="True" Width="100%" Height="34px">
                <asp:ListItem Value="0">Pizzeria</asp:ListItem>
                <asp:ListItem Value="1">Parrillada</asp:ListItem>
                <asp:ListItem Value="2">Minutas</asp:ListItem>
                <asp:ListItem Value="3">Internacional</asp:ListItem>
                <asp:ListItem Value="4">Vegetariano</asp:ListItem>
            </asp:DropDownList>
        </div>
                       
        <div class="col-md-1">
            <asp:Button ID="btAgregar" CssClass="btn btn-md btn-primary" runat="server" Text="Agregar" Height="34px" OnClick="btAgregar_Click" />
        </div>

        <div class="col-md-1">
            <asp:Button ID="btModificar" CssClass="btn btn-md btn-primary" Visible="false" runat="server" Text="Guardar" Height="34px" OnClick="btModificar_Click" />
        </div>

        <div class="col-md-1">
            <asp:Button ID="btCancelar" CssClass="btn btn-md btn-primary" Visible="false" runat="server" Text="Cancelar" Height="34px" OnClick="btCancelar_Click" />
        </div>

        <br />
        <br />
        <br />

        <div class="col-md-12">
            <asp:GridView ID="GridCasas" runat="server" AllowPaging="true" OnPageIndexChanging="GridCasas_PageIndexChanging"        
                          AutoGenerateColumns="False" RowStyle-Height="34px" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
                          Visible="True" Width="100%" ShowFooter="true" ShowHeaderWhenEmpty="True" PageSize="10" Font-Size="Large" CaptionAlign="Top">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

            <asp:TemplateField HeaderStyle-BorderWidth="2px" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium" ControlStyle-CssClass="btn-primary btn-md" HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="btnModificar" CssClass="btn btn-md btn-primary" runat="server" CommandName="select" Text="Editar" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="RUT" HeaderText="RUT"/>
            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Nombre" HeaderText="Nombre"/>
            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Especializacion" HeaderText="Especializacion" />                                      

            <asp:TemplateField HeaderStyle-BorderWidth="2px" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium" ControlStyle-CssClass="btn-danger btn-danger btn-md" HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="btnEliminar" runat="server" CommandName="delete" Text="Eliminar" />
                </ItemTemplate>
            </asp:TemplateField> 

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
           <br />
           <p class="text-center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red"></asp:Label></p> 
       </div>

    </div>

</div>
</div>     

</asp:Content>
