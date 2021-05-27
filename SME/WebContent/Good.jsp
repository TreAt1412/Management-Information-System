<%@page import="model.GoodCategory"%>
<%@page import="DAO.Dao"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@page import="model.Good"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Mặt hàng</title>
	<style>
            <%@include file="CSS/Good.css"%>
                
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
			  <li><a href="OutBills">Tạo phiếu chi</a></li>
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
			  <% }
				
				%>
			</ul>
		</div>
	</div>
	<div class="content">
		<div class="content-header">
			<a href="/SME">Đăng xuất</a>
		</div>
		<div class="content-body">
			<div class="page-title">Tạo mặt hàng</div>
			<div class="grid-content">
				<div class="toolbar">
					<button onclick="add()">Thêm</button>
					
				</div>
				
				<div class="grid">
					<table border="1" cellpadding="0">
						<thead>
							<tr>
								<th>ID</th>
			                    <th>Tên mặt hàng</th>
			                    <th>Loại mặt hàng</th>
							</tr>
						</thead>
						<tbody>
							
								<% 
									
				                	ArrayList<Good> listGood = null;
				                	listGood = new Dao().getAllGood(companyID);
				                    if (listGood != null) { 
				                 		for (int i = 0; i < listGood.size(); i++) {%>
					                <tr><td align="center"><%= listGood.get(i).getId() %></td>
					                <td align="center"><%= listGood.get(i).getName() %></td>
					                <td align="center"><%= listGood.get(i).getGoodCategory()%></a></td>
					                </tr>
					                <% 	} 
					                } %> 
											
						</tbody>
					</table>
				
				</div>
				<div class="paging"></div>
			</div>	
		</div>
	</div>
	<form action = "doGood" method = "post">
		<div class="dialog">
	        <div class="dialog-title">
	            <div class="Tittle-text">
	                Thông tin mặt hàng
	            </div>
	            <div class="title-close-button"></div>
	        </div>
	        <div class="dialog-body">
	            <div class="row-1">
	                <div class="row">
	                    <label for="">Tên mặt hàng: </label>
	                    <input type="text" name="name" id="" required>
	                </div>
	                	<%   
	                	  %>
	                <div  class="row">
	                    <label for="">Loại mặt hàng: </label>
	                    <select name="goodCategory">
	                    	
	                    	<% 
	                    	
	                    	ArrayList<GoodCategory> listGC = null;
		                	listGC = new Dao().getAllGoodCategory();
	                    	for(int i=0; i< listGC.size(); i++){ %>
	                    	<option value="<%= listGC.get(i).getName() %>">
	                    		<%= listGC.get(i).getName() %>
	                    	</option>
	                    	<% } %>
	                    	
	                    </select>
	                </div>
	            </div>
	        </div>
	        <div class="dialog-footer">
	            <input  id="btnSave" type="submit" value="Lưu">
	            <input onclick="cancel()" id="btnCancel" type="button" value="Hủy">
	            
	        </div>
	    </div>
	
	</form>
	

    <script>
        var content = document.querySelector(".content");
        var dialog = document.querySelector(".dialog");
        var input = document.querySelectorAll(".row input");
        
        function add(){
            dialog.style.visibility = "visible";
            content.style.opacity = 0.5; 
            dialog.style.opacity = 1;               
        }
        function cancel(){
            dialog.style.visibility = "hidden";
            content.style.opacity = 1; 
        }

    </script>
</body>
</html>