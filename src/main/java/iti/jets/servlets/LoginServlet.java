package iti.jets.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import iti.jets.Managers.DatabaseManager;
import iti.jets.Managers.SessionManager;
import iti.jets.model.dtos.UserDTO;
import iti.jets.services.CartService;
import iti.jets.services.UserService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");

        String email = req.getParameter("email");
        String password = req.getParameter("password"); 

        String cart = req.getParameter("cart");
        String quantity = req.getParameter("quantity");
        System.out.println("cart in login servlet" + cart);


        UserDTO loggedUser = UserService.login(email, password, (EntityManager) req.getAttribute("entityManager")) ;

        if(loggedUser != null)
        {
            System.out.println("in servlet to check checkItemInShoppingCart method");
            if (cart != null)
            {
                List<String> cartItems = new ArrayList<>(Arrays.asList(cart.split(",")));
                List<String> quantities = new ArrayList<>(Arrays.asList(quantity.split(",")));

                boolean checked =  CartService.checkItemInShoppingCart(String.valueOf(loggedUser.getUserId()) , cartItems , quantities , (EntityManager) req.getAttribute("entityManager"));
                System.out.println("checked" + checked);

            }
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            Cookie [] cookies = req.getCookies();
            if(cookies != null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("sessionID") && cookie.getValue() != null &&
                            SessionManager.isSessionValid(cookie.getValue())){
                        SessionManager.removeSession(cookie.getValue());
                    }
                }
            }

            String sessionId = UUID.randomUUID().toString();
            Cookie sessionCookie = new Cookie("sessionID", sessionId);
            sessionCookie.setMaxAge(7 * 24 * 60 * 60);
            sessionCookie.setHttpOnly(true);
            sessionCookie.setSecure(true);
            sessionCookie.setPath("/project");
            sessionCookie.setAttribute("SameSite", "Strict");
            resp.addCookie(sessionCookie);
            HttpSession session = req.getSession(true);
            session.setAttribute("user_id", loggedUser.getUserId());
            SessionManager.addSession(sessionId, loggedUser.getUserId());
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