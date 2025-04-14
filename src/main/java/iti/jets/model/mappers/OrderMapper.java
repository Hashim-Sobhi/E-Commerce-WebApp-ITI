package iti.jets.model.mappers;

import iti.jets.model.dtos.OrderDTO;
import iti.jets.model.entities.Order;

public class OrderMapper {
    public static OrderDTO toOrderDTO(Order order) {
        OrderDTO dto = new OrderDTO();
        dto.setOrderId(order.getOrderId());
        dto.setTotalAmount(order.getTotalAmount());
        dto.setCreatedAt(order.getCreatedAt());
        dto.setOrderStatus(order.getOrderStatus());
        return dto;
    }
}
