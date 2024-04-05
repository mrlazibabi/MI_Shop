/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.util.Date;

/**
 *
 * @author Tuan Anh
 */
public class Order {

    private int orderID;
    private Date orderDate;
    private String userID;
    private double total;

    public Order() {

    }

    public Order(int orderID, Date orderDate, String userID, double total) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.userID = userID;
        this.total = total;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    

}
