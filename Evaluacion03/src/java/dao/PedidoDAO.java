/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelos.Estado;
import modelos.Pedido;
import modelos.PedidoItem;
import modelos.Producto;

/**
 *
 * @author amaru
 */
public class PedidoDAO extends Conexion {
    
    public int registrar(Pedido pedido) throws SQLException{
        Connection conn = null;
        try {
            conn = obtenerConexion();
            conn.setAutoCommit(false);
            
            String sentencia = "insert into pedido (email, idestado) values (?, ?)";
            
            PreparedStatement ps = conn.prepareStatement(sentencia);
            ps.setString(1, pedido.getEmail());
            ps.setInt(2, 1);
            int res = ps.executeUpdate();
            
            sentencia = "select max(idpedido) as id from pedido";
            ps = conn.prepareStatement(sentencia);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int idPedido = rs.getInt("id");
            
            for(PedidoItem item: pedido.getItems()) {
                sentencia = "insert into pedido_producto values (?, ?, ?, ?)";
                ps = conn.prepareStatement(sentencia);
                ps.setInt(1, idPedido);
                ps.setInt(2, item.getProducto().getId());
                ps.setInt(3, item.getCantidad());
                ps.setInt(4, item.getPrecioUnitario());
                
                ps.executeUpdate();
            }
            
            conn.commit();
            return res;
        } catch (Exception e) {
            if (conn != null) {
                conn.rollback();
            }
            return -1;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }
    
    public int modificarPedido(Pedido pedido) throws SQLException {
        try {
            String sentencia = "update pedido set email=?, idestado=? where idpedido=?";
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, pedido.getEmail());
            ps.setInt(2, pedido.getEstado().getId());
            ps.setInt(3, pedido.getId());
            return ps.executeUpdate();
        } catch(Exception e) {
            return -1;
        } finally {
            desconectar();
        }
    }
    
    public Pedido obtenerPedido(int id) throws SQLException{
        String sentencia = "select * from v_pedido where idpedido=?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            Pedido pedido = null;
            if(rs.next()){
                Estado estado = new Estado(rs.getInt("idestado"), rs.getString("nombre_estado"));
                pedido = new Pedido(rs.getInt("idpedido"), rs.getString("email"), estado);
            }
            
            if(pedido != null) {
                sentencia = "select * from v_pedido_productos where idpedido = ?";
                ps = obtenerPS(sentencia);
                ps.setInt(1, pedido.getId());
                rs = ps.executeQuery();
                
                while(rs.next()){
                    Producto producto = new Producto(rs.getInt("idproducto"),rs.getString("nombre"),rs.getString("descripcion"),rs.getInt("precio"));
                    PedidoItem item = new PedidoItem(pedido, producto, rs.getInt("cantidad"), rs.getInt("precio_unitario"));
                    
                    pedido.getItems().add(item);
                }
            }
            
            return pedido;
        }catch(Exception e ){
            return null;
        }finally{
            desconectar();
        }
    }
    
    public ArrayList<Pedido> obtenerPedidos() throws SQLException{
        String sentencia = "select * from v_pedido";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Pedido> pedidos = new ArrayList();
            while(rs.next()){
                Estado estado = new Estado(rs.getInt("idestado"), rs.getString("nombre_estado"));
                Pedido pedido = new Pedido(rs.getInt("idpedido"), rs.getString("email"), estado);
                pedidos.add(pedido);
            }
            
            for(Pedido pedido: pedidos) {
                sentencia = "select * from v_pedido_productos where idpedido = ?";
                ps = obtenerPS(sentencia);
                ps.setInt(1, pedido.getId());
                rs = ps.executeQuery();
                
                while(rs.next()){
                    Producto producto = new Producto(rs.getInt("idproducto"),rs.getString("nombre"),rs.getString("descripcion"),rs.getInt("precio"));
                    PedidoItem item = new PedidoItem(pedido, producto, rs.getInt("cantidad"), rs.getInt("precio_unitario"));
                    
                    pedido.getItems().add(item);
                }
            }
            
            return pedidos;
        }catch(Exception e ){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
    
    public ArrayList<Pedido> obtenerPedidos(String email) throws SQLException{
        String sentencia = "select * from v_pedido where email = ?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            ArrayList<Pedido> pedidos = new ArrayList();
            while(rs.next()){
                Estado estado = new Estado(rs.getInt("idestado"), rs.getString("nombre_estado"));
                Pedido pedido = new Pedido(rs.getInt("idpedido"), rs.getString("email"), estado);
                pedidos.add(pedido);
            }
            
            for(Pedido pedido: pedidos) {
                sentencia = "select * from v_pedido_productos where idpedido = ?";
                ps = obtenerPS(sentencia);
                ps.setInt(1, pedido.getId());
                rs = ps.executeQuery();
                
                while(rs.next()){
                    Producto producto = new Producto(rs.getInt("idproducto"),rs.getString("nombre"),rs.getString("descripcion"),rs.getInt("precio"));
                    PedidoItem item = new PedidoItem(pedido, producto, rs.getInt("cantidad"), rs.getInt("precio_unitario"));
                    
                    pedido.getItems().add(item);
                }
            }
            
            return pedidos;
        }catch(Exception e ){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
}
