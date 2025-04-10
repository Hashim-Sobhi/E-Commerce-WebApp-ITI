package iti.jets.listeners;

import iti.jets.Managers.DatabaseManager;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;
import jakarta.servlet.http.HttpServletRequest;

public class RequestListener implements ServletRequestListener{

    @Override
    public void requestInitialized(ServletRequestEvent event) {
        HttpServletRequest request = (HttpServletRequest) event.getServletRequest();
        request.setAttribute("entityManager", DatabaseManager.getEntityManager());
    }

    @Override
    public void requestDestroyed(ServletRequestEvent event) {
        HttpServletRequest request = (HttpServletRequest) event.getServletRequest();
        EntityManager em = (EntityManager)request.getAttribute("entityManager");
        em.close();
    }
}