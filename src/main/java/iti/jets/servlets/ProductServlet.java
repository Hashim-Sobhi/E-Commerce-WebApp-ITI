//package iti.jets.servlets;
//
//import iti.jets.dao.ProductDao;
//import iti.jets.model.entities.Product;
//import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/ProductServlet")
//public class ProductServlet extends HttpServlet {
//    private ProductDao productDao;
//
//    public void init() {
//        productDao = new ProductDao();
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if ("add".equals(action)) {
//            String name = request.getParameter("name");
//            String description = request.getParameter("description");
//            double price = Double.parseDouble(request.getParameter("price"));
//            String category = request.getParameter("category");
//            String gender = request.getParameter("gender");
//
//            Product newProduct = new Product(0, name, description, price, category, gender);
//
//            productDao.addProduct(newProduct);
//        } else if ("edit".equals(action)) {
//            int productId = Integer.parseInt(request.getParameter("product_id"));
//            String name = request.getParameter("name");
//            String description = request.getParameter("description");
//            double price = Double.parseDouble(request.getParameter("price"));
//            String category = request.getParameter("category");
//            String gender = request.getParameter("gender");
//
//            Product updatedProduct = new Product(productId, name, description, price, category, gender);
//
//            productDao.updateProduct(updatedProduct);
//        }
//
//        response.sendRedirect("productManagement.jsp");
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if ("delete".equals(action)) {
//            int productId = Integer.parseInt(request.getParameter("product_id"));
//            productDao.deleteProduct(productId);
//        }
//
//        response.sendRedirect("productManagement.jsp");
//    }
//}
