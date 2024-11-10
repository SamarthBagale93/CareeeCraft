package com.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.model.Jobs;

public class JobDAO {
	private Connection conn;

	public JobDAO(Connection conn) {
		this.conn = conn;
	}

	public boolean addJobs(Jobs j) {
		boolean isAdded = false;
		String sql = "INSERT INTO jobs(title, description, category, status, location) VALUES(?, ?, ?, ?, ?)";

		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				isAdded = true;
			}
		} catch (SQLException e) {
			System.err.println("SQL exception occurred while adding job: " + e.getMessage());
		}

		return isAdded;
	}

	public List<Jobs> getAllJobs() {
		List<Jobs> list = new ArrayList<>();
		String sql = "SELECT * FROM jobs ORDER BY id DESC";

		try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Jobs j = new Jobs();
				j.setId(rs.getInt("id"));
				j.setTitle(rs.getString("title"));
				j.setDescription(rs.getString("description"));
				j.setCategory(rs.getString("category"));
				j.setStatus(rs.getString("status"));
				j.setLocation(rs.getString("location"));
				j.setPdate(rs.getTimestamp("pdate").toString());
				list.add(j);
			}
		} catch (SQLException e) {
			System.err.println("SQL exception occurred while fetching jobs: " + e.getMessage());
		}
		return list;
	}

	public List<Jobs> getAllJobsForUser() {
		List<Jobs> list = new ArrayList<>();
		try {
			String sql = "SELECT * FROM jobs where status=? order by id DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Jobs j = new Jobs();
				j.setId(rs.getInt("id"));
				j.setTitle(rs.getString("title"));
				j.setDescription(rs.getString("description"));
				j.setCategory(rs.getString("category"));
				j.setStatus(rs.getString("status"));
				j.setLocation(rs.getString("location"));
				j.setPdate(rs.getTimestamp("pdate").toString());
				list.add(j);
			}
		} catch (SQLException e) {
			System.err.println("SQL exception occurred while fetching jobs: " + e.getMessage());
		}
		return list;
	}

	public Jobs getJobById(int id) {
		Jobs j = null;
		String sql = "SELECT * FROM jobs WHERE id=?";

		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					j = new Jobs();
					j.setId(rs.getInt(1));
					j.setTitle(rs.getString(2));
					j.setDescription(rs.getString(3));
					j.setCategory(rs.getString(4));
					j.setStatus(rs.getString(5));
					j.setLocation(rs.getString(6));
					j.setPdate(rs.getTimestamp(7).toString());
				}
			}
		} catch (SQLException e) {
			System.err.println("SQL exception occurred while fetching job by ID: " + e.getMessage());
		}
		return j;
	}

	public List<Jobs> getJobsORLocationAndCate(String category, String location) {
	    List<Jobs> list = new ArrayList<>();
	    String sql = "SELECT * FROM jobs WHERE category = ? OR location = ? ORDER BY id DESC";

	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        // Set the category and location
	        ps.setString(1, category);
	        ps.setString(2, location);

	        // Execute the query and process the result set
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Jobs j = new Jobs();
	                j.setId(rs.getInt("id"));
	                j.setTitle(rs.getString("title"));
	                j.setDescription(rs.getString("description"));
	                j.setCategory(rs.getString("category"));
	                j.setStatus(rs.getString("status"));
	                j.setLocation(rs.getString("location"));
	                j.setPdate(rs.getTimestamp("pdate").toString());
	                list.add(j);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return list;
	}

	public List<Jobs> getJobsAndLocationAndCate(String category, String location) {
	    List<Jobs> list = new ArrayList<>();
	    try {
	        // SQL query to get jobs based on both category and location
	        String sql = "SELECT * FROM jobs WHERE category=? AND location=? ORDER BY id DESC";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        
	        // Set the category and location in the prepared statement
	        ps.setString(1, category);
	        ps.setString(2, location);

	        ResultSet rs = ps.executeQuery();

	        // Process the result set
	        while (rs.next()) {
	            Jobs j = new Jobs();
	            j.setId(rs.getInt("id"));
	            j.setTitle(rs.getString("title"));
	            j.setDescription(rs.getString("description"));
	            j.setCategory(rs.getString("category"));
	            j.setStatus(rs.getString("status"));
	            j.setLocation(rs.getString("location"));
	            j.setPdate(rs.getTimestamp("pdate").toString());
	            list.add(j);
	        }
	        rs.close();
	        ps.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	public boolean updateJob(Jobs j) {
		boolean isUpdated = false;
		String sql = "UPDATE jobs SET title=?, description=?, category=?, status=?, location=? WHERE id=?";

		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setInt(6, j.getId());

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				isUpdated = true;
			}
		} catch (SQLException e) {
			System.err.println("SQL exception occurred while updating job: " + e.getMessage());
		}

		return isUpdated;
	}

	public boolean deleteJobs(int id) {
	    boolean isDeleted = false;
	    String deleteApplicationsSql = "DELETE FROM applications WHERE job_id=?";
	    String deleteJobSql = "DELETE FROM jobs WHERE id=?";

	    try (
	        PreparedStatement psDeleteApplications = conn.prepareStatement(deleteApplicationsSql);
	        PreparedStatement psDeleteJob = conn.prepareStatement(deleteJobSql)
	    ) {
	        // First, delete records from `applications` table with the specified job_id
	        psDeleteApplications.setInt(1, id);
	        psDeleteApplications.executeUpdate();
	        
	        // Then, delete the record from `jobs` table with the specified id
	        psDeleteJob.setInt(1, id);
	        int rowsAffected = psDeleteJob.executeUpdate();

	        // Check if the job was deleted successfully
	        if (rowsAffected > 0) {
	            isDeleted = true;
	        }
	    } catch (SQLException e) {
	        System.err.println("SQL exception occurred while deleting job: " + e.getMessage());
	    }

	    return isDeleted;
	}
}
