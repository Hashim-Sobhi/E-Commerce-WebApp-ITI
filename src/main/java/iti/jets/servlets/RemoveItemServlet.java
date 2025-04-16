package iti.jets.servlets;

import java.io.IOException;

import iti.jets.services.CartService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RemoveItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String product_id = req.getParameter("product_id"); 
        String product_info_id = req.getParameter("product_info_id");

        CartService.removeItem(userId ,  product_id , product_info_id , (EntityManager) req.getAttribute("entityManager"));
    }
    
}
