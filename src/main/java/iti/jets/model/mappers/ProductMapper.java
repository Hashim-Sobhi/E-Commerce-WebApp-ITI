package iti.jets.model.mappers;

import iti.jets.model.dtos.ProductDetailDTO;
import iti.jets.model.dtos.ProductInfoDTO;
import iti.jets.model.dtos.ProductManageDTO;
import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.model.dtos.ProductCreateDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductImg;
import iti.jets.model.entities.ProductInfo;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

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

    public static Product fromProductCreateDTO(ProductCreateDTO dto, List<String> imageFileNames) {
        Timestamp now = Timestamp.from(Instant.now());

        // Create Product entity
        Product product = new Product(
                dto.getName(),
                dto.getDescription(),
                dto.getCategory(),
                dto.getGender(),
                dto.getPrice(),
                dto.getBrand(),
                now,
                dto.getSold() != null ? dto.getSold() : 0,
                now
        );

        // Create ProductInfo
        ProductInfo productInfo = new ProductInfo();
        productInfo.setProduct(product);
        productInfo.setColor(dto.getColour());
        productInfo.setQuantity(dto.getQuantity());
        productInfo.setSize(dto.getSize().getValue());

        List<ProductInfo> productInfos = new ArrayList<>();
        productInfos.add(productInfo);
        product.setProductInfos(productInfos);

        // Create ProductImg entries
        List<ProductImg> productImgs = new ArrayList<>();
        for (int i = 0; i < imageFileNames.size(); i++) {
            ProductImg img = new ProductImg();
            img.setProduct(product);
            img.setImg(imageFileNames.get(i));
            img.setIsDefault(i == 0); // First image is default
            productImgs.add(img);
        }
        product.setProductImgs(productImgs);

        return product;
    }
}

