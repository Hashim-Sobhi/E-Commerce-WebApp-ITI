package iti.jets.servlets;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.dtos.UserManageDTO;
import iti.jets.services.UserService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


public class UserManagementServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = DatabaseManager.getEntityManager();
        try {
            List<UserManageDTO> userList = UserService.getAllUserManageDTOs(em);
            if (userList == null || userList.isEmpty()) {
                System.out.println("No Users found.");
            }

            req.setAttribute("users", userList);
            req.getRequestDispatcher("adminUser.jsp").forward(req, resp);
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
