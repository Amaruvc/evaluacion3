/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.util.ArrayList;

/**
 *
 * @author rodrigo
 */
public class Pedido {
 
    private int id;
    private String email;
    private Estado estado;
    private ArrayList<PedidoItem> items;

    public Pedido() {
        items = new ArrayList();
    }

    public Pedido(int id, String email, Estado estado) {
        this.id = id;
        this.email = email;
        this.estado = estado;
        this.items = new ArrayList();
    }

    public Pedido(String email, Estado estado) {
        this.email = email;
        this.estado = estado;
        this.items = new ArrayList();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public ArrayList<PedidoItem> getItems() {
        return items;
    }

    public void setItems(ArrayList<PedidoItem> items) {
        this.items = items;
    }
 
    public int calcularTotal() {
        int total = 0;
        for(PedidoItem item: items) {
            total += item.calcularSubtotal();
        }
        return total;
    }
    
}
