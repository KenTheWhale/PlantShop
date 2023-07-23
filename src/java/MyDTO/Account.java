/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDTO;

/**
 *
 * @author Admin
 */
public class Account {
    private int id;
    private String mail, pass, name, phone;
    private int status, role;

    public Account() {
    }

    public Account(int id,String mail, String pass, String name, String phone, int status, int role) {
        this.id = id;
        this.mail = mail;
        this.pass = pass;
        this.name = name;
        this.phone = phone;
        this.status = status;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRole() {
        return role == 1? "Admin" : "Member";
    }

    public void setRole(int role) {
        this.role = role;
    }
    
}
