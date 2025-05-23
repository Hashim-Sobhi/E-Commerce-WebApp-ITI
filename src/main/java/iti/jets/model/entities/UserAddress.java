package iti.jets.model.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "UserAddress")
public class UserAddress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id")
    private Integer addressId;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "state", nullable = false, length = 50)
    private String state;

    @Column(name = "street", nullable = false, columnDefinition = "TEXT")
    private String street;

    @Column(name = "building_number", nullable = false)
    private Integer buildingNumber;

    @Column(name = "is_default", nullable = false)
    private Boolean isDefault;

    // constructors
    public UserAddress() {
    }

    public UserAddress(Integer addressId, User user, String state, String street, Integer buildingNumber, Boolean isDefault) {
        this.addressId = addressId;
        this.user = user;
        this.state = state;
        this.street = street;
        this.buildingNumber = buildingNumber;
        this.isDefault = isDefault;
    }

    public UserAddress(User user, String state, String street, Integer buildingNumber, Boolean isDefault) {
        this.user = user;
        this.state = state;
        this.street = street;
        this.buildingNumber = buildingNumber;
        this.isDefault = isDefault;
    }

    // Getters and setters
    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public Integer getBuildingNumber() {
        return buildingNumber;
    }

    public void setBuildingNumber(Integer buildingNumber) {
        this.buildingNumber = buildingNumber;
    }

    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }
}