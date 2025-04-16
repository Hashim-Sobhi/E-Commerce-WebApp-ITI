package iti.jets.servlets;

import java.io.IOException;

import iti.jets.services.CartService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PlaceOrderServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String totalAmount = req.getParameter("total");

        System.out.println("totalAmount :" + totalAmount);

        int placed = CartService.placeOrder(userId , totalAmount  ,(EntityManager) req.getAttribute("entityManager"));
        System.out.println("returned " + placed);

        if(placed == -1)
        {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"error\": \"Credit not enough.\"}");
        }
    }
}
