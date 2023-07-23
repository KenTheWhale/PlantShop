/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyDTO.Plant;
import MyLib.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class PlantDAO {

    public static ArrayList<Plant> listPlantNewProduct() throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select top 6 PID,PName,price,imgPath,description,status\n"
                    + "from dbo.Plants\n"
                    + "where status = 1\n"
                    + "order by PID DESC";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String image = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    Plant p = new Plant(id, name, price, image, description, status);
                    list.add(p);
                }
                cn.close();
            }
        }
        return list;
    }

    public static ArrayList<Plant> listPlant() throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select PID,PName,price,imgPath,description,status\n"
                    + "from dbo.Plants \n"
                    + "order by PID DESC";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String image = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    Plant p = new Plant(id, name, price, image, description, status);
                    list.add(p);
                }
                cn.close();
            }
        }
        return list;
    }

    public static ArrayList<Plant> listPlantSearch(String key) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Plants.PID, Plants.PName, Plants.price, Plants.imgPath, Plants.description, Plants.status\n"
                    + "from Plants, Orders, OrderDetails\n"
                    + "where Plants.PID = OrderDetails.FID and OrderDetails.OrderID = Orders.OrderID and Plants.status = 1 and Orders.status = 1 and PName like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + key + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String image = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    Plant p = new Plant(id, name, price, image, description, status);
                    list.add(p);
                }
                cn.close();
            }
        }
        return list;
    }
    
     public static ArrayList<Plant> PlantSearch(String key) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Plants.PID, Plants.PName, Plants.price, Plants.imgPath, Plants.description, Plants.status\n"
                    + "from Plants\n"
                    + "where Plants.status = 1 and PName like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + key + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String image = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    Plant p = new Plant(id, name, price, image, description, status);
                    list.add(p);
                }
                cn.close();
            }
        }
        return list;
    }
    
    public static ArrayList<Plant> listPlantSearchRE(String key) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Plants.PID, Plants.PName, Plants.price, Plants.imgPath, Plants.description, Plants.status\n"
                    + "from Plants, Orders, OrderDetails\n"
                    + "where Plants.PID = OrderDetails.FID and OrderDetails.OrderID = Orders.OrderID and Plants.status = 1 and Orders.status = 0 and PName like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + key + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String image = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    Plant p = new Plant(id, name, price, image, description, status);
                    list.add(p);
                }
                cn.close();
            }
        }
        return list;
    }


    
    public static ArrayList<Plant> listPlantCartSearch(String key) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Plants.PID, Plants.PName, Plants.price, Plants.imgPath, Plants.description, Plants.status\n"
                    + "from Plants where status = 1 and PName like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + key + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String image = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    Plant p = new Plant(id, name, price, image, description, status);
                    list.add(p);
                }
                cn.close();
            }
        }
        return list;
    }

    public static ArrayList<Plant> listPlantSearchA(String key) throws Exception {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select *\n"
                    + "from Plants where PName like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + key + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String image = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    Plant p = new Plant(id, name, price, image, description, status);
                    list.add(p);
                }
                cn.close();
            }
        }
        return list;
    }

    public static boolean updatePlant(String name, String Pname, int Pprice, String Pimage, String Pdescription, int Pstatus, int PCate) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update Plants\n"
                    + "set PName = ?, price = ?, imgPath = ?, description = ?, status = ?, CateID = ?\n"
                    + "where PName = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, Pname);
            pst.setInt(2, Pprice);
            pst.setString(3, Pimage);
            pst.setString(4, Pdescription);
            pst.setInt(5, Pstatus);
            pst.setInt(6, PCate);
            pst.setString(7, name);
            result = pst.executeUpdate();
            if (result > 0) {
                return true;
            }
            cn.close();
        }
        return false;
    }

    public static boolean removePlant(String name) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "delete from Plants\n"
                    + "where PName = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            result = pst.executeUpdate();
            if (result > 0) {
                return true;
            }
            cn.close();
        }
        return false;
    }

    public static boolean createPlant(String name, int price, String img, String desc, int status, int CID) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert Plants(PName,price,imgPath,description,status,CateID)\n"
                    + "values(?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setInt(2, price);
            pst.setString(3, img);
            pst.setString(4, desc);
            pst.setInt(5, status);
            pst.setInt(6, CID);
            result = pst.executeUpdate();
            if (result > 0) {
                return true;
            }
            cn.close();
        }
        return false;
    }
    
     public static boolean checkPlant(String key) throws Exception {
        
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select Plants.PID, Plants.PName, Plants.price, Plants.imgPath, Plants.description, Plants.status\n"
                    + "from Plants where PName like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + key + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                return true;
            }
            cn.close();
        }
        return false;
    }
}
