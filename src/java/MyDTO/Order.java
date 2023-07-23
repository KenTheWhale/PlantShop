/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDTO;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Order {
    private int id;
    private java.sql.Date orderdate, shipdate;
    private int status, accID;

    public Order() {
    }

    public Order(int id, Date orderdate, Date shipdate, int status, int accID) {
        this.id = id;
        this.orderdate = orderdate;
        this.shipdate = shipdate;
        this.status = status;
        this.accID = accID;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public Date getShipdate() {
        return shipdate;
    }

    public void setShipdate(Date shipdate) {
        this.shipdate = shipdate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
