/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyDTO.Account;
import MyLib.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    public static Account checkExisted(String email, String password) throws Exception {
        Account ac = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email,password,fullname,phone,status,role\n"
                    + "from dbo.Accounts\n"
                    + "where email = ?  and password = ? COLLATE Latin1_General_CS_AS";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int id = rs.getInt("accID");
                String mail = rs.getString("email");
                String pass = rs.getString("password");
                String name = rs.getString("fullname");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                int role = rs.getInt("role");
                ac = new Account(id, mail, pass, name, phone, status, role);
            }
            cn.close();
        }
        return ac;
    }

    public static Account checkExistedEmail(String email) throws Exception {
        Account ac = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email, password, fullname,phone,status,role\n"
                    + "from Accounts\n"
                    + "where email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int id = rs.getInt("accID");
                String mail = rs.getString("email");
                String pass = rs.getString("password");
                String name = rs.getString("fullname");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                int role = rs.getInt("role");
                ac = new Account(id, mail, pass, name, phone, status, role);
            }
            cn.close();
        }
        return ac;
    }

    public static Account checkExistedName(String name) throws Exception {
        Account ac = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email, password, fullname,phone,status,role\n"
                    + "from Accounts\n"
                    + "where status = 1 and fullname = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int id = rs.getInt("accID");
                String mail = rs.getString("email");
                String pass = rs.getString("password");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                int role = rs.getInt("role");
                ac = new Account(id, mail, pass, fullname, phone, status, role);
            }
            cn.close();
        }
        return ac;
    }

    public static Account checkExistedNameA(String name) throws Exception {
        Account ac = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID,email, password, fullname,phone,status,role\n"
                    + "from Accounts\n"
                    + "where fullname = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int id = rs.getInt("accID");
                String mail = rs.getString("email");
                String pass = rs.getString("password");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                int status = rs.getInt("status");
                int role = rs.getInt("role");
                ac = new Account(id, mail, pass, fullname, phone, status, role);
            }
            cn.close();
        }
        return ac;
    }

    public static int addAccount(String email, String password, String fullname, String phonenumber, int status, int role) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "insert dbo.Accounts(email,password,fullname,phone,status,role)\n"
                    + "values(?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, fullname);
            pst.setString(4, phonenumber);
            pst.setInt(5, status);
            pst.setInt(6, role);
            result = pst.executeUpdate();
            cn.close();
        }

        return result;
    }

    public static int updateAccount(String preEmail, String email, String password, String fullname, String phonenumber) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update Accounts\n"
                    + "set email = ?, password = ?, fullname = ?, phone = ?\n"
                    + "where email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, fullname);
            pst.setString(4, phonenumber);
            pst.setString(5, preEmail);
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }

    public static int updateAccountA(String email, String password, String fullname, String phonenumber, int status, int role) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update Accounts\n"
                    + "set email = ?, password = ?, fullname = ?, phone = ?, status = ?, role = ?\n"
                    + "where email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, fullname);
            pst.setString(4, phonenumber);
            pst.setInt(5, status);
            pst.setInt(6, role);
            pst.setString(7, email);
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }

    public static int updatePassword(String email, String password) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update dbo.Accounts\n"
                    + "set password = ?\n"
                    + "where email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, password);
            pst.setString(2, email);
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }

    public static ArrayList<Account> listAccount() throws Exception {
        ArrayList<Account> listA = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select accID, email, password, fullname, phone, status, role\n"
                    + "from Accounts";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    Account ac = new Account(rs.getInt("accID"), rs.getString("email"), rs.getString("password"), rs.getString("fullname"), rs.getString("phone"), rs.getInt("status"), rs.getInt("role"));
                    listA.add(ac);
                }

            }
            cn.close();
        }
        return listA;
    }
}
