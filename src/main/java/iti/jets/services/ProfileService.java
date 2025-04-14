package iti.jets.services;

import iti.jets.model.dtos.UserProfileDataDTO;
import iti.jets.model.entities.User;
import iti.jets.model.mappers.UserMapper;
import iti.jets.repositories.ProfileRepository;
import jakarta.persistence.EntityManager;

public class ProfileService {
    public static UserProfileDataDTO getUserData(Integer user_id, EntityManager em) {
        User user = ProfileRepository.getProfileUserData(user_id, em);
        if(user == null) {
            return null;
        }
        return UserMapper.toUserProfileDataDTO(user);
    }
}
