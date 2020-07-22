/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author rodrigo
 */
public class Estado {
    
    private int id;
    private String nombre;

    public Estado() {
    }

    public Estado(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getColor() {
        switch(id) {
            case 1:
                return "warning";
            case 2:
                return "primary";
            case 3:
                return "danger";
            default:
                return "warning";
        }
    }

    @Override
    public String toString() {
        return nombre;
    }
    
}
