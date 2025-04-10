package iti.jets.servlets;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.mappers.ProductMapper;
import iti.jets.services.ProductService;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/filter")
public class ShopServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        String[] brands = request.getParameterValues("brand");
        String[] sizes = request.getParameterValues("size");
        String[] colors = request.getParameterValues("color");
        System.out.println("Brand: " + Arrays.toString(brands));
        System.out.println("Size: " + Arrays.toString(sizes));
        System.out.println("Color: " + Arrays.toString(colors));


        List<ProductSummaryDTO> productSummaries = ProductService.getFilteredProducts(brands, sizes, colors, (EntityManager) request.getAttribute("entityManager"));
        if(productSummaries.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }else{
            Jsonb jsonb = JsonbBuilder.create();
            String json = jsonb.toJson(productSummaries);
            resp.setContentType("application/json");
            resp.getWriter().write(json);
        }
    }
}
