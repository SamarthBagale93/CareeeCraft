<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<style>
.footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            background-color: #f1f1f1;
         
            text-align: center;
        }
</style>
<body>
    <%@include file="all_component/navbar.jsp"%>
    <div class="container-fluid">
        <div class="row p-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                            <h5>Login Page</h5>
                        </div>

                        <!-- Success message -->
                        <c:if test="${not empty succMsg }">
                            <h4 class="text-center text-success">${succMsg}</h4>
                            <c:remove var="succMsg" />
                        </c:if>

                        <!-- Error message -->
                        <c:if test="${not empty errorMsg }">
                            <h4 class="text-center text-danger">${errorMsg}</h4>
                            <c:remove var="errorMsg" />
                        </c:if>

                        <!-- Login form -->
                        <form action="login" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail">Enter Email</label>
                                <input type="email" required="required" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" name="email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword">Enter Password</label>
                                <input type="password" required="required" class="form-control" id="exampleInputPassword" name="password">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </form>

                        <!-- Forgot password link -->
                        <div class="text-center mt-3">
                            <a href="forgotPassword.jsp">Forgot Password?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <div class="footer">
            <%@include file="all_component/footer.jsp"%>
        </div>
</body>
</html>
