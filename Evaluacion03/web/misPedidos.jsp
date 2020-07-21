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
                <a href="login.jsp" class="navbar-item ">
                    ADMIN
                </a>
              </div>
              <div class="navbar-end">
                <a class="navbar-item" href="index.jsp">
                    REALIZAR PEDIDO
                </a>
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
        <div class="container">
            <h1 class="title">Mis pedidos</h1>
            <div class="card">
                <div class="card-content">
                  <div class="content">
                    <table class="table is-fullwidth">
                        <thead>
                          <tr>
                            <th><abbr title="Código de producto">Cod</abbr></th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th><abbr title="Precio unitario">PU</abbr></th>
                            <th><abbr title="Cantidad">Cant</abbr></th>
                            <th>Subtotal</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th>1</th>
                            <td>Leicester City
                            </td>
                            <td>38</td>
                            <td>23</td>
                            <td>12</td>
                            <td>Qualification</td>
                          </tr>
                          <tr>
                            <th>2</th>
                            <td>Arsenal</td>
                            <td>38</td>
                            <td>20</td>
                            <td>7</td>
                            <td>Qualification </td>
                          </tr>
                          <tr>
                            <th>3</th>
                            <td>Tottenham Hotspur</td>
                            <td>38</td>
                            <td>19</td>
                            <td>6</td>
                            <td>Qualification</td>
                          </tr>
                        </tbody>
                      </table>
                      <footer class="card-footer">
                        <p class="card-footer-item">
                            <span class="has-text-weight-bold">
                            Total de la compra 
                            </span>
                        </p>
                      </footer>
                  </div>
                </div>
            </div>
        </div>
    </body>
</html>
