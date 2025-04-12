package iti.jets.model.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserAddressDTO {
    private int addressId;
    private int buildingNumber;
    private String street;
    private String state;
    private boolean isDefault;
}
