<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" import="java.io.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<style>
            <%@include file="CSS/home.css"%>
            
            
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
			  <li><a href="WageTablet">Tạo bảng lương</a></li>
			  <li><a href="Overbalance">Nhập số dư</a></li>
			  <li><a href="WageTablet">Tạo phiếu thu</a></li>
			  <li><a href="WageTablet">Tạo phiếu chi</a></li>
			  <li><a href="Purchase">Tạo chứng từ mua hàng</a></li>
			  <li><a href="Sell">Tạo chứng từ bán hàng</a></li>
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
					<button>Thêm</button>
					<button>Sửa</button>
					<button>Xóa</button>
				</div>
				
				<div class="grid">
					<table border="1" cellpadding="0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Mã nhà cung cấp</th>
								<th>Tên nhà cung cấp</th>
								<th>Số hóa đơn</th>
								<th>Ngày mua</th>
								<th>Lý do</th>
								<th>Người nhận</th>
								<th>Mã công ty</th>
								<th>Mã số dư</th>
								<th>Tổng tiền</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>01</td>
								<td>NCC1</td>
								<td>Siêu thị điện máy Pico</td>
								<td>HĐ001</td>
								<td>11/05/2021</td>
								<td>Mùa hè này nóng quá</td>
								<td>Phòng kế toán công ty Masi</td>
								<td>CT001</td>
								<td>SD001</td>
								<td>50.000.000</td>					
							</tr>
						</tbody>
					</table>
				
				</div>
				<div class="paging"></div>
			</div>	
		</div>
	</div>
</body>
</html>