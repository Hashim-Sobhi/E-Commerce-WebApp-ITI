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
import java.util.Arrays;
import java.util.List;

@WebServlet("/filter")
public class ShopServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String[] brands = request.getParameterValues("brand");
        String[] sizes = request.getParameterValues("size");
        String[] colors = request.getParameterValues("color");
        String orderBy = request.getParameter("orderBy");
        String category = request.getParameter("category");
        String page = request.getParameter("page");
        System.out.println("Brand: " + Arrays.toString(brands));
        System.out.println("Size: " + Arrays.toString(sizes));
        System.out.println("Color: " + Arrays.toString(colors));
        System.out.println("OrderBy: " + orderBy);
        System.out.println("Category: " + category);
        System.out.println("Page: " + page);


        List<ProductSummaryDTO> productSummaries = ProductService.getFilteredProducts(
                brands, sizes, colors, orderBy, category, page, (EntityManager) request.getAttribute("entityManager"));
        Jsonb jsonb = JsonbBuilder.create();
        String json = jsonb.toJson(productSummaries);
        resp.setContentType("application/json");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        String[] brands = request.getParameterValues("brand");
        String[] sizes = request.getParameterValues("size");
        String[] colors = request.getParameterValues("color");
        String orderBy = request.getParameter("orderBy");
        String category = request.getParameter("category");
        String page = request.getParameter("page");

        Long noOfFilteredProducts = ProductService.getNoOfFilteredProducts(
                brands, sizes, colors, orderBy, category, page, (EntityManager) request.getAttribute("entityManager"));
        resp.setContentType("application/json");
        resp.getWriter().write(String.valueOf(noOfFilteredProducts));
    }
}

