package sample.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import sample.product.Item;
import sample.product.ProductDAO;

/**
 *
 * @author Tuan Anh
 */
public class Cart1 {

    private List<Item> items;

    public Cart1() {
        items = new ArrayList<>();
    }

    public Cart1(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    private Item getItemById(String ProductID) {
        for (Item i : items) {
            if (i.getProduct().getProductID().equals(ProductID)) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(String ProductID) {
        return getItemById(ProductID).getQuantity();
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getProductID()) != null) {         
            Item i = getItemById(t.getProduct().getProductID());         
            i.setQuantity(i.getQuantity() + t.getQuantity());            
        } else {
            items.add(t);                                              
        }
    }

    public boolean removeItem(String ProductID) {              
        if (getItemById(ProductID) != null) {
            items.remove(getItemById(ProductID));
            return true;
        }
        return false ;
    }

    public double getTotal() {
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getPrice());
        }
        return t;
    }

}
