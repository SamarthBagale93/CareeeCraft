<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.repo.JobDAO"%>
<%@ page import="com.model.Jobs"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile Page</title>
    <%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color:#f7f7f7;">
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>

    <%@ include file="all_component/navbar.jsp"%>
    <div class="container-fluid">
        <div class="col-md-10 offset-md-1">
            <div class="row p-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <i class="fas fa-user-plus fa-2x" aria-hidden="true"></i>
                                <h5>Edit Profile</h5>
                            </div>
                            <form action="update_profile" method="post">
                                <input type="hidden" name="id" value="${userobj.id}">
                                
                                <!-- Full Name Field -->
                                <div class="form-group">
                                    <label>Enter Full Name</label>
                                    <input type="text" name="name" required class="form-control" value="${userobj.name}">
                                </div>

                                <!-- Email Field -->
                                <div class="form-group">
                                    <label>Enter Email</label>
                                    <input type="email" name="email" required class="form-control" value="${userobj.email}">
                                </div>

                                <!-- Password Field -->
                                <div class="form-group">
                                    <label>Enter Password</label>
                                    <input type="password" name="ps" required class="form-control" value="${userobj.password}">
                                </div>

                                <!-- Qualification Field -->
                                <div class="form-group">
                                    <label>Enter Qualification</label>
                                    <input type="text" name="qua" required class="form-control" value="${userobj.qualification}">
                                </div>

                               

                                <!-- Submit Button -->
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Update Profile</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
