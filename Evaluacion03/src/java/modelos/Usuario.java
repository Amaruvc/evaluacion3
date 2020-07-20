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
public class Usuario {
    private int id;
    private String run;
    private String password;

    public Usuario() {
    }

    public Usuario(int id, String run, String password) {
        this.id = id;
        this.run = run;
        this.password = password;
    }

    public Usuario(String run, String password) {
        this.run = run;
        this.password = password;
    }

    public String getRun() {
        return run;
    }

    public void setRun(String run) {
        this.run = run;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return run;
    }
    
}
