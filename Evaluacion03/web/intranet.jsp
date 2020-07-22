<%-- 
    Document   : intranet
    Created on : Jul 20, 2020, 7:21:00 PM
    Author     : rodrigo
--%>

<%@page import="modelos.Estado"%>
<%@page import="dao.EstadoDAO"%>
<%@page import="modelos.PedidoItem"%>
<%@page import="modelos.Pedido"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Producto"%>
<%@page import="dao.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
        <title>Intranet</title>
    </head>
    <body class="has-navbar-fixed-top">
        <nav class="navbar is-info is-fixed-top" role="navigation" aria-label="main navigation">
            <div id="navbarBasicExample" class="navbar-menu">
              <div class="navbar-start">
                <a href="logout.jsp" class="navbar-item ">
                    Cerrar Sesión
                </a>
              </div>
                
              <div class="navbar-start">
                <a class="navbar-item" href="#productos">Productos</a>
                <a class="navbar-item" href="#pedidos">Pedidos</a>
              </div>

            </div>
        </nav>
        
        <div class="container">
            <section class="mb-6 card px-4 py-4">
                <h1 id="productos" class="title is-3 my-4">Productos</h1>

                <table class="table is-fullwidth">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                           ProductoDAO pd = new ProductoDAO();
                           ArrayList<Producto> productos = pd.obtenerProductos();

                           for(Producto p: productos) {
                        %>
                        <tr>
                            <td><%= p.getId() %></td>
                            <td><%= p.getNombre() %></td>
                            <td><%= p.getDescripcion()%></td>
                            <td><%= p.getPrecio() %></td>
                        </tr>
                        <%}%>
                        <% if (productos.isEmpty()) { %>
                        <tr>
                            <td colSpan="4">No hay productos ingresados</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

                <nav class="panel">
                    <p class="panel-heading">
                        Agregar Producto
                    </p>
                    <div class="panel-block">
                      <form action="ControladorProducto" method="post">
                        <div class="field is-horizontal">
                            <div class="field-body">
                                <div class="field">
                                    <label class="label">Nombre</label>
                                    <div class="control">
                                        <input class="input" type="text" name="nombre" required placeholder="Nombre" />
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Descripción</label>
                                    <div class="control">
                                        <input class="input" type="text" name="descripcion" required placeholder="Descripción" style="width:500px"  />
                                    </div>
                                </div>
                                <div class="field">
                                    <label class="label">Precio</label>
                                    <div class="control">
                                        <input class="input" type="number" name="precio" required placeholder="Precio" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <% if(request.getParameter("msjProducto")!= null){%>
                                <div class="notification is-warning is-light">
                                  <button class="delete"></button>
                                  <%= request.getParameter("msjProducto") %>
                                </div>
                            <%}%> 
                        </div>
                        <input type="hidden" name="accion" value="1" />
                        <div class="field is-grouped">
                            <div class="control">
                              <input type="submit" class="button is-primary" value="Agregar" />
                            </div>
                            <div class="control">
                              <input type="reset" class="button is-primary is-light" value="Limpiar" />
                            </div>
                        </div>
                      </form>  
                    </div>
                </nav>

            </section>
            <section class="card px-4 py-4">
                <h1 id="pedidos" class="title is-3 my-4">Pedidos</h1>
                
                <% if(request.getParameter("msjPedido")!= null){%>
                    <div class="notification is-warning is-light">
                      <%= request.getParameter("msjPedido") %>
                    </div>
                <%}%> 

                <%
                PedidoDAO ped = new PedidoDAO();
                ArrayList<Pedido> pedidos = ped.obtenerPedidos();

                for(Pedido p: pedidos) {
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
                                    <td class="is-pulled-right">
                                        <form action="ControladorPedido" method="post">
                                            <label><strong>Estado:</strong></label>
                                            <select class="select" name="idEstado">
                                                <%
                                                EstadoDAO ed = new EstadoDAO();
                                                for(Estado e: ed.obtenerEstados()) {
                                                %>
                                                <option value="<%= e.getId() %>" <% if(e.getId() == p.getEstado().getId()){ %>selected="selected"<% } %> >
                                                    <%= e.getNombre() %>
                                                </option>
                                                <% } %>
                                            </select>
                                            <input type="hidden" name="accion" value="5" />
                                            <input type="hidden" name="idPedido" value="<%= p.getId() %>" />

                                            <button class="button is-primary is-small">
                                                Cambiar
                                            </button>
                                        </form>
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
                <% if (pedidos.isEmpty()) { %>
                  <tr>
                      <td colSpan="6">No hay pedidos registrados </td>
                  </tr>
                <% } %>
            </section>
        </div>
          
    </body>
</html>
