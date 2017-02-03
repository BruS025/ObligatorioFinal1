<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MantenimientoPlatos.aspx.cs" Inherits="ObligatorioFinal1.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <title>Mantenimiento de platos</title>

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
        <h2><strong>Mantenimiento de platos</strong></h2>
    </div>  
</header>

    <div class="container">
    <div class="row">

    <div class="col-md-12">

        <div class="col-md-2">
            <asp:Label ID="idV" ForeColor="Black" runat="server" Height="34px" Text="Id plato:" Font-Size="Large"></asp:Label>                      
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="id" runat="server"  Height="34px" Enabled="true" Placeholder="Id" ></asp:TextBox>
        </div>

        <div class="col-md-2">
                <asp:DropDownList ID="ddlCasasV" runat="server" AutoPostBack="True" Height="34px">
                <asp:ListItem Value="0">Casa0</asp:ListItem>
                <asp:ListItem Value="1">Casa1</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-md-2">
            <asp:Button ID="btVerificar" CssClass="btn btn-default" runat="server" Text="Verificar" OnClick="btVerificar_Click" Height="34px" />
        </div>

    </div>

    <div class="col-md-12" id="divPlato" runat="server" height="34px">

        <div class="col-md-2">
            <asp:TextBox ID="idPlato" runat="server"  Height="34px" Enabled="false" Placeholder="Id" ></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlCasasPlato" runat="server" Enabled="false" AutoPostBack="True" Height="34px">
            <asp:ListItem Value="0">1234567890</asp:ListItem>
            <asp:ListItem Value="1">Casa1</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="nombrePlato" runat="server" Height="34px" Enabled="false" Placeholder="Nombre"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="precioPlato" runat="server" Height="34px" Enabled="false" Placeholder="Precio"></asp:TextBox>
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

        <div class="col-md-4">
            <asp:Image ID="imgPlato" runat="server" />
        </div>

        <div class="col-md-12">
            <asp:GridView ID="GridPlatos" runat="server" AllowPaging="true" OnPageIndexChanging="GridPlatos_PageIndexChanging"        
        AutoGenerateColumns="False" RowStyle-Height="34px" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
        Visible="True" Width="98%" ShowFooter="False" ShowHeaderWhenEmpty="True" PageSize="10" Font-Size="Large" CaptionAlign="Top">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="ID" HeaderText="Id"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="CASA" HeaderText="Casa"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="NOMBRE" HeaderText="Nombre" />     
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="PRECIO" HeaderText="Precio" />                                   

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

    </div>

        <p class="text-center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red"></asp:Label></p> 

</div>
</div>     

</asp:Content>
