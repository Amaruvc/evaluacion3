/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelos.Producto;

/**
 *
 * @author amaru
 */
public class ProductoDAO extends Conexion {
    
    public int registrar(Producto producto) throws SQLException{
        String sentencia = "insert into producto (nombre, descripcion, precio) values (?, ?, ?)";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setInt(3, producto.getPrecio());
            
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }    
    
    public Producto obtenerProducto(int id) throws SQLException{
        String sentencia = "select * from producto where idproducto=?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return (new Producto(rs.getInt("idproducto"),rs.getString("nombre"),rs.getString("descripcion"),rs.getInt("precio")));
            }else{
                return null;
            }
        }catch(Exception e ){
            return null;
        }finally{
            desconectar();
        }
    }
    
    public ArrayList<Producto> obtenerProductos() throws SQLException{
        String sentencia = "select * from producto";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Producto> productos = new ArrayList();
            while(rs.next()){
                productos.add(new Producto(rs.getInt("idproducto"),rs.getString("nombre"),rs.getString("descripcion"),rs.getInt("precio")));
            }
            return productos;
        }catch(Exception e ){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }


}
