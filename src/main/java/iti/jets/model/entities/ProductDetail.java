package iti.jets.model.entities;

public class ProductDetail {
    int product_info_id;
    int product_id;
    int size;
    String color;

    public int getProduct_info_id() {
        return product_info_id;
    }

    public void setProduct_info_id(int product_info_id) {
        this.product_info_id = product_info_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
