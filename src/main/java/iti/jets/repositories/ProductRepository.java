package iti.jets.repositories;


import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductInfo;
import iti.jets.model.enums.Gender;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ProductRepository {
    public static List<Product> getFilteredProducts(
            String[] brands, String[] sizes, String[] colors,
            String orderBy, String category, String page,
            EntityManager em
    ) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Product> cq = cb.createQuery(Product.class);
        Root<Product> productRoot = cq.from(Product.class);
        Join<Product, ProductInfo> infoJoin = productRoot.join("productInfos");

        List<Predicate> predicates = new ArrayList<>();

        // Brand filter
        if (brands != null && brands.length > 0) {
            predicates.add(productRoot.get("brand").in((Object[]) brands));
        }

        // Size filter (note: converting to integers)
        if (sizes != null && sizes.length > 0) {
            List<Integer> sizeList = Arrays.stream(sizes)
                    .map(Integer::parseInt)
                    .toList();
            predicates.add(infoJoin.get("size").in(sizeList));
        }

        // Color filter
        if (colors != null && colors.length > 0) {
            predicates.add(infoJoin.get("color").in((Object[]) colors));
        }

        // Category filter
        if (category != null && !category.isEmpty()) {
            if(category.equals("men")) {
                predicates.add(cb.equal(productRoot.get("gender"), Gender.MALE));
            } else if (category.equals("women")) {
                predicates.add(cb.equal(productRoot.get("gender"), Gender.FEMALE));
            }
        }

        // Remove duplicates caused by join
        cq.select(productRoot).distinct(true);

        // Apply all filters
        cq.where(cb.and(predicates.toArray(new Predicate[0])));

        // Sorting
        if (orderBy != null) {
            switch (orderBy) {
                case "newArrival" -> cq.orderBy(cb.desc(productRoot.get("addedAt"))); // Newest products first
                case "bestseller" -> cq.orderBy(cb.desc(productRoot.get("sold")));     // Most sold first
            }
        }

        // Pagination
        int pageSize = 3;
        int pageNumber = 1;
        try {
            pageNumber = Integer.parseInt(page);
            if (pageNumber < 1) pageNumber = 1;
        } catch (NumberFormatException ignored) {

        }
        int firstResult = (pageNumber - 1) * pageSize;

        return em.createQuery(cq).setFirstResult(firstResult).setMaxResults(pageSize).getResultList();
    }

    public static Long getNoOfFilteredProducts(String[] brands, String[] sizes, String[] colors, String orderBy, String category, String page, EntityManager em) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Long> cq = cb.createQuery(Long.class);
        Root<Product> productRoot = cq.from(Product.class);
        Join<Product, ProductInfo> infoJoin = productRoot.join("productInfos");

        List<Predicate> predicates = new ArrayList<>();

        // Brand filter
        if (brands != null && brands.length > 0) {
            predicates.add(productRoot.get("brand").in((Object[]) brands));
        }

        // Size filter (note: converting to integers)
        if (sizes != null && sizes.length > 0) {
            List<Integer> sizeList = Arrays.stream(sizes)
                    .map(Integer::parseInt)
                    .toList();
            predicates.add(infoJoin.get("size").in(sizeList));
        }

        // Color filter
        if (colors != null && colors.length > 0) {
            predicates.add(infoJoin.get("color").in((Object[]) colors));
        }

        // Category filter
        if (category != null && !category.isEmpty()) {
            if(category.equals("men")) {
                predicates.add(cb.equal(productRoot.get("gender"), Gender.MALE));
            } else if (category.equals("women")) {
                predicates.add(cb.equal(productRoot.get("gender"), Gender.FEMALE));
            }
        }

        // Remove duplicates caused by join
        cq.select(cb.countDistinct(productRoot)).distinct(true);

        // Apply all filters
        cq.where(cb.and(predicates.toArray(new Predicate[0])));

        return em.createQuery(cq).getSingleResult();
    }

    public static List<Product> getBestSellerProducts(EntityManager em) {
        String jpql = "SELECT p FROM Product p ORDER BY p.sold DESC";
        return em.createQuery(jpql, Product.class).setMaxResults(4).getResultList();
    }


    public static Product getProductDetail(Integer product_id, EntityManager em) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Product> cq = cb.createQuery(Product.class);
        Root<Product> productRoot = cq.from(Product.class);
        cq.where(cb.equal(productRoot.get("product_id"), product_id));
        cq.select(productRoot);
        try{
            return em.createQuery(cq).getSingleResult();
        }catch (NoResultException e){
            return null;
        }
    }

    public static List<Product> getAllProducts(EntityManager em) {
        TypedQuery<Product> query = em.createQuery("SELECT p FROM Product p", Product.class);
        return query.getResultList();
    }
}
