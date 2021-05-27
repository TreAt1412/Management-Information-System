	<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Tài khoản</title>
	<style>
            <%@include file="CSS/Account.css"%>
            
            
    </style>
</head>
<body>

	    
	<!--Menu -->
	<div class="menu">
		<!-- Logo -->
		<div id="logo">
			<div class="logo-text">MASI</div>
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
			  <% Cookie[] cookies = request.getCookies();
				int role = 0;
				if(cookies!=null){
					for(Cookie cookie:cookies){
						if(cookie.getName().equals("role"))
							role = Integer.parseInt(cookie.getValue());
					}
					
				} 
				if(role == 0) {%>
			  <li><a href="GTGT">Tạo biên lai thuế GTGT</a></li>
			  <li><a href="ProfitLoss">Kết chuyển lãi lỗ</a></li>
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
			<div class="page-title">Tài khoản</div>
			<div class="grid-content">
				<div class="toolbar">
					<button onclick="document.getElementById('create-account').style.display = 'block';">Thêm</button>
					
				</div>
				<div class="grid">
					<table class="table-account" border="1" cellpadding="0">
						<thead>
							<tr> 
								<th>Tài khoản </th>
								<th>Vai trò </th>
								<th>Email </th>
							</tr>
						
						</thead>
					 
						 <c:forEach var="account" items="${laccount}">
						 	<tr>
						 	<td> <c:out value=" ${account.username}" /> </td>
						 	<td> <c:if test="${account.role==0}">
								 Quản lý
								 </c:if> 				
								 <c:if test="${account.role==1}">
								 Nhân viên kế toán	
								 </c:if> 
								  </td>
						 	<td> <c:out value=" ${account.email}" /> </td>
						 	
						 	</tr>
						  </c:forEach>
					</table>
				</div>
				
			</div>	
		</div>
	</div>
	<div class="create-account" id="create-account">
				<form action="doCreateAccount" method="post">
					<div class="information">
						<label>Tài khoản</label>
						<input class="input-text" type="text" name="username" required>
						<br>
						<br>
						<label>Mật khẩu</label>
						<input class="input-text" type="password" name="password" required>
						<br>
						<br>
						<label>Vai trò: </label>
						<input style="margin-left: 28px;" type="radio" name="role" value="0" required>
						
						<label for="">Quản lý</label>
						<input type="radio" name="role" value="1" required>
						
						<label for="">Nhân viên</label>
						<br>
						<br>
						<label>Email</label>
						<input class="input-text" type="text" name="email" required>
					</div>
					
					<div class="create-account-bottom">
						<button type="submit">Thêm</button>
						<button type="button" onclick="document.getElementById('create-account').style.display = 'none';">Hủy</button>
					</div>
				</form>
				</div>
</body>
<script type="text/javascript">
</script>
</html>