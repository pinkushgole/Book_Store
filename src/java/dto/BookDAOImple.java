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
import modal.BooksDtls;

/**
 *
 * @author asus
 */
public class BookDAOImple implements BookDAO {

    private Connection conn;

    public BookDAOImple(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addBooks(BooksDtls b) {
        boolean f = false;
        try {
            String sql = "INSERT INTO book_dtls(bookname,author,price,bookCategory,status,photo,email) VALUES( ?,  ?,  ?,  ?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }

    public List<BooksDtls> getAllBooks() {
        List<BooksDtls> list = new ArrayList<BooksDtls>();
        BooksDtls b = null;

        try {
            String sql = "select * from book_dtls";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    public BooksDtls getBookDtls(int id) {

        BooksDtls b = null;
        try {
            String sql = "select * from book_dtls where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return b;
    }

    public boolean updateEditBooks(BooksDtls b) {
        boolean f = false;
        try {
            String sql = "update book_dtls set bookname=?,author=?,price=?,status=? where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookId());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }

    public boolean deleteBooks(int id) {
        boolean f = false;
        try {
            String sql = "delete from book_dtls where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return f;

    }

    public List<BooksDtls> getNewBook() {

        List<BooksDtls> list = new ArrayList<BooksDtls>();
        BooksDtls b = null;
        try {
            String sql = "select * from book_dtls  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<BooksDtls> getRecentBooks() {
        List<BooksDtls> list = new ArrayList<BooksDtls>();
        BooksDtls b = null;
        try {
            String sql = "select * from book_dtls  where  status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<BooksDtls> getOldBooks() {
        List<BooksDtls> list = new ArrayList<BooksDtls>();
        BooksDtls b = null;
        try {
            String sql = "select * from book_dtls  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                i++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<BooksDtls> getAllRecentBook() {
        List<BooksDtls> list = new ArrayList<BooksDtls>();
        BooksDtls b = null;
        try {
            String sql = "select * from book_dtls  where  status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<BooksDtls> getAllNewBook() {
        List<BooksDtls> list = new ArrayList<BooksDtls>();
        BooksDtls b = null;
        try {
            String sql = "select * from book_dtls  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
           
            while (rs.next()) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
         
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<BooksDtls> getAllOldBook() {
        List<BooksDtls> list = new ArrayList<BooksDtls>();
        BooksDtls b = null;
        try {
            String sql = "select * from book_dtls  where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
         
            while (rs.next()) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

   
    public List<BooksDtls> getBookByOld(String email, String cate) {
     List<BooksDtls> list = new ArrayList<BooksDtls>();
        BooksDtls b = null;
          try {
            String sql = "select * from book_dtls  where bookCategory=? and email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cate);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
         
            while (rs.next()) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

   
    public boolean deleteOldBooks(String email, String cate,int bid) {
      boolean f=false;
       try {
            String sql = "delete from book_dtls where bookCategory=? and email=? and bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cate);
            ps.setString(2, email);
             ps.setInt(3, bid);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

      return f;
    }

   
    public List<BooksDtls> getBookbySearch(String ch) {
     
      List<BooksDtls> list = new ArrayList<BooksDtls>();
       
       BooksDtls b = null;
          try {
            String sql = "select * from book_dtls  where bookname like ? or auhtor like ? or bookCategory  like ? and status=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+ch+"%");
            ps.setString(2, "%"+ch+"%");
            ps.setString(3, "%"+ch+"%");
            ps.setString(4, "Active");
            ResultSet rs = ps.executeQuery();
         
            while (rs.next()) {
                b = new BooksDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuthor(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
