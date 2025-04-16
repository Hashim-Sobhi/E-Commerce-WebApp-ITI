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

    public static Boolean updateUserData(User existingUser, EntityManager em) {
        try{
            em.getTransaction().begin();
            em.merge(existingUser);
            em.getTransaction().commit();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            em.getTransaction().rollback();
            return false;
        }
    }
}
