<%@page import="java.sql.SQLException"%>
<%@page import="model.WageTableDetail"%>
<%@page import="DAO.Dao"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@page import="model.WageTable"%>
<%@page import="model.Employee"%>
<%@page import="model.OverBalance"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Bảng lương</title>
	<style>
            <%@include file="CSS/Customer.css"%>  
            <%@include file="CSS/WageTable.css"%>          
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
				int wagetableID = 0;
				if(cookiess!=null){
					for(Cookie cookie:cookiess){
						if(cookie.getName().equals("role")) {
							role = Integer.parseInt(cookie.getValue());
							
						}
						if(cookie.getName().equals("companyID")){
        					companyID = Integer.parseInt(cookie.getValue());
							
						}
						if(cookie.getName().equals("wagetableID")){
							wagetableID = Integer.parseInt(cookie.getValue());
							
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
			<div class="page-title">Tạo bảng lương</div>
			<div class="grid-content">
				<div class="toolbar">
					<button onclick="add()">Thêm</button>
					
				</div>				
				<div class="grid">
					<table border="1" cellpadding="0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Tháng</th>
								<th>Năm</th>
								<th>Tổng tiền</th>
								<th>Xem chi tiết</th>								
							</tr>
						</thead>
						<tbody>
							  <% 
									ArrayList<WageTable> listWT = null;
									listWT = new Dao().getAllWT(companyID);
									if(listWT != null){
										for(int i=0; i< listWT.size(); i++){ 
								%>
								<tr>
									<td class="ids"><%= listWT.get(i).getId() %></td>
									<td class="months"><%= listWT.get(i).getMonth() %></td>
									<td class="years"><%= listWT.get(i).getYear() %></td>
									<td class="moneys"><%= listWT.get(i).getTotalMoney() %></td>								
									<td><form method="post" action="WageTable">
									<input type="submit" value="Lấy dữ liêu">
									<input type="hidden" name ="param" value = "<%= listWT.get(i).getId() %>">
									
									<input class="xems" onsubmit="window.location.reload()" type="button" value="Xem" onclick="Xem(<%= listWT.get(i).getId() %>,
									<%= listWT.get(i).getMonth() %>, <%= listWT.get(i).getYear() %>,<%= listWT.get(i).getTotalMoney() %> )"></form></td>
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
	<form action = "doWageTable" method = "post" name = "myForm">
		<div class="dialog">
        <div class="dialog-title">
            <div class="Tittle-text">Bảng lương</div>
            <div class="title-close-button" onclick="cancel()">X</div>
        </div>
        <div class="dialog-body">
            <div class="dialog-detail">
                <label for="">Tháng:</label>
                <input type="text" name="month" id="month" required>
                <label for="">Năm:</label>
                <input type="text" name="year" id="year" required>               
            </div>
            <div class="dialog-table">              
                <table id="myTable" name="myTable">
                    <tr>
                        <th>Tên nhân viên</th>
                        <th>Phòng ban</th>
                        <th>Chức vụ</th>
                        <th>Tiền lương</th>
                        <th>Ghi chú</th>    
                    </tr>
                    <% 
				                ArrayList<Employee> listNV = null;
				                listNV = new Dao().getAllNV(companyID);
				                    if (listNV != null) { 
				                 for (int i = 0; i < listNV.size(); i++) {%>
				                <tr>
				                <td align="center"><input value="<%= listNV.get(i).getName() %>" name = "name" ></td>
				                <td align="center"><input value = "<%= listNV.get(i).getDepartment()%>" name="department" ></td>
				                <td align="center"><input value= "<%= listNV.get(i).getRole()%>" name = "role" ></td> 
				                <td align="center"><input value = "<%= listNV.get(i).getWage()%>" name ="wage" class="wage" onchange="sum2()" ></td>
				                <td><input name ="note" value="" type = "text"></td>			                
				                </tr>
				                <% } 
				                } %> 
				     <tr>
				     	<td></td>
				     	<td></td>
				     	<td>Tổng tiền</td>
				     	<td><input disabled type="text" id="totalMoney" name="totalMoney" ></td>
				     	<td></td>
				     </tr>           
				                
                </table>
            </div>
        </div>
        <div class="dialog-footer">
            <div>
                <input id="btnSave" type="button" value="Lưu" onclick="
	            var months = document.getElementsByClassName('months');
                var years = document.getElementsByClassName('years');
	    	    var btnSave = document.getElementById('btnSave');
	    	    var month1 = document.getElementById('month');
	    	    var year1 = document.getElementById('year');
	            for (var month of months) {
	            	for(var year of years){
	            		if (month1.value === month.textContent && year1.value === year.textContent) {		            	
			                alert('Tháng và năm đã tồn tại');		                
			                month1.style.border = ' 2px solid red';
			                year1.style.border = ' 2px solid red';
			                return;
			            }	
	            	}	            	            
		        }
	            btnSave.setAttribute('type','submit');">
            </div>
        </div>
    </div>   
	</form>
	
	<div class="dialog1">
        <div class="dialog-title">
            <div class="Tittle-text">
                Bảng chi tiết
            </div>
            <div class="title-close-button" onclick="cancel1()">X</div>
        </div>
        <div class="dialog-body">
            <div class="dialog-detail">
                <label for="">Tháng:</label>
                <input  type="text" name="month" id="month-dialog1" required >
                <label for="">Năm:</label>
                <input type="text" name="year" id="year-dialog1" required>               
            </div>
            <div class="dialog-table">             
                <table id="myTable1" name="myTable">
                    <tr>
                        <th>Tên nhân viên</th>
                        <th>Phòng ban</th>
                        <th>Chức vụ</th>
                        <th>Tiền lương</th>
                        <th>Ghi chú</th>                           
                    </tr>             
				           				                
                </table>
            </div>
        </div>
        <div class="dialog-footer"></div>
    </div>
	
	<script type="text/javascript">
		console.log(123);
		var content = document.querySelector(".content");
	    var dialog = document.querySelector(".dialog");
	    var dialog1 = document.querySelector(".dialog1");
	    function sum2(){
        	var tm = document.getElementById('totalMoney');
        	var sum1 = "0";
        	var listWages = document.getElementsByClassName('wage');
        	console.log(listWage);
        	for(var listWage of listWages){
     			sum1 = eval(sum1 + "+" + listWage.value);	
        	} 
        	tm.value = sum1;     	        	
        }
	    
		function add(){
			
	        dialog.style.visibility = "visible";
	        content.style.opacity = 0.5; 
	        dialog.style.opacity = 1.0;   
	        sum2();
	    }
		
        function cancel() {
            dialog.style.visibility = "hidden";
            content.style.opacity = 1;
        }
    	
        function cancel1() {
            dialog1.style.visibility = "hidden";
            content.style.opacity = 1;
            var table = document.getElementById('myTable1');	
        	if(table.rows.length>1){
        	    var trs = document.querySelectorAll(".myRow");
        	    for(var tr of trs){
        	    	table.removeChild(tr);
        	    }
        	}
        	window.location.reload(false);
        }
	        
      function Xem(id, month, year, totalMoney){
    	
    	  	document.cookie = "wagetableID=" + id;
    	  	
    	  	dialog1.style.visibility = "visible";
	        content.style.opacity = 0.5; 
	        dialog1.style.opacity = 1.0; 
	        var monthdialog1 = document.getElementById('month-dialog1');
	        var yeardialog1 = document.getElementById('year-dialog1');
	      
	        monthdialog1.value = month;
	        yeardialog1.value = year;
	   
	        <% 
	        
	
			
			List<WageTableDetail> listWD = new Dao().getWageTableDetail1(wagetableID);
			
			%>
			console.log(<%= wagetableID%>);
			var table = document.getElementById('myTable1');		
			<%
	        	for(int i=0; i<listWD.size()+1; i++){
	        		if(i<listWD.size()){
	        		%>       		
	        		var tr = document.createElement('tr');
	        		tr.setAttribute('class', 'myRow');
	        		        		
	        		for(var j=0; j<5; j++){
	        			var td = document.createElement('td');
	        			td.setAttribute('contenteditable', 'false');
	        			if(j===0){
	        				td.innerText = "<%= listWD.get(i).getEmployeeName()%>"
	        				tr.appendChild(td);
	        			}
	        			if(j===1){
	        				td.innerText = "<%= listWD.get(i).getDepartment() %>"
	        					tr.appendChild(td);
	        			}
	        			if(j===2){
	        				td.innerText = "<%= listWD.get(i).getRole()%>"
	        					tr.appendChild(td);
	        			}
	        			if(j===3){
	        				td.innerText = "<%= listWD.get(i).getWage()%>"
	        					tr.appendChild(td);
	        			}
	        			if(j===4){
	        				td.innerText = "<%= listWD.get(i).getNote()%>"
	        					tr.appendChild(td);
	        			} 	        			
	        		}        		
	        		table.appendChild(tr);
	        		<%
	        		}
	        		else{%>
	        			var tr = document.createElement('tr');	
	        			for(var j=0; j<5; j++){
		        			var td = document.createElement('td');
		        			td.setAttribute('contenteditable', 'false');
		        			if(j===0){
		        				td.innerText = "";
		        				tr.appendChild(td);
		        			}
		        			if(j===1){
		        				td.innerText = "";
		        					tr.appendChild(td);
		        			}
		        			if(j===2){
		        				td.innerText = "Tổng tiền";
		        					tr.appendChild(td);
		        			}
		        			if(j===3){
		        				td.innerText = totalMoney;
		        					tr.appendChild(td);
		        			}
		        			if(j===4){
		        				td.innerText = "";
		        					tr.appendChild(td);
		        			} 	        			
		        		} 
	        			table.appendChild(tr);
	        		<%}
	        	}
	        %>
      	}      	    
    </script> 
</body>
</html>