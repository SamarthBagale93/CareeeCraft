<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Add Jobs</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body>
<c:if test="${userobj.role ne 'admin'}">
    <c:redirect url="login.jsp"/>
</c:if>
    <%@include file="all_component/navbar.jsp"%>
    <div class="container p-2">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-body">
                    <div class="text-center text-success">
                        <i class="fas fa-user-friends fa-3x"></i>
                        <c:if test="${not empty succMsg}">
                            <div class="alert alert-success" role="alert">${succMsg}</div>
                            <c:remove var="succMsg" />
                        </c:if>
                        <h5>Add Jobs</h5>
                    </div>
                    <form action="add_job" method="post">
                        <div class="form-group">
                            <label>&nbsp;Enter Title</label>
                            <input type="text" name="title" required class="form-control" autocomplete="off">
                        </div>
                        <!-- Row for Location, Category, and Status -->
                        <div class="form-row">
                            <!-- Location Field -->
                            <div class="form-group col-md-4">
                                <label>&nbsp;Location</label>
                                <select name="location" class="custom-select" required>
                                    <option value="" selected disabled>Choose..</option>
                                   <option value="Gurugram">Gurugram, Haryana</option>
                                    <option value="Pune">Pune</option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="Bangalore">Bangalore</option>
                                    <option value="Delhi">Delhi</option>
                                   <option value="Gujarat">Gujarat</option>
                                    <option value="Hyderabad">Hyderabad</option>
                                    <option value="Chennai">Chennai</option>
                                    <option value="Ahmedabad">Ahmedabad</option>   
                                </select>
                            </div>
                            <!-- Category Field -->
                            <div class="form-group col-md-4">
                                <label>&nbsp;Category</label>
                                <select name="category" class="custom-select" required>
                                    <option value="" selected disabled>Choose..</option>
                                    <option value="IT">IT</option>
                                    <option value="Developer">Developer</option>
                                    <option value="Banking">Banking</option>
                                    <option value="Engineering">Engineering</option>
                                    <option value="Trainer">Trainer</option>
                                </select>
                            </div>
                            <!-- Status Field -->
                            <div class="form-group col-md-4">
                                <label>&nbsp;Status</label>
                                <select class="form-control" name="status" required>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>&nbsp;Enter Description</label>
                            <textarea required rows="6" name="desc" class="form-control" autocomplete="off"></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success">&nbsp;&nbsp;Publish Job</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
