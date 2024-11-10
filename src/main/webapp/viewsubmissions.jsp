<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.repo.ApplicationDAO"%>
<%@ page import="com.model.Application"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Job Applications</title>
    <%@ include file="all_component/allCss.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 20px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h4 {
            margin-bottom: 20px;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table a {
            color: #007bff;
            text-decoration: none;
        }

        .table a:hover {
            text-decoration: underline;
        }

        .search-bar {
            margin-bottom: 20px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            position: relative; /* Ensure relative positioning for the container */
        }

        .search-bar input {
            padding-left: 30px; /* Space for the icon */
            width: 200px;
            height: 35px;
        }

        .search-icon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #007bff;
        }

        .search-button {
            margin-left: 10px;
            height: 35px; /* Match input height */
        }

        .email-link {
            color: #007bff;
            text-decoration: none;
            cursor: pointer;
        }

        .email-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="container p-4">
        <h4 class="text-center text-primary">All Job Applications</h4>

        <!-- Search Bar -->
        <div class="search-bar">
            <!-- Wrap the input and icon in a relative container to align them properly -->
            <div style="position: relative; width: 200px;">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="form-control" id="searchInput" placeholder="Search by Job Title or Name" onkeyup="filterTable()">
            </div>
            <button class="btn btn-primary search-button" onclick="filterTable()">
                <i class="fas fa-search"></i>
            </button>
        </div>

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Job ID</th>
                    <th>Job Title</th>
                    <th>Location</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Resume</th>
                </tr>
            </thead>
            <tbody id="applicationTable">
                <%
                    // Create DAO object
                    ApplicationDAO dao = new ApplicationDAO(DBConnect.getConn());

                    // Retrieve all applications
                    List<Application> submissions = dao.getAllApplications();

                    // Display applications
                    for (Application app : submissions) {
                %>
                    <tr>
                        <td><%= app.getJobId() %></td>
                        <td><%= app.getJobTitle() %></td>
                        <td><%= app.getLocation() %></td>
                        <td><%= app.getFullName() %></td>
                        <td><a href="mailto:<%= app.getEmail() %>" class="email-link"><%= app.getEmail() %></a></td>
                        <td><%= app.getPhone() %></td>
                        <td><a href="viewResume?file=<%= app.getResumeFileName() %>">View Resume</a></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <script>
        // Function to filter table rows based on search input
        function filterTable() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('applicationTable');
            const tr = table.getElementsByTagName('tr');

            for (let i = 0; i < tr.length; i++) {
                const td = tr[i].getElementsByTagName('td');
                let showRow = false;

                for (let j = 0; j < td.length; j++) {
                    if (td[j] && td[j].innerText.toLowerCase().indexOf(filter) > -1) {
                        showRow = true;
                        break;
                    }
                }

                if (showRow) {
                    tr[i].style.display = '';
                } else {
                    tr[i].style.display = 'none';
                }
            }
        }
    </script>
</body>

</html>
