/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utils.DBUtils;

/**
 *
 * @author Tuan Anh
 */
public class ProductDAO {

    private static final String SEARCH_PRODUCT = "SELECT productID,Name,price,quantity FROM tblProduct WHERE Name like ?";
    private static final String GET_ALL = "SELECT productID,Name,price,quantity FROM tblProduct";
    private static final String SEARCH_PRODUCT_ID = "SELECT productID,Name,price,quantity FROM tblProduct WHERE ProductID =?";
    private static final String DELETE_PRODUCT = "DELETE tblProduct WHERE productID =?";
    private static final String UPDATE_PRODUCT = "UPDATE tblProduct SET Name=?, price=?, quantity=? WHERE productID=?";
    private static final String CHECK_DUPLICATE_PRODUCT = "SELECT productID FROM tblProduct WHERE productID=?";
    private static final String INSERT_PRODUCT = "INSERT INTO tblProduct(productID, Name, price, quantity) VALUES(?,?,?,?)";

    public List<ProductDTO> getProductByName(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCH_PRODUCT);
            ptm.setString(1, "%" + search + "%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                String ProductID = rs.getString("ProductID");
                String Name = rs.getString("Name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                list.add(new ProductDTO(ProductID, Name, price, quantity));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getAll() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_ALL);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String ProductID = rs.getString("ProductID");
                String Name = rs.getString("Name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                list.add(new ProductDTO(ProductID, Name, price, quantity));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public ProductDTO getProductById(String ProductID) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCH_PRODUCT_ID);
            ptm.setString(1, ProductID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String Name = rs.getString("Name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                product = new ProductDTO(ProductID, Name, price, quantity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return product;
    }

    public boolean deleteProduct(String ProductID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_PRODUCT);
                ptm.setString(1, ProductID);////
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT);
                ptm.setString(1, product.getName());
                ptm.setDouble(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setString(4, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicateProduct(String ProductID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_PRODUCT);
                ptm.setString(1, ProductID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertProduct(ProductDTO product) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_PRODUCT);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getName());
                ptm.setDouble(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
