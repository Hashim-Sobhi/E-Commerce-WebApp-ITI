package iti.jets.servlets;


import java.io.IOException;

import iti.jets.dao.UserDao;
import iti.jets.entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        String fname = request.getParameter("fname");
//        String lname = request.getParameter("lname");
//        String address = request.getParameter("address");
//        double creditLimit = Double.parseDouble(request.getParameter("credit_limit"));
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        String job = request.getParameter("job");
//        String interest = request.getParameter("interest");
//        String birthdate = request.getParameter("birthdate");
//        String phone = request.getParameter("phone_number");
//
//        if (fname == null || lname == null || email == null || password == null || phone == null) {
//            request.setAttribute("error", "All fields are required!");
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//            return;
//        }
//
//        if (userDao.getUserByEmail(email) != null) {
//            request.setAttribute("error", "Email already exists!");
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//            return;
//        }
//
//        User newUser = new User(0, fname, lname, email, password, job, phone);
//
//        if (userDao.addUser(newUser)) {
//            response.sendRedirect("login.jsp");
//
//        } else {
//            request.setAttribute("error", "Registration failed. Please try again.");
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//        }
    }
}
