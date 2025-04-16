package iti.jets.services;

import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.model.dtos.WishlistDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.mappers.ProductMapper;
import iti.jets.repositories.WishlistRepository;
import jakarta.persistence.EntityManager;

import java.util.ArrayList;
import java.util.List;

public class WishlistService {
    public static Boolean addToWishlist(Integer user_id, List<WishlistDTO> items, EntityManager em) {
        return WishlistRepository.addToWishlist(user_id, items, em);
    }

    public static List<ProductSummaryDTO> getItems(List<WishlistDTO> items, EntityManager em) {
        List<Product> products =
                WishlistRepository.getItems(items, em);
        List<ProductSummaryDTO> result = new ArrayList<ProductSummaryDTO>();
        for(Product product : products) {
            ProductSummaryDTO productSummaryDTO = ProductMapper.toProductSummaryDTO(product);
            result.add(productSummaryDTO);
        }
        return result;
    }

    public static void removeItem(Integer userId, Integer productId, EntityManager em) {
        WishlistRepository.removeItem(userId, productId, em);
    }
}
