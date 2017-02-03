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
                <input type="text" id="inputUsername" runat="server" class="login_box" placeholder="Ingrese nombre completo" required="required"/>

                <p class="input_title">Nombre de usuario</p>
                <input type="text" id="inputEmail" runat="server" class="login_box" placeholder="Ingrese nombre de usuario" required="required"/>
                
                <p class="input_title">Documento</p>
                <input type="text" id="inputDocumento" runat="server" height="44px" class="login_box" placeholder="Ingrese documento del usuario" required="required"/>

                <div>
                    <p runat="server" id="P1" class="input_title">Numero de tarjeta de credito</p>
                    <input type="text" id="inputTarjeta" runat="server" class="login_box" placeholder="Numero de tarjeta de credito" required="required"/>

                    <p runat="server" id="dirTitle" class="input_title">Direccion</p>
                    <input type="text" id="inputDire" runat="server" class="login_box" placeholder="Ingrese direccion" required="required"/>
                </div>

                <p class="input_title">Contraseña</p>
                <input type="password" id="inputPassword" runat="server" class="login_box" placeholder="******" required="required" autocomplete="off"/>                                             
                
                <p class="input_title">Repetir contraseña</p>
                <input type="password" id="inputPasswordRepeat" height="44px" runat="server" class="login_box" placeholder="******" required="required" autocomplete="off"/> 
              
                <asp:Button ID="btRegister" CssClass="btn btn-lg btn-primary" runat="server" OnClick="btRegister_Click" Text="Crear cuenta" Width="100%"/>

                <br/><br/>
                <p>Ya tenes usuario? <asp:LinkButton ID="login" runat="server" PostBackUrl="~/Default.aspx">Entrar!</asp:LinkButton> </p>
                
                <p class="text-center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red"></asp:Label></p> 

            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
    
    </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>
