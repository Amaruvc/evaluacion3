package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelos.Estado;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author amaru
 */
public class EstadoDAO extends Conexion {
    
    public Estado obtenerEstado(int id) throws SQLException{
        String sentencia = "select * from estado where idestado=?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return (new Estado(rs.getInt("idestado"),rs.getString("nombre")));
            }else{
                return null;
            }
        }catch(Exception e ){
            return null;
        }finally{
            desconectar();
        }
    }
    
    public ArrayList<Estado> obtenerEstados() throws SQLException{
        String sentencia = "select * from estado";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Estado> estados = new ArrayList();
            while(rs.next()){
                estados.add(new Estado(rs.getInt("idestado"),rs.getString("nombre")));
            }
            return estados;
        }catch(Exception e ){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
    
}
