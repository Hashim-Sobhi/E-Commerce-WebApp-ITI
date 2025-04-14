package iti.jets.model.mappers;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;

import iti.jets.model.dtos.OrderDTO;
import iti.jets.model.dtos.UserAddressDTO;
import iti.jets.model.dtos.UserDTO;
import iti.jets.model.dtos.UserProfileDataDTO;
import iti.jets.model.entities.User;
import iti.jets.model.entities.UserAddress;

public class UserMapper {

    public static User toEntity(UserDTO userDto) {
        System.out.println("I am in User Mapper");

         if(userDto == null){
             return null;
         }
        User user = new User();
        // user.setUserId(userDto.getUserId());
        user.setName(userDto.getName());
        user.setEmail(userDto.getEmail());
        user.setPhoneNumber(userDto.getPhoneNumber());
        user.setJob(userDto.getJob());
        user.setBirthdate(userDto.getBirthDate());
        user.setInterests(userDto.getInterests());
        user.setCreditLimit(userDto.getCreditLimit());
        user.setCreatedAt(Timestamp.from(Instant.now()));
        user.setAddresses(new ArrayList<UserAddress>());
        userDto.getAddresses().forEach(ua -> {
            UserAddress userAddress = AddressMapper.toEntity(ua);
            userAddress.setUser(user);
            user.getAddresses().add(userAddress);
        });

        return user;
    }

    public static UserDTO toDto(User userEntity) {
        System.out.println("I am in User Mapper");

         if(userEntity == null){
             return null;
         }
        UserDTO userDto = new UserDTO();
        userDto.setUserId(userEntity.getUserId());
        userDto.setName(userEntity.getName());
        userDto.setEmail(userEntity.getEmail());
        userDto.setPhoneNumber(userEntity.getPhoneNumber());
        userDto.setJob(userEntity.getJob());
        userDto.setBirthDate(userEntity.getBirthdate());
        userDto.setInterests(userEntity.getInterests());
        userDto.setCreditLimit(userEntity.getCreditLimit());
        userEntity.getAddresses().forEach(ue -> {
            UserAddressDTO userAddressDTO = AddressMapper.toDto(ue);
            userDto.getAddresses().add(userAddressDTO);
        });
        // userDto.setCreatedAt(userEntity.getCreatedAt());
        // userDto.setAddress(AddressMapper.toDto(userEntity.getAddress()));

        return userDto;
    }

    public static UserProfileDataDTO toUserProfileDataDTO(User user) {
        UserProfileDataDTO userProfileDataDTO = new UserProfileDataDTO();
        userProfileDataDTO.setUserId(user.getUserId());
        userProfileDataDTO.setName(user.getName());
        userProfileDataDTO.setEmail(user.getEmail());
        userProfileDataDTO.setPhoneNumber(user.getPhoneNumber());
        userProfileDataDTO.setJob(user.getJob());
        userProfileDataDTO.setBirthdate(user.getBirthdate());
        userProfileDataDTO.setInterests(user.getInterests());
        userProfileDataDTO.setCreditLimit(user.getCreditLimit());
        userProfileDataDTO.setAddresses(new ArrayList<>());
        user.getAddresses().forEach(ua -> {
            UserAddressDTO userAddressDTO = AddressMapper.toDto(ua);
            userProfileDataDTO.getAddresses().add(userAddressDTO);
        });
        userProfileDataDTO.setOrders(new ArrayList<>());
        user.getOrders().forEach(o -> {
            OrderDTO orderDTO = OrderMapper.toOrderDTO(o);
            userProfileDataDTO.getOrders().add(orderDTO);
        });
        return userProfileDataDTO;
    }
    
}
