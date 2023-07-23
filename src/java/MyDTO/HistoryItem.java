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
public class HistoryItem {
    private int OrderID;
    private String name, Pname;
    private int price, quantity, status;
    private String orddate, shipday, imgPath;

    public HistoryItem() {
    }

    public HistoryItem(int OrderID, String name, String Pname, int price, int quantity, int status, String orddate, String shipday, String imgPath) {
        this.OrderID = OrderID;
        this.name = name;
        this.Pname = Pname;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.orddate = orddate;
        this.shipday = shipday;
        this.imgPath = imgPath;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String Pname) {
        this.Pname = Pname;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getOrddate() {
        return orddate;
    }

    public void setOrddate(String orddate) {
        this.orddate = orddate;
    }

    public String getShipday() {
        return shipday;
    }

    public void setShipday(String shipday) {
        this.shipday = shipday;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

}
