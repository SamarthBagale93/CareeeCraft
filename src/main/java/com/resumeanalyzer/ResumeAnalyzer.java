package com.resumeanalyzer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class ResumeAnalyzer {

    // Method to analyze the resume and extract text content
    public static String analyzeResume(InputStream inputStream) {
        StringBuilder resumeText = new StringBuilder();
        String line;
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            while ((line = reader.readLine()) != null) {
                resumeText.append(line).append("\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Return the full resume text for further analysis
        return resumeText.toString();
    }

    // Method to extract skills from the resume text
    public static String extractSkills(String resumeContent) {
        StringBuilder skills = new StringBuilder();

        // Example skills extraction (expand the list as necessary)
        if (resumeContent.contains("Java")) {
            skills.append("Java, ");
        }
        if (resumeContent.contains("JSP")) {
            skills.append("JSP, ");
        }
        if (resumeContent.contains("Servlets")) {
            skills.append("Servlets, ");
        }
        if (resumeContent.contains("Javascript")) {
            skills.append("Javascript, ");
        }
        if (resumeContent.contains("Springboot")) {
            skills.append("Springboot, ");
        }
        if (resumeContent.contains("Springframework")) {
            skills.append("Springframework, ");
        }

        // Remove the last comma and space, if any skills were added
        if (skills.length() > 0) {
            skills.setLength(skills.length() - 2); // removes trailing comma and space
        } else {
            skills.append("No specific skills found.");
        }

        return skills.toString();
    }

    // Method to calculate the ATS score based on keyword matching
    public static int calculateATSScore(String resumeContent, String jobDescription) {
        // Convert both resume content and job description to lower case for case-insensitive comparison
        resumeContent = resumeContent.toLowerCase();
        jobDescription = jobDescription.toLowerCase();

        // Extract keywords from the job description
        Set<String> jobKeywords = extractKeywords(jobDescription);

        // Extract keywords from the resume content
        Set<String> resumeKeywords = extractKeywords(resumeContent);

        // Count how many job keywords are found in the resume
        int matchingKeywords = 0;
        for (String keyword : jobKeywords) {
            if (resumeKeywords.contains(keyword)) {
                matchingKeywords++;
            }
        }

        // Calculate ATS score as a percentage
        int totalKeywords = jobKeywords.size();
        if (totalKeywords == 0) return 0; // Avoid division by zero

        return (matchingKeywords * 100) / totalKeywords;
    }

    // Helper method to extract keywords from text
    private static Set<String> extractKeywords(String text) {
        // Split the text into words and filter out non-significant characters
        String[] words = text.split("\\W+"); // Splits by non-word characters
        return new HashSet<>(Arrays.asList(words));
    }
}
