package iti.jets.repositories;

import iti.jets.model.entities.Order;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class OrderRepository {
    public static List<Order> getAllOrders(EntityManager em) {
        TypedQuery<Order> query = em.createQuery("SELECT o FROM Order o", Order.class);
        return query.getResultList();
    }
}
