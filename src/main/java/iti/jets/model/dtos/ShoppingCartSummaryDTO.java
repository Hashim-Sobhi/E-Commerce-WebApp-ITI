package iti.jets.model.dtos;

import lombok.Data;

@Data
public class ShoppingCartSummaryDTO {
    private Integer productInfoId;
    private Integer product_id;
    private Integer quantity;
}
