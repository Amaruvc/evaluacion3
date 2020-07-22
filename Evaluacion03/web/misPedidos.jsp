<%-- 
    Document   : misPedidos
    Created on : 20/07/2020, 07:37:33 PM
    Author     : amaru
--%>

<%@page import="modelos.PedidoItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Pedido"%>
<%@page import="dao.PedidoDAO"%>
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
        <%
            String email = request.getParameter("email");
            PedidoDAO pd = new PedidoDAO();
            ArrayList<Pedido> misPedidos = pd.obtenerPedidos(email);
        %>
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
                    <form action="misPedidos.jsp" method="get">
                        <div class="field has-addons">
                            <div class="control">
                              <input class="input" type="email" name="email" placeholder="Correo electrónico">
                            </div>
                            <div class="control">
                              <button class="button is-primary">
                                BUSCAR PEDIDOS
                              </button>
                            </div>
                        </div>
                    </form>
                </div>
              </div>
            </div>
        </nav>
        <div class="container">
            <h1 class="title my-4">Mis pedidos</h1>
            <%
            for(Pedido p: misPedidos) {
            %>  

            <div class="card my-6">
                <div class="content">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>
                                    <strong class="mr-4">Nº Pedido:</strong>
                                    <span><%= p.getId() %></span>
                                </td>
                                <td class="is-pulled-right has-text-<%= p.getEstado().getColor() %>-dark mr-6">
                                    <strong class="mr-4 has-text-<%= p.getEstado().getColor() %>-dark">Estado:</strong>
                                    <span><%= p.getEstado() %></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table is-fullwidth">
                        <thead>
                          <tr>
                            <th><abbr title="Código de producto">Cod</abbr></th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th><abbr title="Precio unitario">$</abbr></th>
                            <th><abbr title="Cantidad">Cant</abbr></th>
                            <th>Subtotal</th>
                          </tr>
                        </thead>
                        <tbody>

                        <%
                        for(PedidoItem pi: p.getItems()) {
                        %>  

                        <tr>
                          <td><%= pi.getProducto().getId() %></td>
                          <td><%= pi.getProducto().getNombre() %></td>
                          <td><%= pi.getProducto().getDescripcion() %> </td>
                          <td><%= pi.getPrecioUnitario() %></td>
                          <td><%= pi.getCantidad() %></td>
                          <td><%= pi.calcularSubtotal() %></td>
                        </tr>
                        <%} %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>TOTAL:</strong></td>
                            <td colspan="2"><strong>
                                <%= p.calcularTotal() %>
                            </strong></td>
                        </tr>
                    </tbody>
                  </table>
                </div>
            </div>
            <% } %>
            <% if (misPedidos.isEmpty()) { %>
              <tr>
                  <td colSpan="6">No hay pedidos registrados con el correo electrónico </td>
              </tr>
            <% } %>
        </div>
    </body>
</html>
