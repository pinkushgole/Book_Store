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
import java.util.ArrayList;
import java.util.List;
import modal.Book_Oreder;

/**
 *
 * @author asus
 */
public class BookOrderImpl implements BookOrderDAO {

    private Connection conn;

    public BookOrderImpl(Connection conn) {
        this.conn = conn;
    }

    
    public boolean saveOrder(List<Book_Oreder> blist) {
        boolean f = false;
        try {
            String sql="insert into book_order(order_id,user_name,email,address,phoneno,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
            
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);
            for(Book_Oreder b:blist)
            {
                ps.setString(1, b.getOrderId());
                ps.setString(2, b.getUser_name());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getFulladdress());
                ps.setString(5, b.getPhoneno());
                ps.setString(6, b.getBook_name());
                ps.setString(7, b.getAuthor());
                ps.setString(8, b.getPrice());
                ps.setString(9, b.getPayment());
                ps.addBatch();
            }
            int[] count=ps.executeBatch();
            conn.commit();
            f=true;
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            System.out.println(e);
        }

        return f;
    }

    
    public List<Book_Oreder> getBook(String email) {
       List<Book_Oreder> list=new ArrayList<Book_Oreder>();
       Book_Oreder o=null;
        try {
           String sql="select * from book_order where email=?";
           
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setString(1, email);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
           {
               o=new Book_Oreder();
               o.setId(rs.getInt(1));
               o.setOrderId(rs.getString(2));
               o.setUser_name(rs.getString(3));
               o.setEmail(rs.getString(4));
               o.setFulladdress(rs.getString(5));
               o.setPhoneno(rs.getString(6));
               o.setBook_name(rs.getString(7));
               o.setAuthor(rs.getString(8));
               o.setPrice(rs.getString(9));
               o.setPayment(rs.getString(10));
               list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    
    public List<Book_Oreder> getAllOrder() {
          List<Book_Oreder> list=new ArrayList<Book_Oreder>();
       Book_Oreder o=null;
        try {
           String sql="select * from book_order";
           
           PreparedStatement ps = conn.prepareStatement(sql);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
           {
               o=new Book_Oreder();
               o.setId(rs.getInt(1));
               o.setOrderId(rs.getString(2));
               o.setUser_name(rs.getString(3));
               o.setEmail(rs.getString(4));
               o.setFulladdress(rs.getString(5));
               o.setPhoneno(rs.getString(6));
               o.setBook_name(rs.getString(7));
               o.setAuthor(rs.getString(8));
               o.setPrice(rs.getString(9));
               o.setPayment(rs.getString(10));
               list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    

}
