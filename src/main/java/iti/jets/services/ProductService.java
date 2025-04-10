package iti.jets.services;

import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.mappers.ProductMapper;
import iti.jets.repositories.ProductRepository;
import jakarta.persistence.EntityManager;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
    public static List<ProductSummaryDTO> getFilteredProducts(String[] brands, String[] sizes, String[] colors, EntityManager em) {
        List<Product> products = ProductRepository.getFilteredProducts(brands, sizes, colors, em);
        List<ProductSummaryDTO> productSummaries = new ArrayList<>();
        for (Product product : products) {
            ProductSummaryDTO summaryDTO = ProductMapper.toProductSummaryDTO(product);
            productSummaries.add(summaryDTO);
        }
        return productSummaries;
    }
}
