<%@ Page Language="C#" AutoEventWireup="true" enableEventValidation="false" CodeBehind="Default.aspx.cs" Inherits="ObligatorioFinal1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Login</title>

    <link rel="stylesheet" href = "css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/login.css"/>
    <link rel="shortcut icon" href="Imagenes/favicon.ico"/> 

</head>
<body>

<div class="container">

    <div class="container">
    <h1 class="welcome text-center">Bienvenido a <br/> CometeloYA!</h1>
        <div class="card card-container">
        <h2 class='login_title text-center'>Login</h2>
        <hr/>

            <form class="form-signin" runat="server">
                <span id="reauth-email" class="reauth-email"></span>
                <p class="input_title">Nombre de usuario</p>
                <input type="text" id="inputEmail" runat="server" class="login_box" placeholder="Ingrese nombre de usuario" required="required" autofocus="autofocus" height="44px" />
                <p class="input_title">Contraseña</p>
                <input type="password" id="inputPassword" runat="server" class="login_box" placeholder="******" required="required" autofocus="autofocus" autocomplete="off"/>                                             

                <asp:Button ID="entrar" CssClass="btn btn-lg btn-primary" runat="server" Text="Entrar" OnClick="entrar_Click" Width="100%"/>

                <br/><br/>
                <p>Queres comer ya pero no tenes usuario? <asp:LinkButton ID="register" runat="server" PostBackUrl="~/Register.aspx">Registrarse</asp:LinkButton> </p>
                
                <p class="text-center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red"></asp:Label></p> 

            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
    
    </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>
