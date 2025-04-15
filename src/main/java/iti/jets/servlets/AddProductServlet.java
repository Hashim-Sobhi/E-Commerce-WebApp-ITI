package iti.jets.servlets;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.dtos.ProductCreateDTO;
import iti.jets.model.enums.Category;
import iti.jets.model.enums.Gender;
import iti.jets.model.enums.ShoeSize;
import iti.jets.services.ProductService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import iti.jets.model.entities.Product;
import iti.jets.model.mappers.ProductMapper;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 5,      // 5MB
        maxRequestSize = 1024 * 1024 * 20)  // 20MB
public class AddProductServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = DatabaseManager.getEntityManager();
        // 1. Extract fields from request
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String categoryParam = request.getParameter("category");
        Category category = Category.valueOf(categoryParam.toUpperCase());
        String genderParam = request.getParameter("gender");
        Gender gender = Gender.valueOf(genderParam.toUpperCase());
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String brand = request.getParameter("brand");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String colour = request.getParameter("colour");
        ShoeSize size = ShoeSize.valueOf(request.getParameter("size"));
        String soldParam = request.getParameter("sold");
        int sold = soldParam != null && !soldParam.isEmpty() ? Integer.parseInt(soldParam) : 0;


        // 2. Handle uploaded images





        List<String> imageFileNames = new ArrayList<>();

// Directory where uploaded files will be saved
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        for (Part part : request.getParts()) {
            // Check if this part is a file upload and matches the 'images' field
            if (part.getName().equals("images") && part.getSubmittedFileName() != null && part.getSize() > 0) {
                String fileName = extractFileName(part); // You can also generate a unique name here
                String filePath = uploadPath + File.separator + fileName;
                part.write(filePath);
                imageFileNames.add(fileName);
            }
        }
        System.out.println("Uploaded files:");
        for (String f : imageFileNames) {
            System.out.println(f);
        }

        // 3. Create DTO
        ProductCreateDTO dto = new ProductCreateDTO();
        dto.setName(name);
        dto.setDescription(description);
        dto.setCategory(category);
        dto.setGender(gender);
        dto.setPrice(price);
        dto.setBrand(brand);
        dto.setQuantity(quantity);
        dto.setColour(colour);
        dto.setSize(size);
        dto.setSold(sold);

        // 4. Convert to Product entity
        Product product = ProductMapper.fromProductCreateDTO(dto, imageFileNames);

        // 5. Save to DB
        ProductService.addNewProduct(product, em);

        // 6. Redirect to product management page
        response.sendRedirect("adminProduct");
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
