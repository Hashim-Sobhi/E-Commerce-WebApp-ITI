package iti.jets.servlets;

import com.google.gson.Gson;
import iti.jets.model.dtos.UserProfileDataDTO;
import iti.jets.services.ProfileService;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import jakarta.json.bind.JsonbConfig;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet("/profileServlet")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id = req.getParameter("user_id");
        EntityManager em = (EntityManager) req.getAttribute("entityManager");
        int user_id_int;
        try{
            user_id_int = Integer.parseInt(user_id);
        }catch(NumberFormatException e){
            resp.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE, "wrong user_id");
            return;
        }

        UserProfileDataDTO userDto = ProfileService.getUserData(user_id_int, em);
        if(userDto == null){
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
        Gson gson = new Gson();
        String json = gson.toJson(userDto);
        resp.setContentType("application/json");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserProfileDataDTO updatedUser;
        try {
            String json = req.getReader().lines().collect(Collectors.joining());
            System.out.println("Received JSON: " + json);

            // Create a Gson instance without a custom date format
            Gson gson = new Gson();

            // Deserialize the JSON string into UserProfileDataDTO
            updatedUser = gson.fromJson(json, UserProfileDataDTO.class);
            if (updatedUser == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Deserialization resulted in null object");
                return;
            }

            System.out.println("Updated user: " + updatedUser);
            EntityManager em = (EntityManager) req.getAttribute("entityManager");
            Boolean state = ProfileService.updateUserData(updatedUser, em);
            if(!state){
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error processing request: " + e.getMessage());
        }
    }
}
