package com.Servlet;

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

@WebServlet("/download_receipt")
public class DownloadReceiptServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the order ID and user details (you might store these in the session or retrieve from database)
        String orderId = request.getParameter("order_id");
        if (orderId == null || orderId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Order ID is missing");
            return;
        }

        // Set up the response to serve a PDF file
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=" + orderId + "_receipt.pdf");

        try (OutputStream out = response.getOutputStream()) {
            // Initialize iText PDF writer and document
            PdfWriter writer = new PdfWriter(out);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);

            // Add receipt content to the PDF
            document.add(new Paragraph("Payment Receipt"));
            document.add(new Paragraph("Order ID: " + orderId));
            document.add(new Paragraph("Thank you for your payment!"));
            document.add(new Paragraph("Transaction Details:"));
            document.add(new Paragraph("Amount: ₹500")); // This amount could be dynamically generated based on your application data
            document.add(new Paragraph("Date: " + java.time.LocalDate.now())); // Add date dynamically
            document.add(new Paragraph("We appreciate your business and look forward to serving you again."));

            // Close document
            document.close();
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating receipt: " + e.getMessage());
        }
    }
}
