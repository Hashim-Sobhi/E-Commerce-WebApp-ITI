package iti.jets.repositories;


import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductImg;
import iti.jets.model.entities.ProductInfo;
import iti.jets.model.enums.Gender;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.EntityResult;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.*;
import org.hibernate.engine.spi.EntityUniqueKey;

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
        int pageSize = 9;
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
        productRoot.fetch("productInfos", JoinType.LEFT);
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

    public static List<Product> getSearchProducts(String query, EntityManager em) {
        String jpql = "SELECT p FROM Product p WHERE p.name LIKE :query";
        return em.createQuery(jpql, Product.class)
                .setParameter("query", "%" + query + "%")
                .getResultList();
    }

    public static ProductInfo getProductInfoById(int productInfoId , EntityManager em)
    {
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();

        Query query = em.createQuery("select p from ProductInfo p where p.productInfoId= :productInfoId");
        query.setParameter("productInfoId", Integer.valueOf(productInfoId));

        transaction.commit();
        return (ProductInfo)query.getSingleResult();

    }

    public static void addNewProduct(Product product, EntityManager em) {
        em.getTransaction().begin();

        if (product.getProductInfos() != null) {
            for (ProductInfo info : product.getProductInfos()) {
                info.setProduct(product);
            }
        }

        if (product.getProductImgs() != null) {
            for (ProductImg img : product.getProductImgs()) {
                img.setProduct(product);
            }
        }
        em.persist(product);
        em.getTransaction().commit();
    }
    public static void deleteProductById(Integer productId, EntityManager em) {
        em.getTransaction().begin();
        Product product = em.find(Product.class, productId);
        if (product != null) {
            em.remove(product);
        }
        em.getTransaction().commit();
    }
    public static void updateProduct(Product product, EntityManager em) {
        em.getTransaction().begin();
        em.merge(product);
        em.getTransaction().commit();
    }
    public static void deleteProductImgById(Integer imgId, EntityManager em) {
        em.getTransaction().begin();

        ProductImg img = em.find(ProductImg.class, imgId);
        if (img != null) {
            em.remove(img);
        }

        em.getTransaction().commit();
    }

    public static List<Product> findByNameContaining(String search, EntityManager em) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Product> cq = cb.createQuery(Product.class);
        Root<Product> root = cq.from(Product.class);
        // case‐insensitive search
        cq.select(root)
                .where(cb.like(cb.lower(root.get("name")), "%" + search.toLowerCase() + "%"));
        return em.createQuery(cq).getResultList();
    }




}
