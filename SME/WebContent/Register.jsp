<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <style>
           <%@include file="CSS/Register.css"%>
        </style>
<title>Đăng kí doanh nghiệp</title>
</head>
<body>
<div class="register">
	<form action="doregister" method="post">
		<c:if test="${fn:length(message) > 0}">
			<p style="color:red; margin-left:80px"> <c:out value = "${message}"/></p>
			</c:if>
		<label> Mã công ty</label>
		<input type='text' name="companyCode" required>
		<br>
        <br>
		<label> Tên công ty</label>
		<input type="text" name="companyName" required>
		<br>
        <br>
		<label>Mã số thuế</label>
		<input type="number" name="taxNum" required>
		<br>
        <br>
		<label>Mô tả</label>
		<input type="text" name="detail">
		<br>
        <br>
		<label> Email</label>
		<input type="text" name="email" required>
		<br>
        <br>
		<label> Họ và tên</label>
		<input type="text" name="managerName" required>
		<br>
        <br>
		<label>Tài khoản</label>
		<input type="text" name="username" required>
		<br>
        <br>
		<label>Mật khẩu</label>
		<input type="password" name="password" required>
		<br>
        <br>
        <a href="/SME">Quay lại</a>
        
		<button type="submit"> Đăng kí </button>
	</form>
</div>
</body>
</html>