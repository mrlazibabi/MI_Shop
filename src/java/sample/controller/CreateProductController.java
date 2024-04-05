/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.product.ProductError;


/**
 *
 * @author Tuan Anh
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    private static final String ERROR = "createProduct.jsp";
    private static final String SUCCESS = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError productError = new ProductError();
        try {
            //UserError userError = new UserError();
            boolean checkValidation = true;
            ProductDAO dao = new ProductDAO();
            String ProductID = request.getParameter("ProductID");
            String Name = request.getParameter("Name");
            double price =Double.parseDouble(request.getParameter("price"));
            int quantity=Integer.parseInt(request.getParameter("quantity"));;
            if (ProductID.length() < 2 || ProductID.length() > 10) {
                productError.setProductIDError("ProductID must be in [2,10]");
                checkValidation = false;
            }
            if (Name.length() < 5 || Name.length() > 20) {
                productError.setNameError("Name must be in [5,20]");
                checkValidation = false;
            }
            if (price<0) {
                productError.setNameError("Price must be bigger than 0$");
                checkValidation = false;
            }
            if (checkValidation) {
                ProductDTO product = new ProductDTO(ProductID, Name, price, quantity);
                boolean checkInsert = dao.insertProduct(product);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    productError.setError("PRODUCT_ERROR");;
                    request.setAttribute("PRODUCT_ERROR", productError);
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            log("Error at CreateProductController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                productError.setProductIDError("Trung khoa chinh roi dude!");
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
