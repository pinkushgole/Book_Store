/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modal.User;

/**
 *
 * @author asus
 */
public class UserDtoImpl implements UserDto {

    private final Connection conn;

    public UserDtoImpl(Connection conn) {
        this.conn = conn;
    }

    public boolean userRegister(User us) {
        boolean f = false;
        try {
            String sql = "INSERT INTO user(name,email,password,phoneno) VALUES(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPassword());
            ps.setString(4, us.getPhoneno());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }

    public User login(String email, String password) {
        User us = null;

        try {

            String sql = "select * from user where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPassword(rs.getString(4));
                us.setPhoneno(rs.getString(5));
                us.setAdress(rs.getString(6));
                us.setLandmark(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
                us.setPincode(rs.getString(10));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return us;
    }

    public boolean checkPassword(int id,String ps) {
        boolean f = false;
        try {
            String sql = "select * from user where id=? && password=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, ps);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                f=true;
            }

            pst.setString(2, ps);
        } catch (SQLException e) {
            System.out.println(e);
        }

        return f;
    }

  
    public boolean updateProfile(User us) {
         boolean f = false;
        try {
            String sql = "update user set name=?,email=?,phoneno=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPassword());
           ps.setInt(4,us.getId());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }

   
    public boolean checkUser(String email) {
        boolean f=true;
        try {
            String sql = "select * from user where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
           
            ps.setString(2,email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f=false;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }

}
