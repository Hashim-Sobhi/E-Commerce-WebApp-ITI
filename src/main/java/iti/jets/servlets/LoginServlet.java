package iti.jets.servlets;

import java.io.IOException;

import iti.jets.model.dtos.UserDTO;
import iti.jets.services.UserService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");

        String email = req.getParameter("email");
        String password = req.getParameter("password"); 

        UserDTO loggedUser = UserService.login(email, password, (EntityManager) req.getAttribute("entityManager")) ;

        if(loggedUser != null)
        {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("{ \"userId\": \"" + loggedUser.getUserId() + "\" }");
            return;
        }
        else {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("{ \"errorMessage\": \"Incorrect email or password. Please try again.\" }");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().write("get Method");      
    }


}

