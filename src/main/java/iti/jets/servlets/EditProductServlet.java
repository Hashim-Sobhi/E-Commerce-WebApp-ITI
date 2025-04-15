package iti.jets.servlets;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.dtos.ProductDetailDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductInfo;
import iti.jets.model.enums.Category;
import iti.jets.model.enums.Gender;
import iti.jets.model.enums.ShoeSize;
import iti.jets.services.ProductService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;


public class EditProductServlet extends HttpServlet {

    // GET: Load existing product data and forward to the edit form JSP
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product id is required");
            return;
        }
        int productId = Integer.parseInt(idParam);
        EntityManager em = DatabaseManager.getEntityManager();
        try {
            // Retrieve product details as a DTO (assumed to contain fields for basic info and at least one variation)
            Product productDetail = ProductService.getProductById(productId, em);
            if (productDetail == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }
            request.setAttribute("product", productDetail);
        } finally {
            em.close();
        }
        // Forward to the JSP form for editing
        request.getRequestDispatcher("editProductForm.jsp").forward(request, response);
    }

    // POST: Process the update, merging new values via ProductService
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract basic fields from the form
        int productId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String categoryParam = request.getParameter("category");
        Category category = Category.valueOf(categoryParam.toUpperCase());
        String genderParam = request.getParameter("gender");
        Gender gender = Gender.valueOf(genderParam.toUpperCase());
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String brand = request.getParameter("brand");
        String soldParam = request.getParameter("sold");
        int sold = (soldParam != null && !soldParam.isEmpty()) ? Integer.parseInt(soldParam) : 0;

        // Variation fields (assume updating the first variation)
        String colour = request.getParameter("colour");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String sizeParam = request.getParameter("size");
        ShoeSize size = ShoeSize.valueOf(sizeParam);

        Timestamp updatedAt = new Timestamp(System.currentTimeMillis());

        EntityManager em = DatabaseManager.getEntityManager();
        try {
            // Retrieve the existing product entity
            Product product = em.find(Product.class, productId);
            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }
            // Update basic fields
            product.setName(name);
            product.setDescription(description);
            product.setCategory(category);
            product.setGender(gender);
            product.setPrice(price);
            product.setBrand(brand);
            product.setSold(sold);
            product.setUpdatedAt(updatedAt);

            // Update the first ProductInfo variation if it exists;
            // Otherwise, you may create one if needed.
            if (product.getProductInfos() != null && !product.getProductInfos().isEmpty()) {
                ProductInfo info = product.getProductInfos().get(0);
                info.setColor(colour);
                info.setQuantity(quantity);
                info.setSize(size.getValue());
            } else {
                // Optionally, create and add a new variation.
            }

            // Delegate update to the service layer
            ProductService.updateProduct(product, em);

            // Redirect back to the product management page (using the servlet mapping)
            response.sendRedirect("adminproduct");
        } catch(Exception ex) {
            em.getTransaction().rollback();
            throw new ServletException("Error updating product", ex);
        } finally {
            em.close();
        }
    }
}
