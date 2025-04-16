package iti.jets.model.dtos;

import jakarta.json.bind.annotation.JsonbProperty;
import lombok.*;

@Data
public class UserAddressDTO {
    private int addressId;
    private int buildingNumber;
    private String street;
    private String state;
    private boolean isDefault;
}
