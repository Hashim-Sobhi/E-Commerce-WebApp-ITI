package iti.jets.model.dtos;

import lombok.Data;

@Data
public class ProductInfoDTO {
    private Integer product_info_id;
    private String color;
    private Integer size;
    private Integer quantity;
}
