<%@page import="DAO.Dao"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@page import="model.Employee"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<style>
            <%@include file="CSS/employee.css"%>
            <%@include file="CSS/Customer.css"%>         
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
			  <li><a href="WageTablet">Tạo bảng lương</a></li>
			  <li><a href="Overbalance">Nhập số dư</a></li>
			  <li><a href="WageTablet">Tạo phiếu thu</a></li>
			  <li><a href="WageTablet">Tạo phiếu chi</a></li>
			  <li><a href="Purchase">Tạo chứng từ mua hàng</a></li>
			  <li><a href="Sell">Tạo chứng từ bán hàng</a></li>
			  <li><a href="GTGT">Tạo biên lai thuế GTGT</a></li>
			  <li><a href="ProfitLoss">Kết chuyển lãi lỗ</a></li>
			  <li><a href="Report">In báo cáo tài chính</a></li>
			  <li><a href="Account">Thêm tài khoản</a></li>
			</ul>
		</div>
	</div>
	<div class="content">
		<div class="content-header"></div>
		<div class="content-body">
			<div class="page-title">Danh mục</div>
			<div class="grid-content">
				<div class="toolbar">
					<button onclick="add()">Thêm</button>
					<button>Sửa</button>
					<button>Xóa</button>
				</div>
				
				<div class="grid">
					<table border="1" cellpadding="0">
						<thead>
							<tr>
								<th>ID</th>
			                    <th>Tên nhân viên</th>
			                    <th>Phòng</th>
			                    <th>Chức vụ</th>
			                    <th>Tài khoản ngân hàng</th>
			                    <th>Tên ngân hàng</th>
			                    <th>Lương</th>
								
							</tr>
						</thead>
						<tbody>
							
								<% 
				                ArrayList<Employee> listNV = null;
				                listNV = new Dao().getAllNV();
				                    if (listNV != null) { 
				                 for (int i = 0; i < listNV.size(); i++) {%>
				                <tr><td align="center"><%= listNV.get(i).getId() %></td>
				                <td align="center"><%= listNV.get(i).getName() %></td>
				                <td align="center"><%= listNV.get(i).getDepartment()%></a></td>
				                <td align="center"><%= listNV.get(i).getRole()%></td>
				                <td align="center"><%= listNV.get(i).getBankAccount() %></td>
				                <td align="center"><%= listNV.get(i).getBankName()%></td>
				                <td align="center"><%= listNV.get(i).getWage()%></td>
				                </tr>
				                <% } 
				                } %> 
											
						</tbody>
					</table>
				
				</div>
				<div class="paging"></div>
			</div>	
		</div>
	</div>
	<form action = "doEmployee" method = "post">
		<div class="dialog">
	        <div class="dialog-title">
	            <div class="Tittle-text">
	                Thông tin nhân viên
	            </div>
	            <div class="title-close-button"></div>
	        </div>
	        <div class="dialog-body">
	            <div class="row-1">
	                <div class="row">
	                    <label for="">Tên nhân viên: </label>
	                    <input type="text" name="name" id="" required>
	                </div>
	                <div class="row">
	                    <label for="">Phòng: </label>
	                    <input type="text" name="department" id="" required>
	                </div>
	                <div class="row">
	                    <label for="">Chức vụ: </label>
	                    <input type="text" name="role" id="" required>
	                </div>
	            </div>
	            <div class="row-2">
	                <div class="row">
	                    <label for="">Tài khoản ngân hàng: </label>
	                    <input type="text" name="bankAccount" id="" required >
	                </div>
	                <div class="row">
	                    <label for="">Tên ngân hàng: </label>
	                    <input type="text" name="bankName" id="" required>
	                </div>
	                <div class="row">
	                    <label for="">Lương: </label>
	                    <input type="text" name="wage" id="" required>
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