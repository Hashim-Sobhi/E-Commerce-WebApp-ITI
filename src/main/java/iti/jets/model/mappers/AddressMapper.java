package iti.jets.model.mappers;

import iti.jets.model.dtos.UserAddressDTO;
import iti.jets.model.entities.UserAddress;

public class AddressMapper {
     public static UserAddress toEntity(UserAddressDTO addressDto) {
        if(addressDto == null){
            return null;
        }
        UserAddress address = new UserAddress();
        // address.setAddressId(addressDto.getAddressId());
        address.setBuildingNumber(addressDto.getBuildingNumber());
        address.setStreet(addressDto.getStreet());
        address.setState(addressDto.getState());
        address.setIsDefault(true);
        return address;
    }

    public static UserAddressDTO toDto(UserAddress userAddressEntity) {
        if(userAddressEntity == null){
            return null;
        }
        UserAddressDTO userAddressDto = new UserAddressDTO();
        userAddressDto.setAddressId(userAddressEntity.getAddressId());
        userAddressDto.setBuildingNumber(userAddressEntity.getBuildingNumber());
        userAddressDto.setStreet(userAddressEntity.getStreet());
        userAddressDto.setState(userAddressEntity.getState());
        userAddressDto.setDefault(userAddressEntity.getIsDefault());
        return userAddressDto ;
    }
}
