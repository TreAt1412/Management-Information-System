<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

    <!DOCTYPE html>
    <html>

    <head>
        <style>
            <%@include file="CSS/Welcome.css"%>
        </style>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>SME</title>
    </head>

    <body>
        <div id="login">
            <form action="dologin" method="post" id="login-form">
            <c:if test="${fn:length(message) > 0}">
			<p style="color:red; margin-left:80px"> <c:out value = "${message}"/></p>
			</c:if>
                <label for="" >Mã công ty</label>
                <input type="text" id="companyCode" name="companyCode" required>
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
            <button type="submit" class="submit-btn">Đăng Nhập</button>

            <div class="register"><a href="register"> Đăng kí doanh nghiệp </a></div>
            
            </form>
            
        </div>
    </body>

    </html>