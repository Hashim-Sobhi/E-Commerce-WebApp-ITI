package iti.jets.model.dtos;

import lombok.Data;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data
public class ProductDetailDTO {
    private Integer product_id;
    private String name;
    private String description;
    private BigDecimal price;
    private List<String> img = new ArrayList<>();
    private List<ProductInfoDTO> productInfo = new ArrayList<>();

}