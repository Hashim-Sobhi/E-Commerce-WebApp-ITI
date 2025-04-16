package iti.jets.servlets;


import com.google.gson.Gson;
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
import java.util.List;

@WebServlet("/searchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("query");
        if(query == null || query.isEmpty()){
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "missing query");
        }

        List<ProductSummaryDTO> productSummaries = ProductService.getSearchProducts(
               query , (EntityManager) req.getAttribute("entityManager"));
        Gson gson = new Gson();
        String json = gson.toJson(productSummaries);
        resp.getWriter().write(json);
    }
}
