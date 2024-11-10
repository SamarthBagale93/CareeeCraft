package com.Servlet;
import com.google.gson.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.DB.DBConnect;
import com.model.User;

@WebServlet("/unlock_user")
public class UnlockUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("userobj");

        if (user == null) {
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "User session not found.");
            out.print(jsonResponse.toString());
            return;
        }

        int userId = user.getId();
        String paymentId = request.getParameter("paymentId");

        // Check if paymentId is received
        if (paymentId == null || paymentId.isEmpty()) {
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Payment ID not provided.");
            out.print(jsonResponse.toString());
            return;
        }

        System.out.println("Unlocking user: " + userId + " with payment ID: " + paymentId);

        try (Connection conn = DBConnect.getConn()) {
            String sql = "UPDATE user SET access = 'unlocked', paymentDetails = ? WHERE user_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, paymentId);
                pstmt.setInt(2, userId);

                int rowsUpdated = pstmt.executeUpdate();
                JsonObject jsonResponse = new JsonObject();
                if (rowsUpdated > 0) {
                    jsonResponse.addProperty("success", true);
                    jsonResponse.addProperty("message", "User unlocked successfully.");
                } else {
                    jsonResponse.addProperty("success", false);
                    jsonResponse.addProperty("message", "User not found or update failed.");
                }
                out.print(jsonResponse.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Database error: " + e.getMessage());
            out.print(jsonResponse.toString());
        }
    }
}
