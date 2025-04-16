package iti.jets.services;

import iti.jets.model.dtos.UserAddressDTO;
import iti.jets.model.dtos.UserProfileDataDTO;
import iti.jets.model.entities.User;
import iti.jets.model.entities.UserAddress;
import iti.jets.model.mappers.AddressMapper;
import iti.jets.model.mappers.UserMapper;
import iti.jets.repositories.ProfileRepository;
import iti.jets.repositories.UserRepository;
import jakarta.persistence.EntityManager;

import java.util.ArrayList;

public class ProfileService {
    public static UserProfileDataDTO getUserData(Integer user_id, EntityManager em) {
        User user = ProfileRepository.getProfileUserData(user_id, em);
        if(user == null) {
            return null;
        }
        return UserMapper.toUserProfileDataDTO(user);
    }

    public static Boolean updateUserData(UserProfileDataDTO userDto, EntityManager em) {
        User existingUser = ProfileRepository.getProfileUserData(userDto.getUserId(), em);
        if(existingUser == null) {
            return false;
        }

        existingUser.setName(userDto.getName());
        existingUser.setEmail(userDto.getEmail());
        existingUser.setPhoneNumber(userDto.getPhoneNumber());
        existingUser.setJob(userDto.getJob());
        existingUser.setBirthdate(userDto.getBirthdate());
        existingUser.setInterests(userDto.getInterests());
        existingUser.setCreditLimit(userDto.getCreditLimit());
        existingUser.getAddresses().clear();
        for (UserAddressDTO ua : userDto.getAddresses()) {
            UserAddress userAddress = new UserAddress();
            userAddress.setAddressId(ua.getAddressId()==-1?null:ua.getAddressId());
            userAddress.setBuildingNumber(ua.getBuildingNumber());
            userAddress.setStreet(ua.getStreet());
            userAddress.setState(ua.getState());
            userAddress.setIsDefault(ua.isDefault());
            userAddress.setUser(existingUser);

            existingUser.getAddresses().add(userAddress);
        }
        return ProfileRepository.updateUserData(existingUser, em);
    }
}
