<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MantenimientoAdmins.aspx.cs" Inherits="ObligatorioFinal1.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Mantenimiento de administradores</title>

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
        <h2><strong>Mantenimiento de administradores</strong></h2>
    </div>  
</header>

    <div class="container">
    <div class="row">

    <div class="col-md-12">

        <div class="col-md-3">
            <asp:Label ID="idV" ForeColor="Black" runat="server" Height="34px" Text="Documento del administrador:" Font-Size="Large"></asp:Label>                      
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="id" runat="server"  Height="34px" Enabled="true" Placeholder=" Documento" ></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:Button ID="btVerificar" CssClass="btn btn-default" runat="server" Text="Verificar" OnClick="btVerificar_Click" Height="34px" />
        </div>

    </div>

    <div class="col-md-12" id="divAdmin" runat="server" height="34px">

        <div class="col-md-2">
            <asp:TextBox ID="docAdmin" runat="server"  Height="34px" Enabled="false" Placeholder=" Documento" ></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="userAdmin" runat="server" Height="34px" Enabled="false" Placeholder=" Usuario"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="nombreAdmin" runat="server" Height="34px" Enabled="false" Placeholder=" Nombre"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="apellidoAdmin" runat="server" Height="34px" Enabled="false" Placeholder=" Apellido"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlCargosAdmin" runat="server" Enabled="false" AutoPostBack="True" Height="34px">
            <asp:ListItem Value="0">Petero</asp:ListItem>
            <asp:ListItem Value="1">Senton</asp:ListItem>
            </asp:DropDownList>
        </div>
                       
        <div class="col-md-1">
            <asp:Button ID="btAgregar" CssClass="btn btn-default" runat="server" Text="Agregar" Height="34px" />
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
            <asp:GridView ID="GridAdmins" runat="server" AllowPaging="true" OnPageIndexChanging="GridAdmins_PageIndexChanging"        
        AutoGenerateColumns="False" RowStyle-Height="34px" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
        Visible="True" Width="98%" ShowFooter="False" ShowHeaderWhenEmpty="True" PageSize="10" Font-Size="Large" CaptionAlign="Top">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="Documento" HeaderText="Documento"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="UsuarioNombre" HeaderText="Usuario"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="NOMBRE" HeaderText="Nombre" />     
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="APELLIDO" HeaderText="Apellido" />   
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="CARGO" HeaderText="Cargo" />                                 

          </Columns>

                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="LightBlue" Font-Bold="True" ForeColor="White" />
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

    </div>

</div>
</div>     

</asp:Content>
