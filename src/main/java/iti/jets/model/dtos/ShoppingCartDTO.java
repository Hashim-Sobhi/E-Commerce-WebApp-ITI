package iti.jets.model.dtos;

import java.sql.Timestamp;

import iti.jets.model.entities.ProductDetail;
import iti.jets.model.entities.ProductInfo;
import iti.jets.model.entities.User;
import jakarta.persistence.Column;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingCartDTO {
    private int itemId;
    private int userId;
    //private ProductDetailDTO productDetail;
    private int quantity;
    private Timestamp addedAt;
}
