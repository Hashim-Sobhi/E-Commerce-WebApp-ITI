package iti.jets.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mysql.cj.conf.ConnectionUrlParser.Pair;

import iti.jets.model.dtos.ShoppingCartDTO;
import iti.jets.model.dtos.ShoppingCartSummaryDTO;
import iti.jets.model.entities.ShoppingCart;
import iti.jets.services.CartService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String cart = request.getParameter("cart");
        String quantity = request.getParameter("quantity");
        if (cart != null)
        {
            List<String> cartItems = new ArrayList<>(Arrays.asList(cart.split(",")));
            List<String> quantities = new ArrayList<>(Arrays.asList(quantity.split(",")));


            if(cartItems.size() > 0)
            {
                List<ShoppingCartDTO> shoppingCartdto = CartService.getAllItems(cartItems , quantities,  (EntityManager) request.getAttribute("entityManager"));
                for (ShoppingCartDTO sh : shoppingCartdto) {
                }
                

                // Convert `shoppingCartdto` list to JSON and send it as response
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                Gson gson = new Gson();
                String shoppingCartJSON = gson.toJson(shoppingCartdto);
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

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemsJson = req.getParameter("items");

        if (itemsJson != null && !itemsJson.isEmpty()) {
            Gson gson = new Gson();

            Type listType = new TypeToken<List<ShoppingCartSummaryDTO>>() {}.getType();
            List<ShoppingCartSummaryDTO> items = gson.fromJson(itemsJson, listType);


            for(ShoppingCartSummaryDTO item : items){
                String user_id = req.getSession().getAttribute("user_id").toString();
                String product_id = item.getProduct_id().toString();
                String product_info_id = item.getProductInfoId().toString();
                String quantity = item.getQuantity().toString();
                CartService.addToCart(user_id, product_id, product_info_id, quantity, (EntityManager) req.getAttribute("entityManager"));
            }
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write("{\"message\": \"Cart received successfully\"}");
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"error\": \"No cart data received\"}");
        }
    }

}
