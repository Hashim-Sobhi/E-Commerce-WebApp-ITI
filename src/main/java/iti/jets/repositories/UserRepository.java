package iti.jets.repositories;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;


import com.mysql.cj.util.DnsSrv.SrvRecord;

import iti.jets.model.dtos.UserDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.User;
import jakarta.persistence.*;

public class UserRepository {
    public static int addNewUser(User newUser , EntityManager em)
    {
        System.out.println("I am in User Repo");
        EntityTransaction transaction = em.getTransaction();
        if(em.contains(newUser))
        {
            return -1;
        } 
        transaction.begin();
        // newUser.getAddress().setUser(newUser);
        em.persist(newUser);
        transaction.commit();
        return newUser.getUserId();
    }

    public static User findUserByEmailAndPassword(String email , String password , EntityManager em)
    {
        Query query = em.createQuery("from User u where u.email= :email and password= :password");
        query.setParameter("email", email);
        query.setParameter("password", password);
        try
        {
            return (User)query.getSingleResult();
        }
        catch(NoResultException ex)
        {
            return null;
        }
    }

    public static boolean findEmail(String email , EntityManager em)
    {
        try{
            Query query = em.createQuery("from User u where u.email= :email");
            query.setParameter("email", email);
            User user = (User)query.getSingleResult();
            return false;
            
        }
        catch(NoResultException ex)
        {
            return true;
        }
    }
    public static List<User> getAllUsers(EntityManager em) {
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u", User.class);
        return query.getResultList();
    }

}
