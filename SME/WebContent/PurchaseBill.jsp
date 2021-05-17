<%@page import="model.PurchaseBill"%>
<%@page import="model.OverBalance"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page import="model.Customer"%>
<%@page import="model.Good"%>
<%@page import="model.OverBalance"%>
<%@page import="DAO.Dao"%>

<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<style>
            <%@include file="CSS/Customer.css"%>
             <%@include file="CSS/purchaseBill.css"%>
            
            
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
			  <li><a href="WageTablet">Tạo bảng lương</a></li>
			  <li><a href="Overbalance">Nhập số dư</a></li>
			  <li><a href="WageTablet">Tạo phiếu thu</a></li>
			  <li><a href="WageTablet">Tạo phiếu chi</a></li>
			  <li><a href="PurchaseBill">Tạo chứng từ mua hàng</a></li>
			  <li><a href="SellingBill">Tạo chứng từ bán hàng</a></li>
			  <li><a href="GTGT">Tạo biên lai thuế GTGT</a></li>
			  <li><a href="ProfitLoss">Kết chuyển lãi lỗ</a></li>
			  <li><a href="Report">In báo cáo tài chính</a></li>
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
								<th>Mã chứng từ</th>
								<th>Ngày nhập</th>
								<th>Nhà cung cấp</th>
								<th>Người nhận</th>
								<th>Diễn giải</th>
								<th>Số dư</th>
								<th>Tổng tiền</th>
								
							</tr>
						</thead>
						<tbody>
							
								<% 
									ArrayList<PurchaseBill> listPB = null;
									listPB = new Dao().getAllPurchaseBill();
									if(listPB != null){
										for(int i=0; i< listPB.size(); i++){ 
								%>
								<tr>
									<td><%= listPB.get(i).getId() %></td>
									<td class="MaCT"><%= listPB.get(i).getBillCode() %></td>
									<td><%= listPB.get(i).getDate() %></td>
									<td><%= listPB.get(i).getSellerCode() %></td>
									<td><%= listPB.get(i).getReceiver() %></td>
									<td><%= listPB.get(i).getReason() %></td>
									<td><%= listPB.get(i).getOverBalanceID() %></td>
									<td><%= listPB.get(i).getTotalAmount() %></td>
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
	<form  action="doPurchaseBill" method="post">
		<div class="dialog">
	        <div class="dialog-title">
	            <div class="Tittle-text">
	                Chứng từ mua hàng
	            </div>
	            <div class="title-close-button" onclick="cancel()">X</div>
	        </div>
	        <div class="dialog-body">
	            <div class="dialog-detail">
	                <div class="general"><b>Thông tin chung</b>
	                    <div class="detail">
	                        <label for="">Nhà cung cấp:</label>
	                        <select onclick="show()" name="nhacc" id="nhacc">
	                        	<% ArrayList<Customer> listCust = null;
									listCust = new Dao().getAllCust();
										for(int i=0; i< listCust.size(); i++){ 
		                        	
	                        	 %>
	                            <option value="<%= listCust.get(i).getName()%>"><%= listCust.get(i).getCode() %></option>
	                            <% } %>
	                        </select>
	                        
	                        <input style="width:225px" type="text" name="nhacc1" id="nhacc1" required="required">
	                        <br>
	                        <label for="">Diễn giải: </label>
	                        <input style="width:400px;margin-bottom: 5px;margin-top: 5px;" type="text" name="reason" id="" required="required"><br>
	                        <label for="">Nhân viên mua hàng:</label>
	                        <input type="text" name="NVMH" id="" required="required">
	                    </div>
	                </div>
	                <div class="license"> <b>Chứng từ</b>
	                    <div class="detail">
	                        <label style="margin: 0px;margin-bottom: 5px;" for="">Ngày nhập:</label>
	                        <input style="width: 130px;" type="date" name="date" id="" required="required">
	                        <label style="margin: 0px" for="" >Mã chứng từ:</label>
	                        <input style="margin-top: 2px;" type="text" name="code" id="code" required="required">
	                    </div>
	                </div>
	            </div>
	            <div class="dialog-table">
	                <button onclick="addRow()" type="button">Thêm hàng</button>
	                <table id="myTable">
	                    <tr>
	                        <th>Tên hàng</th>
	                        <th>Số lượng</th>
	                        <th>Đơn giá</th>
	                        <th>Thành tiền</th>
	                        <th style="visibility: hidden; border: none;">button</th>
	                    </tr>
	                </table>
	            </div>
	        </div>
	        <div class="dialog-footer">
	            <div>
	                <label for="">Tài khoản:</label>
	                <select name="overBalanceID" id="">                         
	                    <% ArrayList<OverBalance> listOB = null;
									listOB = new Dao().getAllOB();
										for(int i=0; i< listOB.size(); i++){ 
		                        	
	                        	 %>
	                            <option value="<%= listOB.get(i).getCode()%>"><%= listOB.get(i).getCode() %></option>
	                            <% } %>
	                </select>
	                <p id="p1">Tổng tiền hàng:</p>
	                <p id="p2">Tiền thuế GTGT:</p>
	                <p id="p3">Tổng GT:</p>
	            </div>
	            <div>
	                <input id="btnSave" type="button" value="Lưu" onclick="
			            var MaCTs = document.getElementsByClassName('MaCT');
			    	    
			    	    var btnSave = document.getElementById('btnSave');
			    	    var code = document.getElementById('code');
			            for (var MaCT of MaCTs) {
			            	console.log(code.value);
				            if (code.value === MaCT.textContent) {		            	
				                alert('Mã Chứng từ đã tồn tại');		                
				                code.style.border = ' 2px solid red';
				                return;
				            }
				            
				        }
			            btnSave.setAttribute('type','submit');">
	            </div>
	        </div>
	    </div>
	</form>
	
    <script>
	    var content = document.querySelector(".content");
	    var dialog = document.querySelector(".dialog");
        function cancel() {
            dialog.style.visibility = "hidden";
            content.style.opacity = 1;
        }
        function add(){
            dialog.style.visibility = "visible";
            content.style.opacity = 0.5; 
            dialog.style.opacity = 1;               
        }
        function show() {
            var nhacc = document.getElementById("nhacc");
            var nhacc1 = document.getElementById("nhacc1");
            nhacc1.value = nhacc.value;
        }

        function addRow() {
            var tr = document.createElement('tr');
            var table = document.getElementById("myTable");
            var name = "code";
            for (let i = 0; i < 5; i++) {
                var input = document.createElement('input');
                input.setAttribute('type', 'text');
                var td = document.createElement('td');
                input.setAttribute("name", name + i);
                td.appendChild(input);
                if (i === 0) {
                	var select = document.createElement('select');
                	select.setAttribute('name', 'goodName');
                	<% ArrayList<Good> listGood = null;
                	listGood = new Dao().getAllGood();
                	%>
                	console.log(<%= listGood.size() %>);
                	<%
                 		for (int j = 0; j < listGood.size(); j++) { %>
	                 		var option = document.createElement('option');
	                        option.setAttribute('value', '<%= listGood.get(j).getName() %>');
	                        option.innerHTML = '<%= listGood.get(j).getName()%>';
	                        select.appendChild(option);
	                        
                 	<% }  %>
                    select.setAttribute("width", '100%');
                    select.setAttribute("height", '100%');
                    td.appendChild(select);
                    td.removeChild(input);
                }
                if (i === 1 || i === 2) {             	
                    input.setAttribute('onchange', 'mul()');
                }
                if (i === 4) {
                    td.innerHTML = "";
                    var button = document.createElement('button');
                    button.innerText = "remove";
                    td.appendChild(button);
                }
                tr.appendChild(td);
                tr.setAttribute('name', 'myTr');
            }
            table.appendChild(tr);
            button.addEventListener("click", () => {
                table.removeChild(tr);
            });
            for (var m = 1; m < table.rows.length; m++) {
                table.rows[m].cells[1].children[0].value = '0';
                table.rows[m].cells[2].children[0].value = '0';
                // table.rows[m].cells[3].children[0].value = '0';
            }
            mul = () => {
            	var totalAmount = 0;
            	
                for (var m = 1; m < table.rows.length; m++) {
                    var soLuong = table.rows[m].cells[1].children[0].value;
                    var donGia = table.rows[m].cells[2].children[0].value;
                    table.rows[m].cells[3].children[0].value = eval(soLuong + ' * ' + donGia);
                    totalAmount = eval(soLuong + ' * ' + donGia + "+" + totalAmount);
                    
                }
                document.getElementById("p1").innerHTML = "Tổng tiền hàng: "+ totalAmount;
                document.getElementById("p2").innerHTML = "Tiền thuế GTGT: "+ eval(totalAmount/10);
                document.getElementById("p3").innerHTML = "Tổng GT: "+ eval(totalAmount + "+" + totalAmount/10);
            }
            return ;
        }
    </script>
</body>
</html>