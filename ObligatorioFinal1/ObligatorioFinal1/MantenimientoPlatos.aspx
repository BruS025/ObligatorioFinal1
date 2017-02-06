<%@ Page Title="" EnableEventValidation="true"  Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MantenimientoPlatos.aspx.cs" Inherits="ObligatorioFinal1.WebForm3" %>

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
            <asp:Label ID="idV" ForeColor="Black" runat="server" Height="34px" Text="Buscar un plato:" Font-Size="Large"></asp:Label>                      
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlPlatoBuscar" runat="server" AutoPostBack="True" Width="100%" Height="34px">
            <asp:ListItem Value="0">Casa0</asp:ListItem>
            <asp:ListItem Value="1">Casa1</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="id" runat="server"  Height="34px" Enabled="true" Placeholder=" Plato" ></asp:TextBox>
        </div>

        <div class="col-md-2">
            <asp:Button ID="btVerificar" CssClass="btn btn-md btn-primary" runat="server" Text="Buscar" OnClick="btVerificar_Click" Height="34px" />
        </div>

    </div>

    <div class="col-md-12" id="divPlato" runat="server">
                          
        <div class="col-md-12">

        <div class="col-md-2">
            <button type="button" class="btn-md btn-primary" data-toggle="modal" data-target="#agregarModal" data-whatever="Agregar un nuevo plato"><span aria-hidden="true" class="glyphicon glyphicon-plus"></span> Agregar</button>
        </div>
        </div>

        <br />
        <br />

        <div class="col-md-12">
            <asp:GridView ID="GridPlatos" runat="server" AllowPaging="true" OnPageIndexChanging="GridPlatos_PageIndexChanging"        
        AutoGenerateColumns="False" RowStyle-Height="34px" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
        Visible="True" Width="100%" ShowFooter="false" ShowHeaderWhenEmpty="True" PageSize="10" Font-Size="Large" CaptionAlign="Top" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" PagerSettings-Mode="NextPrevious">

        <AlternatingRowStyle BackColor="White" />

          <Columns>

            <asp:TemplateField HeaderStyle-BorderWidth="2px" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium" ControlStyle-CssClass="btn-primary btn-md" HeaderText="Editar">
                <ItemTemplate>

                <asp:LinkButton ID="btnModificar" runat="server" CommandName="select" CssClass="btn btn-md btn-danger" ForeColor="Black" BackColor="Transparent">
                    <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                </asp:LinkButton>

                </ItemTemplate>

            </asp:TemplateField>

            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Id" HeaderText="Id"/>
            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Nombre" HeaderText="Nombre" />     
            <asp:BoundField HeaderStyle-BorderWidth="2px" ItemStyle-Font-Size="Medium" DataField="Precio" HeaderText="Precio" />                                   

            <asp:TemplateField HeaderStyle-BorderWidth="2px" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Size="Medium" ControlStyle-CssClass="btn-primary btn-md" HeaderText="Ver foto">
                <ItemTemplate>
                    <a role="button" aria-hidden="true" data-toggle="modal" data-target="#myModal">
                        <span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
                    </a>                                                      
                </ItemTemplate>
            </asp:TemplateField>

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

    </div>

    <div class="col-md-12">
        <br />
        <p class="text-center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red"></asp:Label></p> 
        <br />
    </div>

</div>
</div>     
 
<!-- Modal HTML -->
<div class="modal fade" tabindex="-1" role="dialog" id="myModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="return deactivateModal()" ><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><asp:Label ID="modalNombrePlato" runat="server" Text="PlatoNombre"></asp:Label></h4>         
      </div>
      <div class="modal-body">
          <img class="card-img-center" src="/ImagenesPlato/1.jpg" width="100%" height="100%" alt="Card image cap" />
      </div>
      <div class="modal-footer">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="agregarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Cerrar</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group" >

              <div class="col-md-12" runat="server" id="idPlatoDiv">
                <div class="col-md-4">
                    <label for="message-text" class="control-label">ID del plato:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="idPlato" runat="server" Enabled="false" Height="34px" Placeholder=" Id"></asp:TextBox>
                </div>
              </div>

              <br />
              <br />
              <br />

              <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Casa del plato:</label>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlCasasPlato" runat="server" Height="34px">
                        <asp:ListItem Value="0">Casa0</asp:ListItem>
                        <asp:ListItem Value="1">Casa1</asp:ListItem>
                    </asp:DropDownList>
                </div>
               </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Nombre del plato:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="nombrePlato" runat="server" Height="34px" Placeholder=" Nombre"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

             <div class="col-md-12">
                <div class="col-md-4">                  
                    <label for="message-text" class="control-label">Precio del plato:</label>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="precioPlato" runat="server" Height="34px" Placeholder=" Precio"></asp:TextBox>
                </div>
            </div>

              <br />
              <br />
              <br />

            <div class="col-md-12">
                <div class="col-md-12" id="Form1">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
            </div>

              <br />

        <div class="col-md-12">
        <br />
        <p class="text-center"><asp:Label ID="lbError2" runat="server" Text="" ForeColor="Red"></asp:Label></p> 
        <br />
        </div>

            </div>

        </form>
      </div>
      <div class="modal-footer">
              <button type="button" class="btn-lg btn-danger" data-dismiss="modal" runat="server"><span aria-hidden="true" class="glyphicon glyphicon-floppy-remove"></span></button>          
              <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />   
      </div>
    </div>
  </div>
</div>


 <script>

     function verFoto() {
         $('#verFoto').modal({ backdrop: 'static', keyboard: false })
         $("#verFoto").modal('show');
     }

     $('#agregarModal').on('show.bs.modal', function (event) {
         var button = $(event.relatedTarget) // Button that triggered the modal
         var recipient = button.data('whatever')
         var modal = $(this)
         modal.find('.modal-title').text(recipient)
     })

     function ocultarModalAgregar() {
         $('#agregarModal').modal({ backdrop: 'static', keyboard: false })
         $("#agregarModal").modal('hidden.bs.modal');
     }
         
   
 </script>

</asp:Content>
