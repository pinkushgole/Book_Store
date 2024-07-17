/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.List;
import modal.BooksDtls;

/**
 *
 * @author asus
 */
public interface BookDAO {

    public boolean addBooks(BooksDtls b);

    public List<BooksDtls> getAllBooks();

    public BooksDtls getBookDtls(int id);

    public boolean updateEditBooks(BooksDtls b);

    public boolean deleteBooks(int id);

    public List<BooksDtls> getNewBook();

    public List<BooksDtls> getRecentBooks();

    public List<BooksDtls> getOldBooks();

    public List<BooksDtls> getAllRecentBook();

    public List<BooksDtls> getAllNewBook();

    public List<BooksDtls> getAllOldBook();
    
    public List<BooksDtls> getBookByOld(String email,String cate);
    
    public boolean deleteOldBooks(String email,String cate,int bid);
    
    public List<BooksDtls> getBookbySearch(String ch);
    
}
