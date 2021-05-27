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
	<title>Khách hàng</title>
	<style>
            <%@include file="CSS/Overbalance.css"%>         
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
			<div class="page-title">Nhập số dư đầu kì</div>
			<div class="grid-content">
				<div class="toolbar">
					<button onclick="add()">Thêm</button>
					
				</div>
				
				<div class="grid">
					<table border="1" cellpadding="0">
						<thead>
							<tr>								
								<th>Mã tài khoản</th>
								<th>Tên tài khoản</th>
								<th>Tên ngân hàng</th>
								<th>Tài khoản ngân hàng</th>
								<th>Số dư</th>													
							</tr>
						</thead>
						<tbody>							
								 <% ArrayList<OverBalance> listOB = null;
									listOB = new Dao().getAllOB(companyID);
										for(int i=0; i< listOB.size(); i++){ 		                        	
	                        	 %>
	                        	 	<tr>
	                         		<td class="code"><%= listOB.get(i).getCode()%></td>
	                         		<td><%= listOB.get(i).getName()%></td>
	                         		<td><%= listOB.get(i).getBankName()%></td>
	                         		<td><%= listOB.get(i).getBankAccount()%></td>
	                         		<td><%= listOB.get(i).getOffset()%></td>
	                         		</tr>
	                            <% } %>								
						</tbody>
					</table>
				
				</div>
				<div class="paging"></div>
			</div>	
		</div>
	</div>
	<form action = "doOverbalance" method = "post" name = "myForm">
		<div class="dialog" >
	        <div class="dialog-title">
	            <div class="Tittle-text">
	                Thông tin số dư đầu kì
	            </div>
	            <div class="title-close-button"></div>
	        </div>
	        <div class="dialog-body">
	            <div class="row">
	                <label for="">Mã tài khoản: </label>
	                <input type="text" name="code"  required>
	            </div>
	            <div class="row">
	                <label for="">Tên tài khoản: </label>
	                <input type="text" name="name" id="" required>
	            </div>
	            <div class="row">
	                <label for="">Tên ngân hàng: </label>
	                <input type="text" name="bankName" id="" required>
	            </div>
	            <div class="row">
	                <label for="">Tài khoản ngân hàng: </label>
	                <input type="text" name="bankAccount" id="" required>
	            </div>
	              <div class="row">
	                <label for="">Sô dư: </label>
	                <input type="text" name="offset" id="" required>
	            </div>
	        </div>
	        <div class="dialog-footer">
	            <input id="btnSave" type="button" value="Lưu" onclick="
	            var codes = document.getElementsByClassName('code');
	    	    
	    	    var btnSave = document.getElementById('btnSave');
	    	    
	            for (var code of codes) {
	            	console.log(document.myForm.code.value);
		            if (document.myForm.code.value === code.textContent) {		            	
		                alert('Mã số dư đã tồn tại');		                
		                document.myForm.code.style.border = ' 2px solid red';
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