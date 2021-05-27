<%@page import="DAO.Dao"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@page import="model.Customer"%>
<%@page import="model.OverBalance"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Báo cáo tài chính</title>
	<style>
            <%@include file="CSS/Report.css"%>         
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
			<div class="page-title">Báo cáo tài chính</div>
			<div class="grid-content">					
				<div class="grid">
					<table border="1" cellpadding="0">
						<thead>
							<tr>
								<th>Tài khoàn số dư</th>
								<th>Diễn giải</th>
								<th>Số dư đầu kì</th>
								<th>Phát sinh</th>
								<th>Số dư cuối kì</th>														
							</tr>
						</thead>
						
						<% ArrayList<Integer> listBCTC = new Dao().getBCTC(companyID);
							ArrayList<OverBalance> listOB = null;
									listOB = new Dao().getAllOB(companyID);
										for(int i=0; i< listOB.size(); i++){ 	                        	
	                        	 %>
	                         		<tr>
										<td><%= listOB.get(i).getCode()%></td>
										<td><%= listOB.get(i).getName()%></td>	
										<td><%= listOB.get(i).getOffset()%></td>		
										<td class="td4"><%= listBCTC.get(i)%></td>	
										<td class = "td5"><%= listOB.get(i).getOffset() - listBCTC.get(i)%> </td>							
									</tr>	
	                            <% } %>
									
					</table>
				
				</div>
				<div class="paging">
					<p id="p1"> Tổng số tiền phát sinh: </p>
					<p id = "p2"> Tổng Số dư cuối kì: </p>
				</div>
			</div>	
		</div>
	</div>
	<script >
	 	var td4s = document.getElementsByClassName('td4');
		var td5s = document.getElementsByClassName('td5');
		var p1 = document.getElementById('p1');
		var p2 = document.getElementById('p2');
		var sum1 = '0';
		var sum2 = '0';
		for(var td4 of td4s){
			sum1 = eval(sum1 + '+' +td4.textContent);
		}
		for(var td5 of td5s){
			sum2 = eval(sum2 + '+' +td5.textContent);
		}
		p1.innerHTML = " Tổng số tiền phát sinh: "+ sum1; 
		p2.innerHTML = " Tổng Số dư cuối kì: "+ sum2; 
	</script>
</body>