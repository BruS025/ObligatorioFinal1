<%@ Page Language="C#" AutoEventWireup="true" enableEventValidation="false" CodeBehind="Register.aspx.cs" Inherits="ObligatorioFinal1.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Register</title>

    <link rel="stylesheet" href = "css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/login.css"/>
    <link rel="shortcut icon" href="Imagenes/favicon.ico"/> 

</head>
<body>


<div class="container">

    <div class="container">
    <h1 class="welcome text-center">Registrate en <br/> CometeloYA!</h1>
        <div class="card card-container">
        <h2 class='login_title text-center'>Registro</h2>
        <hr/>

            <form id="formulario" class="form-signin" runat="server">
                <span id="reauth-email" class="reauth-email"></span>

                <p class="input_title">Nombre completo del usuario</p>
                <input type="text" id="inputUsername" runat="server" class="login_box" placeholder="Ingrese nombre completo" required="required" autofocus="autofocus"/>

                <p class="input_title">Nombre de usuario</p>
                <input type="text" id="inputEmail" runat="server" class="login_box" placeholder="Ingrese nombre de usuario" required="required" autofocus="autofocus"/>
                
                <p class="input_title">Documento</p>
                <input type="text" id="inputDocumento" runat="server" height="44px" class="login_box" placeholder="Ingrese documento del usuario" required="required" autofocus="autofocus"/>

                <p class="input_title">Tipo de usuario:</p>
                <asp:DropDownList ID="ddlTipoUsuario" runat="server" AutoPostBack="True" Height="44px" Width="100%">
                    <asp:ListItem Value="0">Cliente</asp:ListItem>
                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                </asp:DropDownList>
                <br/><br/>

                <p runat="server" id="dirTitle" class="input_title">Direccion</p>
                <input type="text" id="dirInput" runat="server" class="login_box" placeholder="Ingrese direccion" required="required" autofocus="autofocus"/>

                <p id="cargoTitle" class="input_title">Cargo de empleado:</p>
                <asp:DropDownList ID="ddlCargos" runat="server" AutoPostBack="True" Height="44px" Width="100%">
                    <asp:ListItem Value="0">Gerente</asp:ListItem>
                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                </asp:DropDownList>
                <br/><br/>

                <p class="input_title">Contraseña</p>
                <input type="password" id="Password1" runat="server" class="login_box" placeholder="******" required="required" autofocus="autofocus" autocomplete="off"/>

                <p class="input_title">Contraseña</p>
                <input type="password" id="inputPassword" runat="server" class="login_box" placeholder="******" required="required" autofocus="autofocus" autocomplete="off"/>                                             
                
                <p class="input_title">Repetir contraseña</p>
                <input type="password" id="inputPasswordRepeat" height="44px" runat="server" class="login_box" placeholder="******" required="required" autofocus="autofocus" autocomplete="off"/> 
              
                <asp:Button ID="btRegister" CssClass="btn btn-lg btn-primary" runat="server" OnClick="btRegister_Click" Text="Crear cuenta" Width="100%"/>

                <br/><br/>
                <p>Ya tenes usuario? <asp:LinkButton ID="login" runat="server" PostBackUrl="~/Default.aspx">Entrar!</asp:LinkButton> </p>
                

            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
    
    </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>
