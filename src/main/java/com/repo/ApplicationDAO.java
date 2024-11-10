package com.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Application;

public class ApplicationDAO {
    private Connection conn;

    // Constructor to get the database connection
    public ApplicationDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to insert a new job application into the database
    public boolean applyForJob(Application application) {
        boolean isSuccess = false;
        String query = "INSERT INTO applications(job_id, job_title, location, full_name, email, phone, resume_file_name) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            // Setting the parameters
            pstmt.setInt(1, application.getJobId());
            pstmt.setString(2, application.getJobTitle());
            pstmt.setString(3, application.getLocation());
            pstmt.setString(4, application.getFullName());
            pstmt.setString(5, application.getEmail());
            pstmt.setString(6, application.getPhone());
            pstmt.setString(7, application.getResumeFileName());

            // Execute the query
            int rowsAffected = pstmt.executeUpdate();

            // Check if the insertion was successful
            isSuccess = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    // Method to retrieve all applications
    public List<Application> getAllApplications() {
        List<Application> applications = new ArrayList<>();
        String query = "SELECT * FROM applications";

        try (PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Application application = new Application(
                    rs.getInt("job_id"),
                    rs.getString("job_title"),
                    rs.getString("location"),
                    rs.getString("full_name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("resume_file_name")
                );
                applications.add(application);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return applications;
    }

}
