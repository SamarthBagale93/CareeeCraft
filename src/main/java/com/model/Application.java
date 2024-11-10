package com.model;

public class Application {
    private int jobId;
    private String jobTitle;
    private String location;
    private String fullName;
    private String email;
    private String phone;
    private String resumeFileName;

    // Constructor
    public Application(int jobId, String jobTitle, String location, String fullName, String email, String phone, String resumeFileName) {
        this.jobId = jobId;
        this.jobTitle = jobTitle;
        this.location = location;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.resumeFileName = resumeFileName;
    }

    // Getters and setters
    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getResumeFileName() {
        return resumeFileName;
    }

    public void setResumeFileName(String resumeFileName) {
        this.resumeFileName = resumeFileName;
    }
}
