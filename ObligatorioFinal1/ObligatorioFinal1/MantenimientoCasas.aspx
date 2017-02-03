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
            <asp:Label ID="Label1" ForeColor="Black" runat="server" Height="34px" Text="RUT casa:" Font-Size="Large"></asp:Label>                      
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="rutVerificar" runat="server" Height="34px" ></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:Button ID="btVerificar" CssClass="btn btn-default" runat="server" Text="Verificar" Height="34px" OnClick="btVerificar_Click" />
        </div>

    </div>

    <div class="col-md-12" id="divCasa" runat="server" height="34px">

        <div class="col-md-2">
            <asp:TextBox ID="rut" runat="server"  Height="34px" Enabled="false" Placeholder="RUT" ></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="nombre" runat="server" Height="34px" Enabled="false" Placeholder="Nombre"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlEspecializacion" runat="server" Enabled="false" AutoPostBack="True" Height="34px">
                <asp:ListItem Value="0">Pizzeria</asp:ListItem>
                <asp:ListItem Value="1">Parrillada</asp:ListItem>
                <asp:ListItem Value="2">Minutas</asp:ListItem>
                <asp:ListItem Value="3">Internacional</asp:ListItem>
                <asp:ListItem Value="4">Vegetariano</asp:ListItem>
            </asp:DropDownList>
        </div>
                       
        <div class="col-md-1">
            <asp:Button ID="btAgregar" CssClass="btn btn-default" runat="server" Text="Agregar" Height="34px" OnClick="btAgregar_Click" />
        </div>

        <div class="col-md-1">
            <asp:Button ID="btModificar" CssClass="btn btn-default" runat="server" Text="Modificar" Height="34px" />
        </div>

        <div class="col-md-1">
            <asp:Button ID="btCancelar" CssClass="btn btn-default" runat="server" Text="Cancelar" Height="34px" />
        </div>

        <div class="col-md-1">
            <asp:Button ID="btEliminar" CssClass="btn btn-default" runat="server" Text="Eliminar" Height="34px" />
        </div>

        <div class="col-md-12">
            <asp:GridView ID="GridCasas" runat="server" AllowPaging="true" OnPageIndexChanging="GridCasas_PageIndexChanging"        
        AutoGenerateColumns="False" RowStyle-Height="34px" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
        Visible="True" Width="98%" ShowFooter="False" ShowHeaderWhenEmpty="True" PageSize="10" Font-Size="Large" CaptionAlign="Top">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="RUT" HeaderText="RUT"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Nombre" HeaderText="Nombre"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Especializacion" HeaderText="Especializacion" />                                      

          </Columns>

                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Red" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                    <PagerStyle BackColor="#B50000" ForeColor="White" />

        </asp:GridView>
       </div>

        <p class="text-center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red"></asp:Label></p> 

    </div>

</div>
</div>     

</asp:Content>
