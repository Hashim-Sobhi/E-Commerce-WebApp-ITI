package iti.jets.servlets;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.dtos.ProductDetailDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductImg;
import iti.jets.model.entities.ProductInfo;
import iti.jets.model.enums.Category;
import iti.jets.model.enums.Gender;
import iti.jets.model.enums.ShoeSize;
import iti.jets.model.mappers.ProductMapper;
import iti.jets.services.ProductService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 5,      // 5MB
        maxRequestSize = 1024 * 1024 * 20)  // 20MB
public class EditProductServlet extends HttpServlet {

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
            Product productDetail = ProductService.getProductById(productId, em);
            if (productDetail == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }
            request.setAttribute("product", productDetail);
        } finally {
            em.close();
        }
        request.getRequestDispatcher("editProductForm.jsp").forward(request, response);
    }

    // POST: Process the update, merging new values via ProductService
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        String[] deleteImgIds = request.getParameterValues("deleteImageIds"); // image ids for deletion

        // Variation fields (assume updating the first variation)
        String colour = request.getParameter("colour");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String sizeParam = request.getParameter("size");
        ShoeSize size = ShoeSize.valueOf(sizeParam);

        Timestamp updatedAt = new Timestamp(System.currentTimeMillis());

        EntityManager em = DatabaseManager.getEntityManager();
        try {
            Product product = em.find(Product.class, productId);
            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }

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
            }
            // -------------------------------------------------------------
            if (deleteImgIds != null) {
                // Convert string array to a list of Integer IDs
                List<Integer> deleteIds = new ArrayList<>();
                for (String idStr : deleteImgIds) {
                    try {
                        deleteIds.add(Integer.parseInt(idStr));
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                }

                // Remove images from the product's image collection whose ID is in deleteIds
                if (product.getProductImgs() != null) {
                    product.getProductImgs().removeIf(img -> deleteIds.contains(img.getImageId()));
                }
            }

            // Add new images------------------------------

            List<String> newImageFileNames = new ArrayList<>();
            // Use the same folder where images are stored (adjust folder name as needed, e.g., "images")
            String baseFolder = "images";
            String uploadPath = getServletContext().getRealPath("") + File.separator + baseFolder;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Iterate over parts and process those with name "newImages"
            for (Part part : request.getParts()) {
                if (part.getName().equals("newImages") && part.getSubmittedFileName() != null && part.getSize() > 0) {
                    // Generate a unique file name to avoid overwrites (here using currentTimeMillis)
                    String originalFileName = extractFileName(part);
                    String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
                    String filePath = uploadPath + File.separator + uniqueFileName;
                    part.write(filePath);
                    // Store the relative path like "images/uniqueFileName"
                    newImageFileNames.add(baseFolder + "/" + uniqueFileName);
                }
            }

            // For each new uploaded image, create and add a new ProductImg entity
            if (!newImageFileNames.isEmpty()) {
                if (product.getProductImgs() == null) {
                    product.setProductImgs(new ArrayList<>());
                }
                for (String newFilePath : newImageFileNames) {
                    ProductImg newImg = new ProductImg();
                    newImg.setImg(newFilePath); // store relative path
                    newImg.setIsDefault(false); // Mark as non-default
                    newImg.setProduct(product);
                    product.getProductImgs().add(newImg);
                }
            }

            //----------------------------------------------------

            ProductService.updateProduct(product, em);

            response.sendRedirect("adminproduct");
        } catch(Exception ex) {
            em.getTransaction().rollback();
            throw new ServletException("Error updating product", ex);
        } finally {
            em.close();
        }
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return new File(token.substring(token.indexOf("=") + 2, token.length() - 1)).getName();
            }
        }
        return null;
    }
}
