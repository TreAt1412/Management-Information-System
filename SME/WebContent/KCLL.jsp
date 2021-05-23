<%@page import="DAO.Dao"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@page import="model.Customer"%>
<%@page import="model.OverBalance"%>
<%@page import="model.PurchaseBill"%>
<%@page import="model.SellingBill"%>
<%@page import="model.InBill"%>
<%@page import="model.OutBill"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<style>
            <%@include file="CSS/Customer.css"%>      
            <%@include file="CSS/KCLL.css"%>      
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
				<div class="dialog">
        <div class="dialog-title">
            <div class="Tittle-text">
                Kết chuyển lãi,lỗ
            </div>
            <div class="title-close-button" onclick="cancel()">X</div>
        </div>
        <div class="dialog-body">
            <div class="dialog-detail">
                <div>
                    <label for="">Tài khoản số dư:</label>
                    <select  name="" id="TKsodu">
                        <% ArrayList<OverBalance> listOB = null;
									listOB = new Dao().getAllOB();
										for(int i=0; i< listOB.size(); i++){ 		                        	
	                        	 %>
	                            <option value="<%= listOB.get(i).getCode()%>"><%= listOB.get(i).getCode() %></option>
	                            <% } %>
                    </select>
                </div>
                <input type="button" onclick="show()" value = "Xem"/>
            </div>
            <%	for(int i =0; i<listOB.size();i++){
            	int overbalanceID = Integer.parseInt(listOB.get(i).getCode());
            	%>
            	<div id="dialog<%=overbalanceID%>" class="div-table">
                <table id="myTable<%=overbalanceID%>" style = "position:absolute" >
                    <tr>
                        <th style="width:50%">Mô tả</th>
                        <th>Tài khoản</th>
                        <th>Ngày</th>
                        <th>Số tiền</th>
                    </tr>
                    <% ArrayList<PurchaseBill> lpb = new Dao().getAllPurchaseBill();
                    	for(int j = 0 ; j<lpb.size();j++){
                    		if(lpb.get(j).getOverBalanceID() == overbalanceID){%>
                    			<tr> 
                    			<td> <%= lpb.get(j).getReason() %></td>
                    			<td> <%= overbalanceID %></td>
                    			<td> <%= lpb.get(j).getDate() %></td>
                    			<td> <%= -lpb.get(j).getTotalAmount() %></td>
                    			</tr>
                    			
                    		<%}
                    	}
                    %>
                      <% ArrayList<SellingBill> lsl = new Dao().getAllSellingBill();
                    	for(int j = 0 ; j<lsl.size();j++){
                    		if(lsl.get(j).getOverBalanceID() == overbalanceID){%>
                    			<tr> 
                    			<td> <%= lsl.get(j).getReason() %></td>
                    			<td> <%= overbalanceID %></td>
                    			<td> <%= lsl.get(j).getDate() %></td>
                    			<td> <%= lsl.get(j).getTotalAmount() %></td>
                    			</tr>
                    			
                    		<%}
                    	}
                    %>
                      <% ArrayList<InBill> lib = new Dao().getAllInBill();
                    	for(int j = 0 ; j<lib.size();j++){
                    		if(lib.get(j).getOverBalanceID() == overbalanceID){%>
                    			<tr> 
                    			<td> <%= lib.get(j).getReason() %></td>
                    			<td> <%= overbalanceID %></td>
                    			<td> <%= lib.get(j).getDate() %></td>
                    			<td> <%= lib.get(j).getAmount() %></td>
                    			</tr>
                    			
                    		<%}
                    	}
                    %>
                      <% ArrayList<OutBill> lob = new Dao().getAllOutBill();
                    	for(int j = 0 ; j<lob.size();j++){
                    		if(lob.get(j).getOverBalanceID() == overbalanceID){%>
                    			<tr> 
                    			<td> <%= lob.get(j).getReason() %></td>
                    			<td> <%= overbalanceID %></td>
                    			<td> <%= lob.get(j).getDate() %></td>
                    			<td> <%= -lob.get(j).getAmount() %></td>
                    			</tr>
                    			
                    		<%}
                    	}
                    %>
                    
                </table>
            </div>
            <%}
            
            %>
            
        </div>
        <div class="dialog-footer">
            <p></p>
            <p id="p1">Tổng lợi nhuận trước thuế:</p>
            <p id="p2">Tổng lợi nhuận sau thuế:</p>
            <p></p>
        </div>
    </div>
			<div class="paging"></div>
			</div>	
		</div>
	</div>
	<script>	
		function show(){
			var divtables = document.querySelectorAll('.div-table');
        	var TK = document.getElementById('TKsodu').value;
        	for(var i=0; i<divtables.length;i++){
        		divtables[i].style.visibility = 'hidden';  
        	}
			document.getElementById('dialog'+TK).style.visibility = 'visible';  
			var sum = '0';
			var table = document.getElementById('myTable'+TK);
			for(var i=1; i<table.rows.length;i++){
				sum =  eval(sum + "+" +table.rows[i].cells[3].textContent);
			}
			var p2 = document.getElementById('p2');
			var p1 = document.getElementById('p1');
			p1.innerHTML = "Tổng lợi nhuận trước thuế:" + sum;
			if(Number(sum)>0){
				p2.innerHTML = "Tổng lợi nhuận sau thuế:" + sum/10;
			}
			else{
				p2.innerHTML = "Tổng lợi nhuận sau thuế: 0" ;
			}
		}      	
 	        
    </script> 
</body>
</html>