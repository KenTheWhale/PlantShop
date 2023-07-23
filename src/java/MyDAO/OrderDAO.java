/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyDTO.HistoryItem;
import MyDTO.Order;
import MyLib.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    public static int addOrder(int status, int id) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert Orders(OrdDate,shipdate,status,AccID)\n"
                    + "values(GETDATE(),GETDATE() + 5,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setInt(2, id);
            result = pst.executeUpdate();
            cn.close();
        }

        return result;
    }

    public static int addOrderDetail(int FID, int orderID, int quantity) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert OrderDetails(FID,OrderID,quantity)\n"
                    + "values(?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, FID);
            pst.setInt(2, orderID);
            pst.setInt(3, quantity);
            result = pst.executeUpdate();
            cn.close();
        }

        return result;
    }

    public static Order findOrder(int accountID) throws Exception {
        Order o = new Order();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select OrderID,OrdDate,shipdate,status,AccID\n"
                    + "from Orders\n"
                    + "where AccID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, accountID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("OrderID");
                    Date orderdate = rs.getDate("OrdDate");
                    Date shipdate = rs.getDate("shipdate");
                    int status = rs.getInt("status");
                    int accID = rs.getInt("AccID");
                    o = new Order(id, orderdate, shipdate, status, accID);
                }
                cn.close();
            }
        }
        return o;
    }

    public static ArrayList<HistoryItem> displayHistory(int accountID) throws Exception {
        ArrayList<HistoryItem> listH = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select top 10  Orders.OrderID, fullname , PName, price, quantity, Orders.status as status, convert(varchar ,OrdDate, 103) as OrdDate, convert(varchar, shipdate, 103) as shipdate, imgPath\n"
                    + "from Orders, Accounts, OrderDetails, Plants\n"
                    + "where Accounts.accID = ?\n"
                    + "and orders.AccID= Accounts.accID\n"
                    + "and OrderDetails.OrderID = Orders.OrderID\n"
                    + "and OrderDetails.FID = Plants.PID";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, accountID);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int oid = rs.getInt("OrderID");
                    String name = rs.getString("fullname");
                    String PName = rs.getString("PName");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int status = rs.getInt("status");
                    String OrdDate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    String imgPath = rs.getString("imgPath");
                    HistoryItem hi = new HistoryItem(oid, name, PName, price, quantity, status, OrdDate, shipdate, imgPath);
                    listH.add(hi);
                }
                cn.close();
            }
        }
        return listH;
    }
    

    public static ArrayList<HistoryItem> displayOrderA() throws Exception {
        ArrayList<HistoryItem> listH = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Orders.OrderID, fullname , PName, price, quantity, Orders.status as status, convert(varchar ,OrdDate, 103) as OrdDate, convert(varchar, shipdate, 103) as shipdate, imgPath\n"
                    + "from Orders, Accounts, OrderDetails, Plants\n"
                    + "where orders.AccID= Accounts.accID\n"
                    + "and OrderDetails.OrderID = Orders.OrderID\n"
                    + "and OrderDetails.FID = Plants.PID";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int oid = rs.getInt("OrderID");
                    String name = rs.getString("fullname");
                    String PName = rs.getString("PName");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    int status = rs.getInt("status");
                    String OrdDate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    String imgPath = rs.getString("imgPath");
                    HistoryItem hi = new HistoryItem(oid, name, PName, price, quantity, status, OrdDate, shipdate, imgPath);
                    listH.add(hi);
                }
                cn.close();
            }
        }
        return listH;
    }

    public static ArrayList<HistoryItem> displayCustomerFilterA(String customername) throws Exception {
        ArrayList<HistoryItem> listH = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Orders.OrderID, fullname , PName, price, quantity, Orders.status as status, convert(varchar ,OrdDate, 103) as OrdDate, convert(varchar, shipdate, 103) as shipdate, imgPath\n"
                    + "from Orders, Accounts, OrderDetails, Plants\n"
                    + "where Orders.status = 1\n"
                    + "and Accounts.fullname like ?\n"
                    + "and orders.AccID= Accounts.accID\n"
                    + "and OrderDetails.OrderID = Orders.OrderID\n"
                    + "and OrderDetails.FID = Plants.PID";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + customername + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int oid = rs.getInt("OrderID");
                    String name = rs.getString("fullname");
                    String PName = rs.getString("PName");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    int status = rs.getInt("status");
                    String OrdDate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    String imgPath = rs.getString("imgPath");
                    HistoryItem hi = new HistoryItem(oid, name, PName, price, quantity, status, OrdDate, shipdate, imgPath);
                    listH.add(hi);
                }
                cn.close();
            }
        }
        return listH;
    }

    public static ArrayList<HistoryItem> displayCustomerFilter(String customername) throws Exception {
        ArrayList<HistoryItem> listH = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Orders.OrderID, fullname , PName, price, quantity, Orders.status as status, convert(varchar ,OrdDate, 103) as OrdDate, convert(varchar, shipdate, 103) as shipdate, imgPath\n"
                    + "from Orders, Accounts, OrderDetails, Plants\n"
                    + "where Orders.status = 1\n"
                    + "and Accounts.fullname like ?\n"
                    + "and orders.AccID= Accounts.accID\n"
                    + "and OrderDetails.OrderID = Orders.OrderID\n"
                    + "and OrderDetails.FID = Plants.PID";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + customername + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int oid = rs.getInt("OrderID");
                    String name = rs.getString("fullname");
                    String PName = rs.getString("PName");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    int status = rs.getInt("status");
                    String OrdDate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    String imgPath = rs.getString("imgPath");
                    HistoryItem hi = new HistoryItem(oid, name, PName, price, quantity, status, OrdDate, shipdate, imgPath);
                    listH.add(hi);
                }
                cn.close();
            }
        }
        return listH;
    }

    public static ArrayList<HistoryItem> displayDayFilterA(String begindate, String enddate) throws Exception {
        ArrayList<HistoryItem> listH = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Orders.OrderID, fullname , PName, price, quantity, Orders.status as status, convert(varchar ,OrdDate, 103) as OrdDate, convert(varchar, shipdate, 103) as shipdate, imgPath\n"
                    + "from Orders, Accounts, OrderDetails, Plants\n"
                    + "where Orders.status = 1\n"
                    + "and orders.AccID= Accounts.accID\n"
                    + "and OrderDetails.OrderID = Orders.OrderID\n"
                    + "and OrderDetails.FID = Plants.PID\n"
                    + "and OrdDate >= convert(date, ?, 103)\n"
                    + "and OrdDate <=convert(date, ?, 103)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, begindate);
            pst.setString(2, enddate);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                     int oid = rs.getInt("OrderID");
                    String name = rs.getString("fullname");
                    String PName = rs.getString("PName");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    int status = rs.getInt("status");
                    String OrdDate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    String imgPath = rs.getString("imgPath");
                    HistoryItem hi = new HistoryItem(oid, name, PName, price, quantity, status, OrdDate, shipdate, imgPath);
                    listH.add(hi);
                }
                cn.close();
            }
        }
        return listH;
    }

    public static ArrayList<HistoryItem> displayDayFilter(String begindate, String enddate) throws Exception {
        ArrayList<HistoryItem> listH = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Orders.OrderID, fullname , PName, price, quantity, Orders.status as status, convert(varchar ,OrdDate, 103) as OrdDate, convert(varchar, shipdate, 103) as shipdate, imgPath\n"
                    + "from Orders, Accounts, OrderDetails, Plants\n"
                    + "where Orders.status = 1\n"
                    + "and orders.AccID= Accounts.accID\n"
                    + "and OrderDetails.OrderID = Orders.OrderID\n"
                    + "and OrderDetails.FID = Plants.PID\n"
                    + "and OrdDate >= convert(date, ?, 103)\n"
                    + "and OrdDate <=convert(date, ?, 103)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, begindate);
            pst.setString(2, enddate);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                     int oid = rs.getInt("OrderID");
                    String name = rs.getString("fullname");
                    String PName = rs.getString("PName");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    int status = rs.getInt("status");
                    String OrdDate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    String imgPath = rs.getString("imgPath");
                    HistoryItem hi = new HistoryItem(oid, name, PName, price, quantity, status, OrdDate, shipdate, imgPath);
                    listH.add(hi);
                }
                cn.close();
            }
        }
        return listH;
    }

    public static ArrayList<HistoryItem> displayDayCustomerFilterA(String customername, String begindate, String enddate) throws Exception {
        ArrayList<HistoryItem> listH = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Orders.OrderID, fullname , PName, price, quantity, Orders.status as status, convert(varchar ,OrdDate, 103) as OrdDate, convert(varchar, shipdate, 103) as shipdate, imgPath\n"
                    + "from Orders, Accounts, OrderDetails, Plants\n"
                    + "where Orders.status = 1\n"
                    + "and Accounts.fullname like ?\n"
                    + "and orders.AccID= Accounts.accID\n"
                    + "and OrderDetails.OrderID = Orders.OrderID\n"
                    + "and OrderDetails.FID = Plants.PID\n"
                    + "and OrdDate >= convert(date, ?, 103)\n"
                    + "and OrdDate <=convert(date, ?, 103)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + customername + "%");
            pst.setString(2, begindate);
            pst.setString(3, enddate);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                     int oid = rs.getInt("OrderID");
                    String name = rs.getString("fullname");
                    String PName = rs.getString("PName");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    int status = rs.getInt("status");
                    String OrdDate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    String imgPath = rs.getString("imgPath");
                    HistoryItem hi = new HistoryItem(oid, name, PName, price, quantity, status, OrdDate, shipdate, imgPath);
                    listH.add(hi);
                }
                cn.close();
            }
        }
        return listH;
    }

    public static ArrayList<HistoryItem> displayDayCustomerFilter(String customername, String begindate, String enddate) throws Exception {
        ArrayList<HistoryItem> listH = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Orders.OrderID, fullname , PName, price, quantity, Orders.status as status, convert(varchar ,OrdDate, 103) as OrdDate, convert(varchar, shipdate, 103) as shipdate, imgPath\n"
                    + "from Orders, Accounts, OrderDetails, Plants\n"
                    + "where Orders.status = 1\n"
                    + "and Accounts.fullname like ?\n"
                    + "and orders.AccID= Accounts.accID\n"
                    + "and OrderDetails.OrderID = Orders.OrderID\n"
                    + "and OrderDetails.FID = Plants.PID\n"
                    + "and OrdDate >= convert(date, ?, 103)\n"
                    + "and OrdDate <=convert(date, ?, 103)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + customername + "%");
            pst.setString(2, begindate);
            pst.setString(3, enddate);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                     int oid = rs.getInt("OrderID");
                    String name = rs.getString("fullname");
                    String PName = rs.getString("PName");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    int status = rs.getInt("status");
                    String OrdDate = rs.getString("OrdDate");
                    String shipdate = rs.getString("shipdate");
                    String imgPath = rs.getString("imgPath");
                    HistoryItem hi = new HistoryItem(oid, name, PName, price, quantity, status, OrdDate, shipdate, imgPath);
                    listH.add(hi);
                }
                cn.close();
            }
        }
        return listH;
    }

    public static int cancelOrder(int uid, int oid) throws Exception {
        int res = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "ALTER TABLE Orders\n"
                    + "NOCHECK CONSTRAINT CK__Orders__status__2F10007B\n"
                    + "\n"
                    + "update Orders \n"
                    + "set status = 0\n"
                    + "where status = 1 and AccID = ? and OrderID = ?\n"
                    + "\n"
                    + "ALTER TABLE Orders\n"
                    + "CHECK CONSTRAINT CK__Orders__status__2F10007B";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, uid);
            pst.setInt(2, oid);
            res = pst.executeUpdate();
            cn.close();
        }
        return res;
    }
    
    public static int RecoverOrder(int uid, int oid) throws Exception {
        int res = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "ALTER TABLE Orders\n"
                    + "NOCHECK CONSTRAINT CK__Orders__status__2F10007B\n"
                    + "\n"
                    + "update Orders \n"
                    + "set status = 1\n"
                    + "where status = 0 and AccID = ? and OrderID = ?\n"
                    + "\n"
                    + "ALTER TABLE Orders\n"
                    + "CHECK CONSTRAINT CK__Orders__status__2F10007B";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, uid);
            pst.setInt(2, oid);
            res = pst.executeUpdate();
            cn.close();
        }
        return res;
    }


}
