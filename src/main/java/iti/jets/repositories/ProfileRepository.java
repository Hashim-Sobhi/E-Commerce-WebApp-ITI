package iti.jets.repositories;

import iti.jets.model.entities.User;
import jakarta.persistence.EntityManager;

public class ProfileRepository {
    public static User getProfileUserData(Integer user_id, EntityManager em) {

        try{
            return em.find(User.class, user_id);
        }catch(Exception e){
            return null;
        }
    }
}
