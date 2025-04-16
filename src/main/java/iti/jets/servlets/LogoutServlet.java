package iti.jets.servlets;

import iti.jets.Managers.SessionManager;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clientUserId = request.getParameter("user_id");

        HttpSession session = request.getSession(false);

        if (session != null) {
            Integer sessionUserId = (Integer) session.getAttribute("user_id");
            // Validate if the user ID from the client matches the one in the session
            if (sessionUserId != null && sessionUserId.equals(Integer.parseInt(clientUserId))) {

                session.invalidate();
                Cookie [] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("sessionID") && cookie.getValue() != null &&
                                SessionManager.isSessionValid(cookie.getValue())) {
                            SessionManager.removeSession(cookie.getValue());
                        }
                    }
                }
                Cookie sessionCookie = new Cookie("sessionID", "");
                sessionCookie.setMaxAge(0); // Expire the cookie
                sessionCookie.setPath("/project");
                response.addCookie(sessionCookie);

                response.setContentType("application/json");
                response.getWriter().write("{\"message\": \"Logged out successfully\"}");
            } else {
                // If IDs don't match, return an error response
                response.setContentType("application/json");
                response.getWriter().write("{\"errorMessage\": \"User ID mismatch. Logout failed.\"}");
            }
        } else {
            // No session found, handle appropriately
            response.setContentType("application/json");
            response.getWriter().write("{\"errorMessage\": \"No active session found.\"}");
        }
    }
}
