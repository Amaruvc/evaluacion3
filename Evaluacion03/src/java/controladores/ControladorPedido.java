/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import dao.EstadoDAO;
import dao.PedidoDAO;
import dao.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Estado;
import modelos.Pedido;
import modelos.PedidoItem;
import modelos.Producto;

/**
 *
 * @author amaru
 */
@WebServlet(name = "ControladorPedido", urlPatterns = {"/ControladorPedido"})
public class ControladorPedido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("accion") != null) {
            String accion = request.getParameter("accion");
            switch (accion) {
                case "1":
                    agregarItem(request, response);
                    break;
                case "2":
                    vaciarCarro(request, response);
                    break;
                case "3":
                    eliminarItem(request, response);
                    break;
                case "4":
                    confirmarPedido(request, response);
                    break;
                case "5":
                    cambiarEstadoPedido(request, response);
                    break;
            }
        } else {
            response.sendRedirect("intranet.jsp?msjProducto=acceso no permitido");
        }
    }
    
    private void agregarItem(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            int idProducto = Integer.parseInt(request.getParameter("idProducto").trim());
            int cantidad = Integer.parseInt(request.getParameter("cantidad").trim());

            if (cantidad <= 0) {
                response.sendRedirect("index.jsp?msj=La cantidad no es válida");
                return;
            }
            
            ProductoDAO pd = new ProductoDAO();
            Producto producto = pd.obtenerProducto(idProducto);
            if (producto == null) {
                response.sendRedirect("index.jsp?msj=No se encuentra el producto");
                return;
            }

            Pedido pedido = (Pedido)request.getSession().getAttribute("pedido");
            if (pedido == null) {
                pedido = new Pedido();
            }

            boolean encontro = false;
            for(PedidoItem item: pedido.getItems()) {
                if (item.getProducto().getId() == idProducto) {
                    encontro = true;
                    item.setCantidad(item.getCantidad() + cantidad);
                    item.setPrecioUnitario(producto.getPrecio());
                }
            }
            if (!encontro) {
                PedidoItem nuevoItem = new PedidoItem(pedido, producto, cantidad);
                pedido.getItems().add(nuevoItem);
            }

            request.getSession().setAttribute("pedido", pedido);
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            response.sendRedirect("index.jsp?msj=" + e.getMessage());
        }
    }
    
    private void vaciarCarro(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.getSession().setAttribute("pedido", null);
        response.sendRedirect("index.jsp");
    }
          
    private void eliminarItem(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            int idProducto = Integer.parseInt(request.getParameter("idProducto").trim());
            
            Pedido pedido = (Pedido)request.getSession().getAttribute("pedido");
            if (pedido != null) {
                PedidoItem itemEncontrado = null;
                for(PedidoItem item: pedido.getItems()) {
                    if (item.getProducto().getId() == idProducto) {
                        itemEncontrado = item;
                        break;
                    }
                }
                if (itemEncontrado != null) {
                    pedido.getItems().remove(itemEncontrado);
                }
            }
            request.getSession().setAttribute("pedido", pedido);
            response.sendRedirect("index.jsp");
            
        } catch (Exception e) {
            response.sendRedirect("index.jsp?msj=" + e.getMessage());
        }
    }
    
    private void confirmarPedido(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String email = request.getParameter("email").trim();
            if (email.equals("")) {
                response.sendRedirect("index.jsp?msj=Debe ingresar un email de contacto");
                return;
            }
            
            Pedido pedido = (Pedido)request.getSession().getAttribute("pedido");
            if (pedido == null) {
                response.sendRedirect("index.jsp?msj=El carrito esta vacio");
                return;
            }
            
            pedido.setEmail(email);
            
            PedidoDAO pd = new PedidoDAO();
            pd.registrar(pedido);
            
            request.getSession().setAttribute("pedido", null);
            
            response.sendRedirect("index.jsp?msj=Su pedido fue registrado correctamente");
        } catch (Exception e) {
            response.sendRedirect("index.jsp?msj=" + e.getMessage());
        }
    }
    
    private void cambiarEstadoPedido(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int idPedido = Integer.parseInt(request.getParameter("idPedido"));
            int idEstado = Integer.parseInt(request.getParameter("idEstado"));
            
            if (idPedido > 0 && idEstado > 0) {
                EstadoDAO ed = new EstadoDAO();
                Estado estado = ed.obtenerEstado(idEstado);
                
                if (estado != null) {
                    PedidoDAO pd = new PedidoDAO();
                    Pedido pedido = pd.obtenerPedido(idPedido);
                    if (pedido != null) {
                        pedido.setEstado(estado);
                        
                        int res = pd.modificarPedido(pedido);
                        if (res == 1) {
                            response.sendRedirect("intranet.jsp?msjPedido=Pedido modificado");
                        } else {
                            response.sendRedirect("intranet.jsp?msjPedido=Pedido no se pudo modificar");
                        }
                    } else {
                        response.sendRedirect("intranet.jsp?msjPedido=El pedido no existe");
                    }
                } else {
                    response.sendRedirect("intranet.jsp?msjPedido=El estado no existe");
                }
            } else {
                response.sendRedirect("intranet.jsp?msjPedido=datos invalidos");
            }
        } catch (Exception e) {
            response.sendRedirect("intranet.jsp?msjPedido=" + e.getMessage());
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
