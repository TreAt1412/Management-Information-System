<%@page import="DAO.Dao"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@page import="model.Customer"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<style>
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
								<th>Mã khách hàng</th>
								<th>Tên khách hàng</th>
								<th>Địa chỉ</th>
								<th>Mã số thuế</th>
								
							</tr>
						</thead>
						<tbody>
							
								<% 
									ArrayList<Customer> listCust = null;
									listCust = new Dao().getAllCust();
									if(listCust != null){
										for(int i=0; i< listCust.size(); i++){ 
								%>
								<tr>
									<td><%= listCust.get(i).getId() %></td>
									<td class="MaKH"><%= listCust.get(i).getCode() %></td>
									<td><%= listCust.get(i).getName() %></td>
									<td><%= listCust.get(i).getAddress() %></td>
									<td><%= listCust.get(i).getTaxNum() %></td>
								</tr>
								<% }
								}%>
											
						</tbody>
					</table>
				
				</div>
				<div class="paging"></div>
			</div>	
		</div>
	</div>
	<form action = "doCustomer" method = "post" name = "myForm">
		<div class="dialog" >
	        <div class="dialog-title">
	            <div class="Tittle-text">
	                Thông tin nhân viên
	            </div>
	            <div class="title-close-button"></div>
	        </div>
	        <div class="dialog-body">
	            <div class="row">
	                <label for="">Mã Khách hàng: </label>
	                <input type="text" name="code"  required>
	            </div>
	            <div class="row">
	                <label for="">Tên Khách hàng: </label>
	                <input type="text" name="name" id="" required>
	            </div>
	            <div class="row">
	                <label for="">Địa chỉ: </label>
	                <input type="text" name="address" id="" required>
	            </div>
	            <div class="row">
	                <label for="">Mã số thuế: </label>
	                <input type="text" name="taxNum" id="" required>
	            </div>
	        </div>
	        <div class="dialog-footer">
	            <input id="btnSave" type="button" value="Lưu" onclick="
	            var MaKHs = document.getElementsByClassName('MaKH');
	    	    
	    	    var btnSave = document.getElementById('btnSave');
	    	    
	            for (var MaKH of MaKHs) {
	            	console.log(document.myForm.code.value);
		            if (document.myForm.code.value === MaKH.textContent) {		            	
		                alert('Mã Khách Hàng đã tồn tại');		                
		                code.style.border = ' 2px solid red';
		                return;
		            }		            
		        }
	            btnSave.setAttribute('type','submit');">
	            <input id="btnCancel" type="button" value="Hủy" onclick="cancel()">
	        </div>
	    </div>
	</form>
	
    <script>
	    var MaKHs = document.getElementsByClassName("MaKH");
	    var code = document.getElementById("code");
	    var btn = document.getElementById("btnSave");
	    console.log(MaKHs[0].textContent);
        var content = document.querySelector(".content");
        var dialog = document.querySelector(".dialog");
        function add(){
            dialog.style.visibility = "visible";
            content.style.opacity = 0.5; 
            dialog.style.opacity = 1.0;               
        }
        function cancel(){
            dialog.style.visibility = "hidden";
            content.style.opacity = 1.0; 
        }
        
        
    </script>
</body>
</html>