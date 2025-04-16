package iti.jets.repositories;

import iti.jets.model.dtos.WishlistDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.User;
import iti.jets.model.entities.Wishlist;
import jakarta.persistence.EntityManager;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class WishlistRepository {
    public static Boolean addToWishlist(Integer user_id, List<WishlistDTO> items, EntityManager em) {

        List<Integer> productIds  = items.stream().map(WishlistDTO::getProductId).toList();

        List<Product> products =
                em.createQuery("select p from Product p WHERE p.product_id IN :ids", Product.class)
                        .setParameter("ids", productIds)
                        .getResultList();
        if(products.isEmpty()){
            return false;
        }
        User user = em.find(User.class, user_id);
        if(user == null){
            return false;
        }
        if(user.getWishlist() == null){
            user.setWishlist(new ArrayList<>());
        }
        for(Product product : products){
            Wishlist wishlist = new Wishlist();
            wishlist.setProduct(product);
            wishlist.setUser(user);
            user.getWishlist().add(wishlist);
        }
        em.getTransaction().begin();
        em.merge(user);
        em.getTransaction().commit();
        return true;
    }

    public static List<Product> getItems(List<WishlistDTO> items, EntityManager em) {
        List<Integer> productIds  = items.stream().map(WishlistDTO::getProductId).toList();

        return em.createQuery("select p from Product p WHERE p.product_id IN :ids", Product.class)
                .setParameter("ids", productIds)
                .getResultList();
    }

    public static void removeItem(Integer userId, Integer productId, EntityManager em) {
        em.getTransaction().begin();

        User user = em.find(User.class, userId);
        if (user == null || user.getWishlist() == null) {
            em.getTransaction().commit();
            return;
        }

        Wishlist toRemove = null;
        for (Wishlist wishlist : user.getWishlist()) {
            if (wishlist.getProduct().getProduct_id().equals(productId)) {
                toRemove = wishlist;
                break;
            }
        }

        if (toRemove != null) {
            user.getWishlist().remove(toRemove);
            em.remove(em.contains(toRemove) ? toRemove : em.merge(toRemove));
            em.merge(user);
        }

        em.getTransaction().commit();
    }
}
