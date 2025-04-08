package iti.jets.model.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "ProductInfo")
public class ProductInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_info_id")
    private Integer productInfoId;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    @Column(name = "size", nullable = false)
    private Integer size;

    @Column(name = "color", nullable = false, length = 20)
    private String color;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    // constructors
    public ProductInfo() {
    }

    public ProductInfo(Integer productInfoId, Product product, Integer size, String color, Integer quantity) {
        this.productInfoId = productInfoId;
        this.product = product;
        this.size = size;
        this.color = color;
        this.quantity = quantity;
    }

    // Getters and setters
    public Integer getProductInfoId() {
        return productInfoId;
    }

    public void setProductInfoId(Integer productInfoId) {
        this.productInfoId = productInfoId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
