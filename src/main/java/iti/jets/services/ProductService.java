package iti.jets.services;

import iti.jets.model.dtos.ProductCreateDTO;
import iti.jets.model.dtos.ProductDetailDTO;
import iti.jets.model.dtos.ProductManageDTO;
import iti.jets.model.dtos.ProductSummaryDTO;
import iti.jets.model.entities.Product;
import iti.jets.model.entities.ProductInfo;
import iti.jets.model.mappers.ProductMapper;
import iti.jets.repositories.ProductRepository;
import jakarta.persistence.EntityManager;

import java.util.ArrayList;
import java.util.List;

public class ProductService {

    public static List<ProductManageDTO> getAllProductManageDTOs(EntityManager em) {
        List<Product> products = ProductRepository.getAllProducts(em);
        List<ProductManageDTO> manageDTOs = new ArrayList<>();
        for (Product product : products) {
            manageDTOs.add(ProductMapper.toProductManageDTO(product));
        }
        return manageDTOs;
    }

    public static void addNewProduct(Product product, EntityManager em) {
        ProductRepository.addNewProduct(product, em);
    }
    public static void updateProduct(Product product, EntityManager em) {
        ProductRepository.updateProduct(product, em);
    }
    public static void deleteProduct(Integer id, EntityManager em) {
        ProductRepository.deleteProductById(id, em);
    }

    public static List<ProductSummaryDTO> getFilteredProducts(
            String[] brands, String[] sizes, String[] colors, String orderBy, String category, String page, EntityManager em) {
        List<Product> products = ProductRepository.getFilteredProducts(
                brands, sizes, colors, orderBy, category, page, em);
        List<ProductSummaryDTO> productSummaries = new ArrayList<>();
        for (Product product : products) {
            ProductSummaryDTO summaryDTO = ProductMapper.toProductSummaryDTO(product);
            productSummaries.add(summaryDTO);
        }
        return productSummaries;
    }
    public static Long getNoOfFilteredProducts(
            String[] brands, String[] sizes, String[] colors, String orderBy, String category, String page, EntityManager em) {
        return ProductRepository.getNoOfFilteredProducts(brands, sizes, colors, orderBy, category, page, em);
    }
    public static List<ProductSummaryDTO> getBestSellerProducts(EntityManager em) {
        List<Product> products = ProductRepository.getBestSellerProducts(em);
        List<ProductSummaryDTO> productSummaries = new ArrayList<>();
        for (Product product : products) {
            ProductSummaryDTO summaryDTO = ProductMapper.toProductSummaryDTO(product);
            productSummaries.add(summaryDTO);
        }
        return productSummaries;
    }

    public static ProductDetailDTO getProductDetail(Integer product_id, EntityManager em) {
        Product product = ProductRepository.getProductDetail(product_id, em);
        return product!=null?ProductMapper.toProductDetailDTO(product):null;
    }

    public static List<ProductSummaryDTO> getSearchProducts(String query, EntityManager em) {
            List<Product> products = ProductRepository.getSearchProducts(query, em);
            List<ProductSummaryDTO> productSummaries = new ArrayList<>();
            for (Product product : products) {
                ProductSummaryDTO summaryDTO = ProductMapper.toProductSummaryDTO(product);
                productSummaries.add(summaryDTO);
            }
            return productSummaries;
    }
    public static Product getProductById(Integer product_id, EntityManager em) {
        Product product = ProductRepository.getProductDetail(product_id, em);
        return product;
    }
    public static void deleteProductImage(Integer imgId, EntityManager em) {
        ProductRepository.deleteProductImgById(imgId, em);
    }

    public static List<ProductManageDTO> searchProductsByName(String name, EntityManager em) {
        List<Product> list = ProductRepository.findByNameContaining(name, em);
        List<ProductManageDTO> dtos = new ArrayList<>();
        for (Product p : list) {
            dtos.add(ProductMapper.toProductManageDTO(p));
        }
        return dtos;
    }



}
