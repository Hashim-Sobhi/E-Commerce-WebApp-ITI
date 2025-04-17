package iti.jets.servlets;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.entities.Order;
import iti.jets.model.enums.OrderStatus;
import iti.jets.services.OrderService; // or you could use ProductService if OrderService is not separate
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        String statusStr = request.getParameter("orderStatus");
        if(orderIdStr == null || statusStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Order ID and status are required");
            return;
        }
        int orderId = Integer.parseInt(orderIdStr);
        OrderStatus newStatus = OrderStatus.valueOf(statusStr);

        EntityManager em = DatabaseManager.getEntityManager();
        try {
            em.getTransaction().begin();
            // Fetch the order from the database
            Order order = em.find(Order.class, orderId);
            if (order == null) {
                em.getTransaction().rollback();
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
                return;
            }
            // Update the order status
            order.setOrderStatus(newStatus);
            em.merge(order);
            em.getTransaction().commit();
        } catch(Exception ex) {
            em.getTransaction().rollback();
            throw new ServletException("Error updating order status", ex);
        } finally {
            em.close();
        }
        // Redirect back to the same admin page for users and orders
        response.sendRedirect("adminuser");
    }
}
