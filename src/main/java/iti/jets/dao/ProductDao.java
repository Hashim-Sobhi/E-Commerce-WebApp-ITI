//package iti.jets.dao;
//
//import com.iti.model.DBConnection;
//import iti.jets.entities.Product;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class ProductDao {
//
//    private Connection conn;
//
//    public ProductDao() {
//        this.conn = DBConnection.getInstance().getConnection();
//    }
//
//    // Retrieve all products
//    public List<Product> getAllProducts() {
//        List<Product> products = new ArrayList<>();
//        String sql = "SELECT * FROM Product";
//
//        try (PreparedStatement stmt = conn.prepareStatement(sql);
//             ResultSet rs = stmt.executeQuery()) {
//
//            while (rs.next()) {
//                products.add(new Product(
//                    rs.getInt("product_id"),
//                    rs.getString("name"),
//                    rs.getString("description"),
//                    rs.getDouble("price"),
//                    rs.getString("category"),
//                    rs.getString("gender")
//                ));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return products;
//    }
//
//    // Add a new product
//    public boolean addProduct(Product product) {
//        String sql = "INSERT INTO Product (name, description, price, category, gender) VALUES (?, ?, ?, ?, ?)";
//        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
//            stmt.setString(1, product.getName());
//            stmt.setString(2, product.getDescription());
//            stmt.setDouble(3, product.getPrice());
//            stmt.setString(4, product.getCategory());
//            stmt.setString(5, product.getGender());
//
//            return stmt.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//
//    // Delete a product
//    public boolean deleteProduct(int productId) {
//        String sql = "DELETE FROM Product WHERE product_id = ?";
//        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
//            stmt.setInt(1, productId);
//            return stmt.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//
//    // Update product details
//    public boolean updateProduct(Product product) {
//        String sql = "UPDATE Product SET name = ?, description = ?, price = ?, category = ?, gender = ? WHERE product_id = ?";
//        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
//            stmt.setString(1, product.getName());
//            stmt.setString(2, product.getDescription());
//            stmt.setDouble(3, product.getPrice());
//            stmt.setString(4, product.getCategory());
//            stmt.setString(5, product.getGender());
//            stmt.setInt(6, product.getId());
//
//            return stmt.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//}
