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
            <asp:Button ID="btVerificar" CssClass="btn btn-md btn-primary" runat="server" Text="Verificar" OnClick="btVerificar_Click" Height="34px" />
        </div>

    </div>

    <br />
    <br /> 

    <div class="col-md-12" id="divAdmin" runat="server" height="34px">
                       
        <div class="col-md-12" runat="server">
            <div class="col-md-2" runat="server">
                <button type="button" class="btn-md btn-primary" data-toggle="modal" data-target="#agregarModal" data-whatever="Agregar una casa"><span aria-hidden="true" class="glyphicon glyphicon-plus"></span> Agregar</button>
            </div>

            <div class="col-md-2" runat="server">
                <button type="button" visible="false" id="btModificarModal" runat="server" class="btn-md btn-success" data-toggle="modal" data-target="#editarModal" data-whatever="Editar casa"><span aria-hidden="true" class="glyphicon glyphicon-pencil"></span> Editar</button>
            </div>
        </div>

        <br />
        <br />

        <div class="col-md-12">
            <asp:GridView ID="GridAdmins" runat="server" AllowPaging="true" OnPageIndexChanging="GridAdmins_PageIndexChanging"        
        AutoGenerateColumns="False" RowStyle-Height="34px" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
                          Visible="True" Width="100%" ShowFooter="false" ShowHeaderWhenEmpty="True" PageSize="10" Font-Size="Large" CaptionAlign="Top" 
                          HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" PagerSettings-Mode="NextPrevious" OnRowDeleting="GridAdmins_RowDeleting" OnSelectedIndexChanging="GridAdmins_SelectedIndexChanging">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

           <asp:TemplateField HeaderStyle-BorderWidth="2px" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium" ControlStyle-CssClass="btn-primary btn-md" HeaderText="Editar">
                <ItemTemplate>

                <asp:LinkButton ID="btnSeleccionar" runat="server" OnClick="btnSeleccionar_Click" CommandName="select" CssClass="btn btn-md btn-danger" ForeColor="Black" BackColor="Transparent">
                    <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                </asp:LinkButton>
         
                </ItemTemplate>

            </asp:TemplateField>

              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Documento" HeaderText="Documento"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="UsuarioNombre" HeaderText="Usuario"/>
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="NOMBRE" HeaderText="Nombre" />     
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="APELLIDO" HeaderText="Apellido" />   
              <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="CARGO" HeaderText="Cargo" />                                 

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
        <h4 class="modal-title" runat="server"><asp:Label ID="Label2" runat="server" Text="Agregar administrador:"></asp:Label></h4>
      </div>
             <div class="form-group" >
            <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Documento del administrador:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="docAdmin" runat="server" Height="34px" Placeholder=" Documento"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

           <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Nombre del usuario:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="usAdmin" runat="server" Height="34px" Placeholder=" Usuario"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Nombre de administrador:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="nombreAdmin" runat="server" Height="34px" Placeholder=" Nombre"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Apellido de administrador:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="apellidoAdmin" runat="server" Height="34px" Placeholder=" Apellido"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Cargo de administrador:</label>
            </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlCargo" runat="server" AutoPostBack="True" Height="34px" DataTextField="Nombre" DataValueField="Id" OnSelectedIndexChanged="ddlCargo_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>

              <br />
              <br />

            </div> 
      <div class="modal-footer">                       
              <asp:Button ID="btAgregarModal" runat="server" CssClass="btn-md btn-success" OnClick="btAgregarModal_Click" Text="Guardar" />   
      </div>
    </div>
  </div>
</div>
 
<div class="modal fade" id="editarModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="H1" runat="server"><asp:Label ID="modTitulo" runat="server" Text="Editar administrador"></asp:Label></h4>
      </div>
      <div class="modal-body">      
          <div class="form-group" >
            <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Documento del administrador:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="editarDoc" runat="server" Height="34px" Enabled="false" Placeholder=" Documento"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

           <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Nombre del usuario:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="editarUsuario" runat="server" Height="34px" Placeholder=" Usuario"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Nombre de administrador:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="editarNombre" runat="server" Height="34px" Placeholder=" Nombre"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Apellido de administrador:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="editarApellido" runat="server" Height="34px" Placeholder=" Apellido"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Cargo de administrador:</label>
            </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="editarDdl" runat="server" AutoPostBack="True" Height="34px" DataTextField="Nombre" DataValueField="Id" OnSelectedIndexChanged="editarDdl_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>

              <br />
              <br />
            </div> 
      <div class="modal-footer">                       
              <asp:Button ID="btGuardarModal" runat="server" CssClass="btn-md btn-success" OnClick="btGuardarModal_Click" Text="Guardar" />   
      </div>
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
