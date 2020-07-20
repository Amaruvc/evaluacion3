<%-- 
    Document   : misPedidos
    Created on : 20/07/2020, 07:37:33 PM
    Author     : amaru
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
        <title>Mis Pedidos</title>
    </head>
    <body>
        <nav class="navbar is-info" role="navigation" aria-label="main navigation">
            <div id="navbarBasicExample" class="navbar-menu">
              <div class="navbar-start">
                <a  href="login.jsp" class="navbar-item ">
                    Inicio sesión
                </a>
              </div>
              <div class="navbar-end">
                <div class="navbar-item">
                    <div class="field has-addons">
                        <div class="control">
                          <input class="input" type="text" placeholder="Correo electrónico">
                        </div>
                        <div class="control">
                          <a class="button is-primary">
                            BUSCAR PEDIDOS
                          </a>
                        </div>
                    </div>
                </div>
              </div>
            </div>
        </nav>
    </body>
</html>
