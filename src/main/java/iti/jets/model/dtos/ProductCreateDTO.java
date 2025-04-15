package iti.jets.model.dtos;

import iti.jets.model.enums.Category;
import iti.jets.model.enums.Gender;
import iti.jets.model.enums.ShoeSize;
import jakarta.servlet.http.Part;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import lombok.Data;

@Data
public class ProductCreateDTO {
    private String name;
    private String description;
    private Category category;
    private Gender gender;
    private BigDecimal price;
    private String brand;
    private Integer sold;
    private List<Part> images  = new ArrayList<>();
    private List<ProductVariationDTO> variations = new ArrayList<>();
}
