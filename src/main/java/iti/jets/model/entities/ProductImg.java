package iti.jets.model.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "ProductImg")
public class ProductImg {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "image_id")
    private Integer imageId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    @Column(name = "img", nullable = false, length = 100)
    private String img; // path

    @Column(name = "is_default", nullable = false)
    private Boolean isDefault;

    // constructors
    public ProductImg() {
    }

    public ProductImg(Integer imageId, Product product, String img, Boolean isDefault) {
        this.imageId = imageId;
        this.product = product;
        this.img = img;
        this.isDefault = isDefault;
    }

    // Getters and setters
    public Integer getImageId() {
        return imageId;
    }

    public void setImageId(Integer imageId) {
        this.imageId = imageId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }
}
