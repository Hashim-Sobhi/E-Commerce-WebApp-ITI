package iti.jets.servlets;

import iti.jets.services.WishlistService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class RemoveWishlist extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer productId = Integer.parseInt(req.getParameter("productId"));
        Integer user_id = (Integer)req.getSession().getAttribute("user_id");
        EntityManager em = (EntityManager)req.getAttribute("entityManager");

        WishlistService.removeItem(user_id, productId, em);
    }
}
