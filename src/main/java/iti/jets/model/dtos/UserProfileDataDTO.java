package iti.jets.model.dtos;

import jakarta.json.bind.annotation.JsonbDateFormat;
import jakarta.json.bind.annotation.JsonbProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class UserProfileDataDTO {
    private Integer userId;

    private String name;

    private String phoneNumber;

    private String email;

    private Date birthdate;

    private String job;

    private BigDecimal creditLimit;

    private String interests;

    private List<UserAddressDTO> addresses;

    private List<OrderDTO> orders;
}