package iti.jets.servlets;

import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductDetail;
import jakarta.json.Json;
import jakarta.json.JsonArrayBuilder;
import jakarta.json.JsonObject;
import jakarta.json.JsonObjectBuilder;
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
import java.util.List;
import java.util.Optional;


@WebServlet("/productdetail")
public class ProductDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        String product_id = req.getParameter("product_id");
//        int productID = Integer.parseInt(product_id);
//        String filePath = getServletContext().getRealPath("/json/products.json");
//        Jsonb jsonb = JsonbBuilder.create();
//        List<Product> products = jsonb.fromJson(new FileReader(filePath), new ArrayList<Product>() {}.getClass().getGenericSuperclass());
//        Optional<Product> matchedProduct = products.stream()
//                .filter(p -> p.getProduct_id() == productID)
//                .findFirst();
//        resp.setContentType("application/json");
//        resp.setCharacterEncoding("UTF-8");
//        if (matchedProduct.isEmpty()) {
//            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
//            resp.getWriter().write("{\"error\": \"Product not found\"}");
//        }
//        Product product = matchedProduct.get();
//        JsonArrayBuilder images = Json.createArrayBuilder();
//        for(String image : product.getImage()) {
//            images.add(image);
//        }
//        JsonObjectBuilder data = Json.createObjectBuilder()
//                .add("product_id", productID)
//                .add("name", product.getName())
//                .add("description", product.getDescription())
//                .add("price", product.getPrice())
//                .add("image", images);
//
//        Jsonb info = JsonbBuilder.create();
//        String path = getServletContext().getRealPath("/json/product_info.json");
//        List<ProductDetail> products_info = jsonb.fromJson(new FileReader(path), new ArrayList<ProductDetail>() {}.getClass().getGenericSuperclass());
//        List<ProductDetail> target = products_info.stream().filter(pi->pi.getProduct_id() == productID).toList();
//        JsonArrayBuilder info_json = Json.createArrayBuilder();
//        for(ProductDetail pd : target) {
//            JsonObject p = Json.createObjectBuilder()
//                    .add("product_info_id", pd.getProduct_info_id())
//                    .add("size", pd.getSize())
//                    .add("color", pd.getColor()).build();
//            info_json.add(p);
//        }
//        data.add("product_info", info_json);
//        JsonObject mmmm = data.build();
//        resp.getWriter().write(mmmm.toString());
    }
}
