package iti.jets.repositories;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import iti.jets.model.entities.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;

public class CartRepository {
    
    public static Object[] getProductInfoAndProductByInfoId(Integer productInfoId, EntityManager em) {

        
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
            }
    
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
    }

    public static void removeItem(String userId , String productId , String productInfoId , EntityManager em)
    {   

        EntityTransaction transaction = em.getTransaction();

        try
        {
            transaction.begin();
            Query query = em.createQuery(
                "delete from ShoppingCart sh where sh.user.userId = :userId and sh.productInfo.productInfoId = :productInfoId"
            );

            query.setParameter("userId", Integer.valueOf(userId));
            query.setParameter("productInfoId", Integer.valueOf(productInfoId));


            int deletedCount = query.executeUpdate();

            transaction.commit();
        } 
        catch (Exception e) 
        {
            if (transaction.isActive()) 
            {
                transaction.rollback(); 
            }
        }
            
    }

    public static int placeOrder(String userId, String totalPayment ,EntityManager em) 
    {
        EntityTransaction transaction = em.getTransaction();

        try {
    
            User user = UserRepository.findUserById(userId, em);
            if(user.getCreditLimit().intValue() < Integer.parseInt(totalPayment))
            {
                
                return -1;
            }
            else
            {
                transaction.begin();

                Order order = new Order();
                order.setUser(user);
                // order.setAddresses(user.getAddresses().stream().filter(a -> a.getIsDefault()).findFirst());

                user.getAddresses().stream()
                .filter(UserAddress::getIsDefault)
                .findFirst()
                .ifPresent(order::setUserAddress);
                
                // order.setOrderStatus();
                order.setTotalAmount(BigDecimal.valueOf(Double.valueOf(totalPayment)));
                order.setCreatedAt(Timestamp.from(Instant.now()));
                if(user.getOrders() == null)
                {
                    user.setOrders(new ArrayList<Order>());
                    user.getOrders().add(order);                    
                }
                else
                {
                    user.getOrders().add(order);        
                }

                user.setCreditLimit(BigDecimal.valueOf(user.getCreditLimit().intValue() - Integer.parseInt(totalPayment)));
                em.persist(order);
                em.merge(user);

                transaction.commit();                 
                 try 
                {
                    transaction.begin();
                    Query query = em.createQuery("select sh from ShoppingCart sh where sh.user.userId = :userId");
                    query.setParameter("userId", userId);
                    List<ShoppingCart> shoppingCartList = query.getResultList();
                    transaction.commit();



                    for (ShoppingCart cart : shoppingCartList) 
                    {
                        ProductInfo productInfo= ProductRepository.getProductInfoById(cart.getProductInfo().getProductInfoId(), em);
                        productInfo.setQuantity(productInfo.getQuantity() - cart.getQuantity());
                        Product product = productInfo.getProduct();
                        product.setSold(product.getSold() + cart.getQuantity());
                        transaction.begin();
                        OrderItem orderItem = new OrderItem();
                        orderItem.setOrder(order);
                        orderItem.setProductInfo(productInfo);
                        orderItem.setPriceAtPurchase(BigDecimal.valueOf(Double.valueOf(totalPayment)));
                        orderItem.setQuantity(cart.getQuantity());
                        em.persist(orderItem);
                        em.merge(product);
                        transaction.commit();
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }
                
            }
            
            removeAllItems(userId, em);
        }
        catch (Exception e) 
        {
            if (em.getTransaction().isActive()) 
            {
                em.getTransaction().rollback();
            }
        }
        return 1;

    }
    
    public static void removeAllItems(String userId , EntityManager em)
    {
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        Query query = em.createQuery("delete from ShoppingCart sh where sh.user.userId = :userId");
        query.setParameter("userId", userId);
        
        int rowsDeleted = query.executeUpdate();
        transaction.commit();
    }

    
}
