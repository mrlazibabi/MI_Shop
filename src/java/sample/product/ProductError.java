/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author Tuan Anh
 */
public class ProductError {

    private String productIDError;
    private String NameError;
    private String priceError;
    private String error;

    public ProductError() {
        this.productIDError = "";
        this.NameError = "";
        this.priceError = "";
        this.error = "";
    }

    public ProductError(String productIDError, String NameError, String priceError, String error) {
        this.productIDError = productIDError;
        this.NameError = NameError;
        this.priceError = priceError;
        this.error = error;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getNameError() {
        return NameError;
    }

    public void setNameError(String NameError) {
        this.NameError = NameError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

}
