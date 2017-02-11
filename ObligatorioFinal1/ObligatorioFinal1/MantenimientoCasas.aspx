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
            <asp:DropDownList ID="ddlBuscar" AutoPostBack="true" runat="server" Height="34px" DataTextField="Tipo" DataValueField="IdEspe" OnSelectedIndexChanged="ddlBuscar_SelectedIndexChanged"></asp:DropDownList>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="rutVerificar" runat="server" Height="34px" MaxLength="16" Placeholder=" Rut"></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:Button ID="btVerificar" CssClass="btn btn-md btn-primary" runat="server" Text="Buscar" Height="34px" OnClick="btVerificar_Click" />
        </div>

    </div>  
        
    <br />
    <br /> 

    <div class="col-md-12" id="divCasa" runat="server" height="34px">                      

         <div class="col-md-12" runat="server">
            <div class="col-md-2" runat="server">
                <button type="button" class="btn-md btn-primary" data-toggle="modal" data-target="#agregarModal" data-whatever="Agregar una casa"><span aria-hidden="true" class="glyphicon glyphicon-plus"></span> Agregar</button>
            </div>

            <div class="col-md-2" runat="server">
                <button type="button" visible="false" id="btModificar" runat="server" class="btn-md btn-success" data-toggle="modal" data-target="#editarModal" data-whatever="Editar casa"><span aria-hidden="true" class="glyphicon glyphicon-pencil"></span> Editar</button>
            </div>
        </div>

        <br />
        <br />

        <div class="col-md-12">
            <asp:GridView ID="GridCasas" runat="server" AllowPaging="true" OnPageIndexChanging="GridCasas_PageIndexChanging"        
                          AutoGenerateColumns="False" RowStyle-Height="34px" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
                          Visible="True" Width="100%" ShowFooter="false" ShowHeaderWhenEmpty="True" PageSize="10" Font-Size="Large" CaptionAlign="Top" 
                          HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" PagerSettings-Mode="NextPrevious" OnRowDeleting="GridCasas_RowDeleting" OnSelectedIndexChanging="GridCasas_SelectedIndexChanging">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

           <asp:TemplateField HeaderStyle-BorderWidth="2px" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium" ControlStyle-CssClass="btn-primary btn-md" HeaderText="Editar">
                <ItemTemplate>

                <asp:LinkButton ID="btnSeleccionar" runat="server" OnClick="btnSeleccionar_Click" CommandName="select" CssClass="btn btn-md btn-danger" ForeColor="Black" BackColor="Transparent">
                    <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                </asp:LinkButton>
         
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="RUT" HeaderText="RUT"/>
            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Nombre" HeaderText="Nombre"/>                                     

             <asp:TemplateField HeaderStyle-BorderWidth="2px" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium" ControlStyle-CssClass="btn-danger btn-danger btn-md" HeaderText="Eliminar">
                <ItemTemplate>

                    <asp:LinkButton ID="btEliminar" runat="server" CommandName="delete" CssClass="btn btn-md btn-danger" ForeColor="Black" BackColor="Transparent">
                        <span aria-hidden="true" class="glyphicon glyphicon-remove-circle"></span>
                    </asp:LinkButton>

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
           <br />
       </div>

    </div>
</div>    
</div>



<div class="modal fade" id="agregarModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" runat="server"><asp:Label ID="Label2" runat="server" Text="Agregar una casa"></asp:Label></h4>
      </div>
             <div class="form-group" >
            <br />

           <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Rut de la casa:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="rutCasa" MaxLength="16" runat="server" Height="34px" Placeholder=" Rut"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Nombre de la casa:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="nombreCasa" runat="server" Height="34px" Placeholder=" Nombre"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

             <div class="col-md-12">
                <div class="col-md-5">                  
                    <label for="message-text" class="control-label">Especializacion de la casa:</label>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlEspecializacionAdd" AutoPostBack="true" runat="server" Height="34px" DataTextField="Tipo" DataValueField="IdEspe" OnSelectedIndexChanged="ddlEspecializacionAdd_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
               </div>

              <br />
              <br />

       <div class="col-md-12">
           <br />
           <br />
           <p class="text-center"><asp:Label ID="lbError2" runat="server" Text="" ForeColor="Red"></asp:Label></p> 
       </div>

            </div> 
      <div class="modal-footer">                       
              <asp:Button ID="btAgregarModal" runat="server" CssClass="btn-md btn-success" OnClick="btAgregar_Click" Text="Guardar" />   
      </div>
    </div>
  </div>
</div>
 
<div class="modal fade" id="editarModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="H1" runat="server"><asp:Label ID="modTitulo" runat="server" Text="Editar una casa"></asp:Label></h4>
      </div>
      <div class="modal-body">      
          <div class="form-group" >

           <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Rut de la casa:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="modRut" MaxLength="16" runat="server" Height="34px" Placeholder=" Rut"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Nombre de la casa:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="modNombre" runat="server" Height="34px" Placeholder=" Nombre"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

             <div class="col-md-12">
                <div class="col-md-5">                  
                    <label for="message-text" class="control-label">Especializacion de la casa:</label>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="modDdl" runat="server" Height="34px" DataTextField="Tipo" DataValueField="IdEspe" OnSelectedIndexChanged="modDdl_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
               </div>

              <br />
            </div>

       <div class="col-md-12">
           <br />
           <br />
           <p class="text-center"><asp:Label ID="lbError3" runat="server" Text="" ForeColor="Red"></asp:Label></p> 
           <br />
       </div>

      </div>
      <div class="modal-footer">                       
              <asp:Button ID="btGuardarModal" runat="server" CssClass="btn-md btn-success" OnClick="btModificar_Click" Text="Guardar" />   
      </div>
    </div>
  </div>
</div>

 <script>

     function vpi() { $('#agregarModal').modal('show') }
     function vpi2() { $('#editarModal').modal('show') }

     $('#agregarModal').on('show.bs.modal', function (event) {
         var button = $(event.relatedTarget) // Button that triggered the modal
         var recipient = button.data('whatever')
         var modal = $(this)
     })

     $('#editarModal').on('show.bs.modal', function (event) {
         var button = $(event.relatedTarget) // Button that triggered the modal
         var recipient = button.data('whatever')
         var modal = $(this)
     })
         
   
 </script>

</asp:Content>
