package iti.jets.repositories;


import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;

import iti.jets.model.entities.ProductInfo;
import iti.jets.model.entities.ShoppingCart;
import iti.jets.model.entities.User;
import jakarta.jws.soap.SOAPBinding.Use;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;

public class CartRepository {
    
    public static Object[] getProductInfoAndProductByInfoId(Integer productInfoId, EntityManager em) {
        System.out.println("I am in cart Repository");

        
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
    
            Query query = em.createQuery(
                "SELECT pi, p FROM ProductInfo pi JOIN pi.product p WHERE pi.productInfoId = :productInfoId"
            );
    
            query.setParameter("productInfoId", productInfoId);
    
            Object[] result = (Object[]) query.getSingleResult();
    
            transaction.commit();
            return result;
        } catch (NoResultException e) {
            transaction.rollback();
            return null;
        }
    }

    public static void addToCart(String userId , String productId , String productInfoId , String quantity , EntityManager em)
    {
        System.out.println("I am in the addTocart repo");
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        User user = (User)em.find(User.class, userId);
        ProductInfo productInfo = (ProductInfo)em.find(ProductInfo.class, productInfoId);
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setUser(user);
        shoppingCart.setProductInfo(productInfo);
        shoppingCart.setQuantity(Integer.parseInt(quantity));
        shoppingCart.setAddedAt(Timestamp.from(Instant.now()));
        if(user.getShoppingCart() == null)
        {
            user.setShoppingCart(new ArrayList<ShoppingCart>());
            user.getShoppingCart().add(shoppingCart);
        }
        else
        {
            user.getShoppingCart().add(shoppingCart);
        }
        em.persist(shoppingCart);
        transaction.commit();
        System.out.println("item ID" + shoppingCart.getItemId());
    }
    
    public static void updateQuantity(String userId, String productInfoId, String quantity, EntityManager em) {
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
    
            Query query = em.createQuery(
                "select sh from ShoppingCart sh where sh.user.userId = :userId and sh.productInfo.productInfoId = :productInfoId"
            );
            query.setParameter("userId", Integer.valueOf(userId));
            query.setParameter("productInfoId", Integer.valueOf(productInfoId));
    
            ShoppingCart shoppingCart = (ShoppingCart) query.getSingleResult();
    
            if (shoppingCart != null) {
                shoppingCart.setQuantity(Integer.parseInt(quantity));
                em.merge(shoppingCart);
                System.out.println("updated successfully");
            }
    
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
    }
    
}
