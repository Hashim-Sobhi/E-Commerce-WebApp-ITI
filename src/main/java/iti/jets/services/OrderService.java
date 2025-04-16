package iti.jets.services;

import iti.jets.model.entities.Order;
import iti.jets.repositories.OrderRepository;
import jakarta.persistence.EntityManager;

import java.util.List;

public class OrderService {
    public static List<Order> getAllOrders(EntityManager em) {
        return OrderRepository.getAllOrders(em);
    }
}
