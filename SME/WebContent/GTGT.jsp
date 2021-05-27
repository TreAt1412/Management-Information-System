<%@page import="DAO.Dao"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@page import="model.Customer"%>
<%@page import="model.Employee"%>
<%@page import="java.lang.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<style>
            <%@include file="CSS/GTGT.css"%>         
    </style>
</head>
<body>
	<!--Menu -->
	<div class="menu">
		<!-- Logo -->
		<div id="logo">
			<div class="logo-text"><p><a href="Home">MASI</a></p></div>
		</div>
		<!-- menu-item -->
		<div id="menu-content">
			<ul>
			  <li><a href="Employee">Thêm nhân viên</a></li>
			  <li><a href="Customer">Thêm khách hàng</a></li>
			  <li><a href="Good">Thêm mặt hàng</a></li>
			  <li><a href="WageTable">Tạo bảng lương</a></li>
			  <li><a href="Overbalance">Nhập số dư</a></li>
			  <li><a href="InBill">Tạo phiếu thu</a></li>
			  <li><a href="OutBill">Tạo phiếu chi</a></li>
			  <li><a href="PurchaseBill">Tạo chứng từ mua hàng</a></li>
			  <li><a href="SellingBill">Tạo chứng từ bán hàng</a></li>
			  <% Cookie[] cookiess = request.getCookies();
				int role = 0;
				int companyID = 0;
				if(cookiess!=null){
					for(Cookie cookie:cookiess){
						if(cookie.getName().equals("role")) {
							role = Integer.parseInt(cookie.getValue());
							
						}
						if(cookie.getName().equals("companyID")){
        					companyID = Integer.parseInt(cookie.getValue());
							
						}
        			
					}
					
				} 
				if(role == 0) {%>
			  <li><a href="GTGT">Tạo biên lai thuế GTGT</a></li>
			  <li><a href="KCLL">Kết chuyển lãi lỗ</a></li>
			  <li><a href="Report">In báo cáo tài chính</a></li>
			  <li><a href="Account">Thêm tài khoản</a></li>
			  <% } %>
			</ul>
		</div>
	</div>
	<div class="content">
		<div class="content-header">
			<a href="/SME">Đăng xuất</a>
		</div>
		<div class="content-body">
			<div class="page-title">Thuế GTGT</div>
			<div class="grid-content">					
				<div class="grid">
					<table border="1" cellpadding="0">
						<thead>
							<tr>
								<th>STT</th>
								<th>Chỉ tiêu</th>
								<th>Giá trị</th>
																					
							</tr>
						</thead>
								<tr>
									<td>1</td>
									<td>Tổng số người lao động</td>
									<td><% 
										ArrayList<Employee> listNV = null;
					                	listNV = new Dao().getAllNV(companyID);
					                	
					                	
									%><%= listNV.size() %></td>																					
								</tr>
								<tr>
									<td>2</td>
									<td>Tổng thu nhập cá nhân</td>
									<td><%= new Dao().getTNCN(companyID) %></td>																					
								</tr>	
								<tr>
									<td>3</td>
									<td>Tổng thuế thu nhập cá nhân</td>
									<td><%= new Dao().getTNCN(companyID) - Math.round(new Dao().getTNCN(companyID) / 1.1) %></td>																					
								</tr>	
								<tr>
									<td>4</td>
									<td>Tổng doanh thu bán hàng</td>
									<td><%= new Dao().getDTBH(companyID) %></td>																					
								</tr>	
								<tr>
									<td>5</td>
									<td>Tổng thuế thu nhập doanh nghiệp</td>
									<td><%= new Dao().getDTBH(companyID)- Math.round(new Dao().getDTBH(companyID) / 1.1) %></td>																					
								</tr>	
								<tr>
									<td>6</td>
									<td>Tổng thuế phải nộp</td>
									<td><%= new Dao().getTNCN(companyID) - Math.round(new Dao().getTNCN(companyID) / 1.1) + 
											new Dao().getDTBH(companyID)- Math.round(new Dao().getDTBH(companyID) / 1.1) %></td>																					
								</tr>				
					</table>
					
				</div>				
			</div>	
		</div>
	</div>