package iti.jets.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.google.gson.Gson;
import com.mysql.cj.conf.ConnectionUrlParser.Pair;

import iti.jets.model.dtos.ShoppingCartDTO;
import iti.jets.model.entities.ShoppingCart;
import iti.jets.services.CartService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String cart = request.getParameter("cart");
        String quantity = request.getParameter("quantity");
        System.out.println(cart);
        if (cart != null) 
        {
            List<String> cartItems = new ArrayList<>(Arrays.asList(cart.split(",")));
            List<String> quantities = new ArrayList<>(Arrays.asList(quantity.split(",")));

    
            System.out.println("1------");
            System.out.println(cartItems);
            System.out.println("2------");
            if(cartItems.size() > 0)
            {
                List<ShoppingCartDTO> shoppingCartdto = CartService.getAllItems(cartItems , quantities,  (EntityManager) request.getAttribute("entityManager"));
                System.out.println("size = " +shoppingCartdto.size());
                System.out.println("3------");
                for (ShoppingCartDTO sh : shoppingCartdto) {
                    System.out.println(sh);
                }
                
                System.out.println("4------");

                // Convert `shoppingCartdto` list to JSON and send it as response
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                Gson gson = new Gson();
                String shoppingCartJSON = gson.toJson(shoppingCartdto);
                System.out.println(shoppingCartJSON);
                response.getWriter().write(shoppingCartJSON);
            }   
            else 
            {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Cart is empty.\"}");
            }
        }   
        else 
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Cart parameter not found.\"}");
        }
                    
            
            // System.out.println("Received Cart Items: " + cartItems);
            
            // for (String item : cartItems) {
            //     System.out.println("Cart Item: " + item);
            // }

        
     

        // /// from json file 
        // response.setContentType("application/json");
        // response.setCharacterEncoding("UTF-8");

        // // Get the absolute path of products.json inside webapp
        // String filePath = getServletContext().getRealPath("/json/items.json");

        // File file = new File(filePath);
        // if (!file.exists()) {
        //     response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        //     response.getWriter().write("{\"error\": \"File not found\"}");
        //     return;
        // }

       
        // String jsonData = new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);

        // // Send JSON response
        // PrintWriter out = response.getWriter();
        // out.print(jsonData);
        // out.flush();
    }
    
}
