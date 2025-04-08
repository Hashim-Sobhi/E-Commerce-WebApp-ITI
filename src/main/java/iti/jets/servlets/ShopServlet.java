package iti.jets.servlets;

import iti.jets.entities.Product;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
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

        String path = getServletContext().getRealPath("/json/products.json");
        Jsonb jsonb = JsonbBuilder.create();
        List<Product> products = jsonb.fromJson(new FileReader(path), new ArrayList<Product>() {}.getClass().getGenericSuperclass());
        if(products.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }else{
            String json = jsonb.toJson(products);
            resp.setContentType("application/json");
            resp.getWriter().write(json);
        }
    }
}
