package iti.jets.model.dtos;

import java.math.BigDecimal;

public class ProductManageDTO {
    private Integer product_id;
    private String name;
    private BigDecimal price;
    private Integer quantity;

    public ProductManageDTO() {}

    public ProductManageDTO(Integer product_id, String name, BigDecimal price, Integer quantity) {
        this.product_id = product_id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }


    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
