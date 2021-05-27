<%@page import="DAO.Dao"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@page import="model.OutBill"%>
<%@page import="model.OverBalance"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Phiếu chi</title>
	<style>
            <%@include file="CSS/InBill.css"%>         
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
			<div class="page-title">Tạo phiếu chi</div>
			<div class="grid-content">
				<div class="toolbar">
					<button onclick="add()">Thêm</button>
					
				</div>
				
				<div class="grid">
					<table border="1" cellpadding="0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Người chi</th>
								<th>Diễn giải</th>
								<th>Số dư</th>
								<th>Tổng tiền</th>
								<!-- <th>Ngày mua</th> -->
								
							</tr>
						</thead>
						<tbody>
							
								<% 
									ArrayList<OutBill> listOutBill = null;
									listOutBill = new Dao().getAllOutBill(companyID);
									if(listOutBill != null){
										for(int i=0; i< listOutBill.size(); i++){ 
								%>
								<tr>
									<td><%= listOutBill.get(i).getId() %></td>
									<td><%= listOutBill.get(i).getReceiver() %></td>
									<td><%= listOutBill.get(i).getReason() %></td>
									<td><%= listOutBill.get(i).getOverBalanceID() %></td>
									<td><%= listOutBill.get(i).getAmount() %></td>
									
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
	<form action = "doOutBill" method = "post" name = "myForm">
		<div class="dialog" >
	        <div class="dialog-title">
	            <div class="Tittle-text">
	                Thông tin phiếu chi
	            </div>
	            <div class="title-close-button"></div>
	        </div>
	        <div class="dialog-body">
	           <!--  <div class="row">
	                <label for="">Mã phiếu thu: </label>
	                <input type="text" name="code"  required>
	            </div> -->
	            <div class="row">
	                <label for="">Người chi: </label>
	                <input type="text" name="name" id="" required>
	            </div>
	            <div class="row">
	                <label for="">Diễn giải: </label>
	                <input type="text" name="reason" id="" required>
	            </div>
	            <div class="row">
	                <label for="">Tổng tiền: </label>
	                <input type="text" name="amount" id="" required>
	            </div>
	            <div class="row">
	                <label style="margin: 0px;margin-bottom: 5px;" for="">Ngày nhập:</label>
	                <input style="width: 130px;" type="date" name="date" id="" required="required">
	            </div>
	            <div class="row">
	                <label for="">Tài khoản số dư:</label>
	                <select name="overBalanceID" id="">                         
	                    <% ArrayList<OverBalance> listOB = null;
									listOB = new Dao().getAllOB(companyID);
										for(int i=0; i< listOB.size(); i++){ 
		                        	
	                        	 %>
	                            <option value="<%= listOB.get(i).getCode()%>"><%= listOB.get(i).getCode() %></option>
	                            <% } %>
	                </select>
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