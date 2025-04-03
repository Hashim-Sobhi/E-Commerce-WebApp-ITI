package iti.jets.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Get the absolute path of products.json inside webapp
        String filePath = getServletContext().getRealPath("/items.json");

        File file = new File(filePath);
        if (!file.exists()) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("{\"error\": \"File not found\"}");
            return;
        }

        // Read the file content
        String jsonData = new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);

        // Send JSON response
        PrintWriter out = response.getWriter();
        out.print(jsonData);
        out.flush();
    }
    
}
