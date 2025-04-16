package iti.jets.listeners;

import iti.jets.Managers.DatabaseManager;
import iti.jets.Managers.SessionManager;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class RequestListener implements ServletRequestListener{

    @Override
    public void requestInitialized(ServletRequestEvent event) {
        HttpServletRequest request = (HttpServletRequest) event.getServletRequest();

        request.setAttribute("entityManager", DatabaseManager.getEntityManager());

        Cookie[] cookies = request.getCookies();
        String sessionID = null;

        if (cookies == null) {
            return;
        }

        for (Cookie cookie : cookies) {
            if ("sessionID".equals(cookie.getName())) {
                sessionID = cookie.getValue();
                break;
            }
        }

        if (sessionID == null) {
            return;
        }

        if (SessionManager.isSessionValid(sessionID)) {
            HttpSession session = request.getSession(false); // false to avoid creating a new session if none exists

            if (session == null) {
                session = request.getSession(true); // true to create a new session
            }

            session.setAttribute("user_id", SessionManager.getUserId(sessionID));
        }
    }

    @Override
    public void requestDestroyed(ServletRequestEvent event) {
        HttpServletRequest request = (HttpServletRequest) event.getServletRequest();
        EntityManager em = (EntityManager)request.getAttribute("entityManager");
        em.close();
    }
}