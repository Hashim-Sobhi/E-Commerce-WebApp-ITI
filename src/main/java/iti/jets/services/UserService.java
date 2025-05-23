package iti.jets.services;

import iti.jets.model.dtos.ShoppingCartSummaryDTO;
import iti.jets.model.dtos.UserDTO;
import iti.jets.model.dtos.WishlistDTO;
import iti.jets.model.dtos.UserManageDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.User;
import iti.jets.model.mappers.ProductMapper;
import iti.jets.model.mappers.UserMapper;
import iti.jets.repositories.UserRepository;
import jakarta.persistence.EntityManager;

import java.util.ArrayList;
import java.util.List;

public class UserService {

    public static List<UserManageDTO> getAllUserManageDTOs(EntityManager em) {
        List<User> users = UserRepository.getAllUsers(em);
        List<UserManageDTO> manageDTOs = new ArrayList<>();
        for (User user : users) {
            manageDTOs.add(UserMapper.toUserManageDTO(user));
        }
        return manageDTOs;
    }

    public static int register(UserDTO userDto , String password, EntityManager em)
    {
        System.out.println("I am in register Service");

        User userEntity = UserMapper.toEntity(userDto);
        userEntity.setPassword(password);
        return UserRepository.addNewUser(userEntity, em);
    }

    public static UserDTO login(String email , String password , EntityManager em)
    {
        User userEntity = UserRepository.findUserByEmailAndPassword(email, password, em) ;
        if(userEntity == null){
            return null;
        }
        UserDTO userdto = UserMapper.toDto(userEntity);
        if(userdto == null){
            return null;
        }

        userEntity.getShoppingCart().forEach(cartItem -> {
            ShoppingCartSummaryDTO summaryDTO = new ShoppingCartSummaryDTO();
            summaryDTO.setQuantity(cartItem.getQuantity());
            summaryDTO.setProduct_id(cartItem.getProductInfo().getProduct().getProduct_id());
            summaryDTO.setProductInfoId(cartItem.getProductInfo().getProductInfoId());
            userdto.getCartItems().add(summaryDTO);
        });

        userEntity.getWishlist().forEach(item -> {
           WishlistDTO wishlistDTO = new WishlistDTO();
           wishlistDTO.setProductId(item.getProduct().getProduct_id());
           userdto.getWishlist().add(wishlistDTO);
        });

        return userdto;
    }

    public static boolean validateEmail(String email , EntityManager em)
    {
        return UserRepository.findEmail(email , em);
    }

}
