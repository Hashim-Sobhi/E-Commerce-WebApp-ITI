package iti.jets.servlets;

import iti.jets.model.dtos.ProductDetailDTO;

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



@WebServlet("/productDetailServlet")
public class ProductDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product_id = req.getParameter("product_id");
        EntityManager em = (EntityManager) req.getAttribute("entityManager");
        try{
            Integer product_id_int = Integer.parseInt(product_id);
            ProductDetailDTO product_detail = ProductService.getProductDetail(product_id_int, em);
            if(product_detail==null){
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
            Jsonb jsonb = JsonbBuilder.create();
            String json = jsonb.toJson(product_detail);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
