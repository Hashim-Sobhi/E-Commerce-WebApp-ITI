package iti.jets.model.dtos;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private int userId;
    private String name;
    private String phoneNumber;
    private String email;
    private Date birthDate;
    private String job;
    private BigDecimal creditLimit;
    private String interests;
    // private Timestamp createdAt;
    private List<UserAddressDTO> addresses = new ArrayList<UserAddressDTO>();
    private List<ShoppingCartSummaryDTO> cartItems = new ArrayList<>();
    private List<WishlistDTO> wishlist = new ArrayList<>();
}
