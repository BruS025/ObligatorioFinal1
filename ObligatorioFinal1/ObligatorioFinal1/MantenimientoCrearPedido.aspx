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
            <asp:DropDownList ID="ddlEspecializacion" runat="server" AutoPostBack="True" Height="34px">
            <asp:ListItem Value="0">Traer de BD</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlCasas" runat="server" AutoPostBack="True" Height="34px">
            <asp:ListItem Value="0">Traer de BD</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-md-12">
            <asp:GridView ID="GridPlatos" runat="server" AllowPaging="true" OnPageIndexChanging="GridPlatos_PageIndexChanging"        
        AutoGenerateColumns="False" RowStyle-Height="34px" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
        Visible="True" Width="98%" ShowFooter="False" ShowHeaderWhenEmpty="True" PageSize="10" Font-Size="Large" CaptionAlign="Top">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

              <asp:TemplateField HeaderStyle-BorderWidth="2px" ControlStyle-Font-Size="Small" ControlStyle-CssClass="btn btn-default" HeaderText="Actualizar">
                <ItemTemplate>
                    <asp:Button ID="btnSeleccionar" runat="server" CommandName="select" Text="Seleccionar" OnClick="btnSeleccionar_Click" />
                </ItemTemplate>
              </asp:TemplateField>

              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="ID" HeaderText="ID"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="DOC" HeaderText="Cliente"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="CASA" HeaderText="Casa" />     
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="PLATO" HeaderText="Plato" />   
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="CANTIDAD" HeaderText="Cantidad" />
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="FECHA" HeaderText="Fecha pedido" />                                  
              <asp:CheckBoxField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Small" DataField="ESTADO" HeaderText="Estado" />

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

        <div class="col-md-12">
            <asp:Button ID="btQuitar" CssClass="btn btn-default" runat="server" Text="-" OnClick="btQuitar_Click" Height="34px" />
            <asp:Label ID="btCantidad" runat="server" Text="0" Width="20px"></asp:Label>
            <asp:Button ID="btAgregar" CssClass="btn btn-default" runat="server" Text="+" OnClick="btAgregar_Click" Height="34px" />
        </div>

        <div class="col-md-12">
            <asp:Button ID="btVender" CssClass="btn btn-default" runat="server" Text="Comprar!" OnClick="btVender_Click" Height="34px" />
        </div>

    </div>
    </div>
</div>     

</asp:Content>
