package iti.jets.model.mappers;

import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductImg;
public class ProductMapper {
    public static ProductSummaryDTO toProductSummaryDTO(Product product) {
        ProductSummaryDTO dto = new ProductSummaryDTO();
        dto.setProduct_id(product.getProductId());
        dto.setName(product.getName());
        dto.setPrice(product.getPrice());
        String defaultImg = product.getProductImgs().stream()
                .filter(ProductImg::getIsDefault)
                .findFirst()
                .map(ProductImg::getImg)
                .orElse("");

        dto.setImg(defaultImg);
        return dto;
    }
}

