package iti.jets.servlets;

import iti.jets.Managers.DatabaseManager;
import iti.jets.model.dtos.UserProfileDataDTO;
import iti.jets.services.ProfileService;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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
        Jsonb jsonb = JsonbBuilder.create();
        String json = jsonb.toJson(userDto);
        resp.setContentType("application/json");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
