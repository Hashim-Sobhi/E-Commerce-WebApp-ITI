package iti.jets.servlets;

import java.io.IOException;
import java.util.List;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.dtos.UserManageDTO;
import iti.jets.model.entities.Order;
import iti.jets.model.enums.OrderStatus;
import iti.jets.services.OrderService;
import iti.jets.services.UserService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class OrderManagmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = DatabaseManager.getEntityManager();
        try {
            List<UserManageDTO> userList = UserService.getAllUserManageDTOs(em);
            if (userList == null || userList.isEmpty()) {
                System.out.println("No Users found.");
            }

            List<Order> orderList = OrderService.getAllOrders(em);
            req.setAttribute("orders", orderList);
            req.setAttribute("users", userList);
            req.setAttribute("orderStatuses", OrderStatus.values());
            req.getRequestDispatcher("adminOrder.jsp").forward(req, resp);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public void destroy() {
        DatabaseManager.close();
    }

}
