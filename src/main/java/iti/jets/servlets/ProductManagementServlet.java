package iti.jets.servlets;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.dtos.ProductManageDTO;
import iti.jets.services.ProductService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ProductManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = DatabaseManager.getEntityManager();
        try {
            List<ProductManageDTO> productList = ProductService.getAllProductManageDTOs(em);
            req.setAttribute("products", productList);
            req.getRequestDispatcher("/admin/product-management.jsp").forward(req, resp);
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
