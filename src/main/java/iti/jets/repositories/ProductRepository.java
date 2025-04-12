package iti.jets.repositories;

import iti.jets.model.entities.Product;
import jakarta.persistence.EntityManager;

import java.util.List;

public class ProductRepository {
    public static List<Product> getFilteredProducts(String[] brands, String[] sizes, String[] colors, EntityManager em) {
        List<Product> products = em.createQuery("from Product", Product.class).getResultList();
        em.close();
        return products;
    }
}
