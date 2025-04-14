package iti.jets.services;


import java.util.ArrayList;
import java.util.List;

import iti.jets.model.dtos.ProductInfoDTO;
import iti.jets.model.dtos.ShoppingCartDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductImg;
import iti.jets.model.entities.ProductInfo;
import iti.jets.model.entities.ShoppingCart;
import iti.jets.repositories.CartRepository;
import jakarta.persistence.EntityManager;

public class CartService {
   
   public static List<ShoppingCartDTO> getAllItems(List<String> cartItems, List<String> quantities , EntityManager em) {

        List<ShoppingCartDTO> shoppingCartDtos = new ArrayList<>();
        System.out.println("I am in cart service");
        for(int i =0 ; i < cartItems.size() ; i++)
        {
            ShoppingCartDTO item = new ShoppingCartDTO();
            Object[] productInfoAndProduct = CartRepository.getProductInfoAndProductByInfoId(Integer.parseInt(cartItems.get(i)), em);
            if(productInfoAndProduct != null)
            {
               ProductInfo productInfo = (ProductInfo)productInfoAndProduct[0];
               Product product = (Product)productInfoAndProduct[1];

                //    item.setItemId(product.getProduct_id());
                item.setName(product.getName());
                item.setPrice(product.getPrice());
                item.setImg(product.getProductImgs().stream()
                                .filter(ProductImg::getIsDefault)
                                .findFirst()
                                .map(ProductImg::getImg)
                                .orElse(""));
                item.setColor(productInfo.getColor());
                item.setSize(productInfo.getSize());    
                item.setQuantity(Integer.parseInt(quantities.get(i)));
                item.setItemId(productInfo.getProductInfoId());
                System.out.println(item.getName() + item.getSize() + item.getColor());
                shoppingCartDtos.add(item);
            }
        }
        return shoppingCartDtos ;

   }


   public static void addToCart(String userId , String productId , String productInfoId , String quantity , EntityManager em)
   {    System.out.println("I am in the cart service");
         CartRepository.addToCart(userId , productId , productInfoId , quantity , em);
   }

   public static void updateCart(String userId , String productId , String productInfoId , String quantity , EntityManager em)
   {
    System.out.println("I am in the update quantity service");
        CartRepository.updateQuantity(userId, productInfoId, quantity, em);
   }

}
