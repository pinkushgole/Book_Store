/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.List;
import modal.Book_Oreder;

/**
 *
 * @author asus
 */
public interface BookOrderDAO {
    
  public boolean saveOrder(List<Book_Oreder> b);

  public List<Book_Oreder> getBook(String email);
  
   public List<Book_Oreder> getAllOrder();
}
