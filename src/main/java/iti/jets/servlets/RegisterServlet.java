package iti.jets.servlets;


import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

import iti.jets.model.dtos.UserAddressDTO;
import iti.jets.model.dtos.UserDTO;
import iti.jets.model.entities.User;
import iti.jets.services.UserService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
//    private UserDao userDao;
//
//    public void init() {
//        userDao = new UserDao();
//    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    //    System.out.println("I am in register servlet");
       String fname = request.getParameter("fname");
       String lname = request.getParameter("lname");
       int buildingNumber = Integer.parseInt(request.getParameter("building_number"));
       String street = request.getParameter("street");
       String state = request.getParameter("state");
       BigDecimal creditLimit = BigDecimal.valueOf(Double.parseDouble(request.getParameter("credit_limit")));
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       String job = request.getParameter("job");
       String interest = request.getParameter("interest");
       Date birthdate = Date.valueOf(request.getParameter("birthdate"));
       String phone = request.getParameter("phone_number");

        System.out.println(fname);
        System.out.println(lname);
        System.out.println(birthdate);
        System.out.println(buildingNumber);
        System.out.println(state);
        System.out.println(job);
        System.out.println(interest);

        UserAddressDTO userAddressDTO = new UserAddressDTO();
        userAddressDTO.setBuildingNumber(buildingNumber);
        userAddressDTO.setStreet(street);
        userAddressDTO.setState(state);
        userAddressDTO.setDefault(true);

        UserDTO userdto = new UserDTO();
        userdto.setName(fname + " " +lname);
        userdto.setEmail(email);
        // userdto.setPassword(password);
        userdto.setJob(job);
        userdto.setInterests(interest);
        userdto.setBirthDate(birthdate);
        userdto.setPhoneNumber(phone);
        userdto.setCreditLimit(creditLimit);
        // userdto.setAddress(userAddressDTO);
        userdto.getAddresses().add(userAddressDTO);

        // User user = new User();
        // set
        // user.getAddress().add(userAddressDTO);
        

        int userId = UserService.register(userdto  , password, (EntityManager) request.getAttribute("entityManager"));        
        System.out.println("Register Successfully" + userId);
        if(userId != -1)
        {
            response.sendRedirect("/project/login.jsp");
        }
    }
}
