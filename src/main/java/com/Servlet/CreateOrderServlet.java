package com.Servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;
import com.razorpay.RazorpayClient;

@WebServlet("/create_order")
public class CreateOrderServlet extends HttpServlet {
    private static final String API_KEY = "rzp_test_sbF7Cn1PacGyyc";
    private static final String API_SECRET = "7pYDFfYEXtpaUih2i1rfkWRh";

    // Handle order creation and return the order details
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Parse the incoming JSON request
        StringBuilder requestBody = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            requestBody.append(line);
        }

        try {
            // Parse the amount and user details from the incoming JSON
            JSONObject jsonRequest = new JSONObject(requestBody.toString());
            int amount = jsonRequest.getInt("amount") * 100; // Razorpay expects the amount in paise (1 INR = 100 paise)
            String name = jsonRequest.getString("name");
            String email = jsonRequest.getString("email");
            String phone = jsonRequest.getString("phone");
            String address = jsonRequest.getString("address");

            // Create Razorpay client
            RazorpayClient client = new RazorpayClient(API_KEY, API_SECRET);

            // Create the order data (order request)
            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", amount);  // Amount in paise
            orderRequest.put("currency", "INR");
            orderRequest.put("payment_capture", 1);  // Automatically capture payment

            // Create the order using Razorpay API
            com.razorpay.Order order = client.Orders.create(orderRequest);

            // Send order details back to the client
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            out.print(order);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error creating Razorpay order: " + e.getMessage());
        }
    }
}
