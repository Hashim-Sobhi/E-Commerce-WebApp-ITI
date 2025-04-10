package iti.jets.model.entities;

import iti.jets.model.enums.OrderStatus;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "`Order`")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer orderId;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "total_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalAmount;

    @Column(name = "created_at", nullable = false)
    private Timestamp createdAt;

    @ManyToOne
    @JoinColumn(name = "address_id", nullable = false)
    private UserAddress userAddress;

    @Enumerated(EnumType.STRING)
    @Column(name = "order_status", nullable = false,
    columnDefinition = """
    ENUM('PENDING', 'CONFIRMED', 'SHIPPED', 'DELIVERED', 'CANCELLED', 'RETURNED') DEFAULT 'PENDING'
    """
    )
    private OrderStatus orderStatus = OrderStatus.PENDING;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderItem> orderItems;

    // constructors
    public Order() {
    }

    public Order(Integer orderId, User user, BigDecimal totalAmount, Timestamp createdAt, UserAddress userAddress, OrderStatus orderStatus) {
        this.orderId = orderId;
        this.user = user;
        this.totalAmount = totalAmount;
        this.createdAt = createdAt;
        this.userAddress = userAddress;
        this.orderStatus = orderStatus;
    }
    public Order(User user, BigDecimal totalAmount, Timestamp createdAt, UserAddress userAddress, OrderStatus orderStatus) {
        this.user = user;
        this.totalAmount = totalAmount;
        this.createdAt = createdAt;
        this.userAddress = userAddress;
        this.orderStatus = orderStatus;
    }

    // Getters and setters
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public UserAddress getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(UserAddress userAddress) {
        this.userAddress = userAddress;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

}
