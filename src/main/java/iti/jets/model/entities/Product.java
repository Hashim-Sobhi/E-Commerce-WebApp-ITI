package iti.jets.model.entities;

import iti.jets.model.enums.Category;
import iti.jets.model.enums.Gender;
import jakarta.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "Product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Integer productId;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "category", nullable = false)
    private Category category;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender", nullable = false)
    private Gender gender;

    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private Double price;

    @Column(name = "brand", nullable = false, length = 25)
    private String brand;

    @Column(name = "added_at", nullable = false)
    private Timestamp addedAt;

    @Column(name = "sold", nullable = false)
    private Integer sold;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updatedAt;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ProductInfo> productInfos;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ProductImg> productImgs;

    // constructors
    public Product() {
    }

    public Product(Integer productId, String name, String description, Category category, Gender gender, Double price, String brand, Timestamp addedAt, Integer sold, Timestamp updatedAt) {
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.category = category;
        this.gender = gender;
        this.price = price;
        this.brand = brand;
        this.addedAt = addedAt;
        this.sold = sold;
        this.updatedAt = updatedAt;
    }
    public Product(String name, String description, Category category, Gender gender, Double price, String brand, Timestamp addedAt, Integer sold, Timestamp updatedAt) {
        this.name = name;
        this.description = description;
        this.category = category;
        this.gender = gender;
        this.price = price;
        this.brand = brand;
        this.addedAt = addedAt;
        this.sold = sold;
        this.updatedAt = updatedAt;
    }

    // Getters and setters
    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Timestamp getAddedAt() {
        return addedAt;
    }

    public void setAddedAt(Timestamp addedAt) {
        this.addedAt = addedAt;
    }

    public Integer getSold() {
        return sold;
    }

    public void setSold(Integer sold) {
        this.sold = sold;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public List<ProductInfo> getProductInfos() {
        return productInfos;
    }

    public void setProductInfos(List<ProductInfo> productInfos) {
        this.productInfos = productInfos;
    }

    public List<ProductImg> getProductImgs() {
        return productImgs;
    }

    public void setProductImgs(List<ProductImg> productImgs) {
        this.productImgs = productImgs;
    }

}
