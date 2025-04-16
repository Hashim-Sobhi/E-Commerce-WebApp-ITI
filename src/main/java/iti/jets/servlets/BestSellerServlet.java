package iti.jets.servlets;

import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.services.ProductService;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/bestSellerServlet")
public class BestSellerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = (EntityManager) request.getAttribute("entityManager");
        List<ProductSummaryDTO> productSummaries = ProductService.getBestSellerProducts(em);
        response.setContentType("application/json");
        Jsonb jsonb = JsonbBuilder.create();
        PrintWriter out = response.getWriter();
        out.write(jsonb.toJson(productSummaries));
    }
}
