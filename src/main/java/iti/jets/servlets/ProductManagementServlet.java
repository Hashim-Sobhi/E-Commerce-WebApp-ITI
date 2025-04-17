package iti.jets.servlets;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.dtos.ProductManageDTO;
import iti.jets.services.ProductService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

//@WebServlet("/admin/products")
public class ProductManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        EntityManager em = DatabaseManager.getEntityManager();
        List<ProductManageDTO> products;
        try {
            if (search != null && !search.trim().isEmpty()) {
                products = ProductService.searchProductsByName(search.trim(), em);
            } else {
                products = ProductService.getAllProductManageDTOs(em);
            }
        } finally {
            em.close();
        }
        req.setAttribute("products", products);
        req.setAttribute("search", search);      // so JSP can re‑show the term
        req.getRequestDispatcher("adminProduct.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        DatabaseManager.close();
    }
}
