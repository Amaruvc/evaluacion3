<%-- 
    Document   : login
    Created on : 19/07/2020, 11:46:27 AM
    Author     : amaru
--%>

<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet"> -->
    <link href="https://fonts.googleapis.com/css?family=Questrial&display=swap" rel="stylesheet">
    <!-- Bulma Version 0.8.2-->
    <link rel="stylesheet" href="https://unpkg.com/bulma@0.8.2/css/bulma.min.css" />
    <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/login.css">
</head>

<%
    Usuario usuario = (Usuario)session.getAttribute("usuario");
    if (usuario != null) {
        response.sendRedirect("intranet.jsp");
    }
%>

<body>
    <section class="hero is-info is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-4 is-offset-4">
                    <h3 class="title has-text-black">Login</h3>
                    <hr class="login-hr">
                    <p class="subtitle has-text-black">Por favor, inicie sesión</p>
                    <div class="box">
                        <span class="icon is-large">
                           <i class="ion-ionic" name="person-outline"></i>
                        </span>
                        <form action="ControladorUsuario" method="post">
                            <div class="field">
                                <div class="control">
                                    <input name="run" required class="input is-large" type="text" placeholder="Run" autofocus="">
                                </div>
                            </div>

                            <div class="field">
                                <div class="control">
                                    <input name="password" required class="input is-large" type="password" placeholder="Contraseña">
                                </div>
                            </div>
                            <div class="field">
                                <% if(request.getParameter("msj")!= null){%>
                                    <div class="notification is-warning is-light">
                                      <button class="delete"></button>
                                      <%= request.getParameter("msj") %>
                                    </div>
                                <%}%> 
                            </div>
                            <button class="button is-block is-info is-large is-fullwidth">Ingresar <i class="fa fa-sign-in" aria-hidden="true"></i></button>
                            <a href="index.jsp" class="button is-block is-large is-fullwidth">Cancelar</a>
                            
                            <input type="hidden" name="accion" value="1" />
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <script async type="text/javascript" src="../js/bulma.js"></script>
</body>
</html>
