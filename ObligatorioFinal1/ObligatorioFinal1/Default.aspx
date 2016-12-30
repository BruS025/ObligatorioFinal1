<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ObligatorioFinal1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Login</title>

    <link rel="stylesheet" href = "css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/login.css"/>
    <link rel="shortcut icon" href="Imagenes/favicon.ico"/> 

</head>
<body>
    <form id="form1" runat="server" class="form-signin">

<div class="container">

    <div class="container">
    <h1 class="welcome text-center">Bienvenido a <br/> CometeloYA!</h1>
        <div class="card card-container">
        <h2 class='login_title text-center'>Login</h2>
        <hr/>

            <form class="form-signin">
                <span id="reauth-email" class="reauth-email"></span>
                <p class="input_title">Nombre de usuario</p>
                <input type="text" id="inputEmail" class="login_box" placeholder="Ingrese nombre de usuario" required="required" autofocus="autofocus"/>
                <p class="input_title">Contraseña</p>
                <input type="password" id="inputPassword" class="login_box" placeholder="******" required="required"/>                                             

                <asp:Button ID="entrar" CssClass="btn btn-lg btn-primary" runat="server" Text="Entrar" OnClick="entrar_Click" Width="100%"/>

                <br/><br/>
                <p>Queres comer ya pero no tenes usuario? <asp:LinkButton ID="register" runat="server" PostBackUrl="~/Register.aspx">Registrarse</asp:LinkButton> </p>
                

            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
    
    </div>
    </form>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>
