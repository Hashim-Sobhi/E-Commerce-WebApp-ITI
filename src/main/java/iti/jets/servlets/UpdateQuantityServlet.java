package iti.jets.servlets;

import java.io.IOException;

import iti.jets.services.CartService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateQuantityServlet")
public class UpdateQuantityServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String product_id = req.getParameter("product_id"); 
        String product_info_id = req.getParameter("product_info_id");
        String quantity = req.getParameter("quantity");

        CartService.updateCart(userId, product_id, product_info_id,  quantity, (EntityManager) req.getAttribute("entityManager"));
        
    }

    
    
}
