<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Producto"%>
<%@page import="dao.ProductoDAO"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
        <title>index</title>
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
            <div class="columns">
                <div class="column is-three-quarters">
                    <h1 class="title">Productos</h1>
                    <table class="table is-fullwidth">
                        <thead>
                          <tr>
                            <th><abbr title="Código de producto">Cod</abbr></th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th><abbr title="Precio unitario">PU</abbr></th>
                            <th><abbr title="Cantidad">Cant</abbr></th>
                            <th>Comprar</th>
                          </tr>
                        </thead>
                        <tbody>
                          <%
                            ProductoDAO pd = new ProductoDAO();
                            ArrayList<Producto> productos = pd.obtenerProductos();

                            for(Producto p: productos) {
                         %>  
                          <form method="ControladorPedido" method="post">
                            <tr> <!-- <tr class="is-selected"> -->
                              <th><%= p.getId() %></th>
                              <td><%= p.getNombre() %></td>
                              <td><%= p.getDescripcion() %> </td>
                              <td><%= p.getPrecio() %></td>
                              <td>
                                  <input type="hidden" name="accion" value="1" /> 
                                  <input type="hidden" name="idProducto" value="<%= p.getId() %>" /> 
                                  <input type="number" class="input is-small" name="cantidad" value="0" /> 
                              </td>
                              <td>
                                  <div class="buttons">
                                    <input type="submit" class="button is-primary  is-light" value="Agregar" />
                                  </div>
                              </td>
                            </tr>
                          </form>
                          <% } %>
                          <% if (productos.isEmpty()) { %>
                            <tr>
                                <td colSpan="6">No hay productos disponibles</td>
                            </tr>
                          <% } %>
                        </tbody>
                      </table>
                </div>
                <div class="column">
                    <div class="notification is-primary is-light">
                        <h2 class="subtitle">Carro de compras</h2>
                    </div>   
                </div>
              </div>
        </div>
    </body>
</html>
