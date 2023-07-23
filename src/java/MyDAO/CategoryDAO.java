/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyDTO.Category;
import MyDTO.Plant;
import MyLib.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    public static ArrayList<Category> listCate() throws Exception {
        Connection cn = DBUtils.makeConnection();
        ArrayList<Category> list = new ArrayList<>();

        if (cn != null) {
            String sql = "select CateID, CateName\n"
                    + "from Categories";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("CateID");
                    String name = rs.getString("CateName");
                    Category c = new Category(id, name);
                    list.add(c);
                }
            }
            cn.close();
        }
        return list;
    }

    public static ArrayList<Plant> listCateView(String key) throws Exception {
        Connection cn = DBUtils.makeConnection();
        ArrayList<Plant> list = new ArrayList<>();

        if (cn != null) {
            String sql = "select PID,PName,price,imgPath,cast(description as varchar) as des, status\n"
                    + "from Plants p\n"
                    + "join Categories c\n"
                    + "on p.CateID = (select CateID from Categories where CateName = ? group by Categories.CateID)\n"
                    + "group by PID,PName,price,imgPath,cast(description as varchar), status";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, key);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String img = rs.getString("imgPath");
                    String des = rs.getString("des");
                    int status = rs.getInt("status");
                    Plant p = new Plant(id, name, price, img, des, status);
                    list.add(p);
                }
            }
            cn.close();
        }
        return list;
    }

    public static boolean createCate(String name) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert Categories(CateName)\n"
                    + "values(?)";
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

    public static ArrayList<Category> listCateSearchA(String key) throws Exception {
        ArrayList<Category> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select *\n"
                    + "from Categories where CateName like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + key + "%");
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("CateID");
                    String name = rs.getString("CateName");
                    Category c = new Category(id, name);
                    list.add(c);
                }
                cn.close();
            }
        }
        return list;
    }

    public static boolean updateCate(String name, String Cname, int CID) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update Categories\n"
                    + "set CateName = ?\n"
                    + "where CateName = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, Cname);
            pst.setString(2, name);
            result = pst.executeUpdate();
            if (result > 0) {
                return true;
            }
            cn.close();
        }
        return false;
    }

    public static boolean checkCate(String name) throws Exception {
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select CateID, CateName\n"
                    + "from Categories\n"
                    + "where CateName = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();
            if(rs != null && rs.next())
                return true;
            cn.close();
        }
        return false;
    }
    
    public static boolean removeCate(String name) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "delete from Categories\n"
                    + "where CateName = ?";
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
}
