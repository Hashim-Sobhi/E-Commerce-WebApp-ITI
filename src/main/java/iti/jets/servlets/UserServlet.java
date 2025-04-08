package iti.jets.servlets;


import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import iti.jets.dao.UserDao;
import iti.jets.model.entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    // Utility method to hash the password
    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = digest.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashedBytes) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String password = request.getParameter("password"); // Get password
            String hashedPassword = hashPassword(password); // Hash the password
            String job = request.getParameter("job");
            String phone = request.getParameter("phone");

            User newUser = new User(0, fname, lname, email, hashedPassword, job, phone); // Use hashed password
            userDao.addUser(newUser);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String job = request.getParameter("job");
            String phone = request.getParameter("phone");

            // Check if password is being updated
            String password = request.getParameter("password");
            String hashedPassword = (password != null && !password.isEmpty()) ? hashPassword(password) : null;

            User updatedUser = new User(id, fname, lname, email, hashedPassword, job, phone);
            userDao.updateUser(updatedUser);
        }

        response.sendRedirect("userManagement.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            userDao.deleteUser(id);
        }

        response.sendRedirect("userManagement.jsp");
    }
}
