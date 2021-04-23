/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entitypack;

import java.util.List;

/**
 *
 * @author shelc
 */
@javax.ejb.Local
public interface BookNewAuthFacadeLocal {

    void create(BookNewAuth bookNewAuth);

    void edit(BookNewAuth bookNewAuth);

    void remove(BookNewAuth bookNewAuth);

    BookNewAuth find(Object id);

    List<BookNewAuth> findAll();

    List<BookNewAuth> findRange(int[] range);

    int count();
    
}
