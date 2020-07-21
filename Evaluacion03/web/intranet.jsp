<%-- 
    Document   : intranet
    Created on : Jul 20, 2020, 7:21:00 PM
    Author     : rodrigo
--%>

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
    <body>
        <nav class="navbar is-info" role="navigation" aria-label="main navigation">
            <div id="navbarBasicExample" class="navbar-menu">
              <div class="navbar-start">
                <a href="logout.jsp" class="navbar-item ">
                    Cerrar Sesión
                </a>
              </div>

            </div>
        </nav>
        
        <div class="container">
            <div class="columns">
                <div class="column">
                    <h1 class="title is-4">Productos</h1>
                    
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
                            <div class="field">
                                <label class="label">Nombre</label>
                                <div class="control">
                                    <input class="input" type="text" name="nombre" required placeholder="Nombre" />
                                </div>
                            </div>
                            <div class="field">
                                <label class="label">Descripción</label>
                                <div class="control">
                                    <textarea class="textarea" name="descripcion" required placeholder="Descripción"></textarea>
                                </div>
                            </div>
                            <div class="field">
                                <label class="label">Precio</label>
                                <div class="control">
                                    <input class="input" type="number" name="precio" required placeholder="Precio" />
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
                                  <input type="submit" class="button is-link" value="Agregar" />
                                </div>
                                <div class="control">
                                  <input type="reset" class="button is-link is-light" value="Limpiar" />
                                </div>
                            </div>
                          </form>  
                        </div>
                    </nav>
                        
                </div>
                <div class="column">
                    <h1 class="title is-4">Pedidos</h1>
                </div>
            </div>
        </div>
          
    </body>
</html>
