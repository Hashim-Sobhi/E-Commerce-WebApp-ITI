package iti.jets.model.dtos;

import lombok.*;

@Data
public class UserAddressDTO {
    private int addressId;
    private int buildingNumber;
    private String street;
    private String state;
    private boolean isDefault;
}
