package iti.jets.model.dtos;

import iti.jets.model.enums.OrderStatus;
import lombok.Data;

import java.math.BigDecimal;
import java.sql.Timestamp;

@Data
public class OrderDTO {
    private Integer orderId;

    private BigDecimal totalAmount;

    private Timestamp createdAt;

    private OrderStatus orderStatus;

}
