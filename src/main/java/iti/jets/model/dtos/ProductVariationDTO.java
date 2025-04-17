package iti.jets.model.dtos;

import iti.jets.model.enums.ShoeSize;
import lombok.Data;

@Data
public class ProductVariationDTO {
    private ShoeSize size;
    private String colour;
    private Integer quantity;
}
