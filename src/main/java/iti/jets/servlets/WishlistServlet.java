package iti.jets.servlets;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.model.dtos.ShoppingCartSummaryDTO;
import iti.jets.model.dtos.WishlistDTO;
import iti.jets.services.WishlistService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

@WebServlet("/wishlistServlet")
public class WishlistServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemsJson = req.getParameter("items");
        Integer user_id = (Integer) req.getSession().getAttribute("user_id");
        EntityManager em = (EntityManager)req.getAttribute("entityManager");

        if(itemsJson == null || itemsJson.isEmpty()){
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "items is Empty");
        }
        Gson gson = new Gson();
        Type listType = new TypeToken<List<WishlistDTO>>() {}.getType();
        List<WishlistDTO> items = gson.fromJson(itemsJson, listType);

        if(WishlistService.addToWishlist(user_id, items, em)){
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write("items added");
        }
        resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while adding wishlist");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemsJson = req.getParameter("items");
        EntityManager em = (EntityManager)req.getAttribute("entityManager");

        if(itemsJson == null || itemsJson.isEmpty()){
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "items is Empty");
        }
        Gson gson = new Gson();
        Type listType = new TypeToken<List<WishlistDTO>>() {}.getType();
        List<WishlistDTO> items = gson.fromJson(itemsJson, listType);

        List<ProductSummaryDTO> productSummaryDTOS =
                WishlistService.getItems(items, em);
        if(productSummaryDTOS.isEmpty()){
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "products is Empty");
        }
        resp.setContentType("application/json");
        resp.getWriter().write(gson.toJson(productSummaryDTOS));
    }
}
