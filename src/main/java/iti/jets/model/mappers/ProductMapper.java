package iti.jets.model.mappers;

import iti.jets.model.dtos.ProductDetailDTO;
import iti.jets.model.dtos.ProductInfoDTO;
import iti.jets.model.dtos.ProductManageDTO;
import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductImg;
import iti.jets.model.entities.ProductInfo;

public class ProductMapper {

    public static ProductManageDTO toProductManageDTO(Product product) {
        int totalQuantity = 0;
        if (product.getProductInfos() != null) {
            for (ProductInfo info : product.getProductInfos()) {
                totalQuantity += info.getQuantity();
            }
        }
        return new ProductManageDTO(
                product.getProduct_id(),
                product.getName(),
                product.getPrice(),
                totalQuantity
        );
    }
    public static ProductSummaryDTO toProductSummaryDTO(Product product) {
        ProductSummaryDTO dto = new ProductSummaryDTO();
        dto.setProduct_id(product.getProduct_id());
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

    public static ProductDetailDTO toProductDetailDTO(Product product) {
        ProductDetailDTO dto = new ProductDetailDTO();
        dto.setProduct_id(product.getProduct_id());
        dto.setName(product.getName());
        dto.setPrice(product.getPrice());
        dto.setDescription(product.getDescription());
        product.getProductImgs().forEach(img -> {
            dto.getImg().add(img.getImg());
        });
        product.getProductInfos().forEach(productInfo -> {
           ProductInfoDTO dto2 = new ProductInfoDTO();
           dto2.setProduct_info_id(productInfo.getProductInfoId());
           dto2.setColor(productInfo.getColor());
           dto2.setSize(productInfo.getSize());
           dto2.setQuantity(productInfo.getQuantity());
           dto.getProductInfo().add(dto2);
        });
        return dto;

    }
}

