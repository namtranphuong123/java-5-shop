<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	body{
		background: url(/images/bg_login.png);
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
	}
</style>
<main class=" container" style="margin-top: 100px;">
	<div class="container-fluid px-4" style="margin-top: 26px;">
		<section class="row">
			<div class=" mt-4  ">
				<div class="card">
					<div class="card-header" style="background-color: #d0011b;">
						<h1 style="font-size: 20px; text-align:center ; color: white;">
							<b>Lịch Sử Đơn Hàng</b>
						</h1>
					</div>
					<div class="card-body" style="background-color: #ffebda;">
						<table class="table table-striped table-inverse table-hover ">
							<thead class="thead-inverse">
								<tr>
									<th>Tên khách hàng</th>
									<th>Địa chỉ</th>
									<th>Ngày</th>
									<th>Tổng tiền</th>
									<th>Trạng thái</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="Orders" items="${Orderss}">
									<tr>
										<td scope="row">${Orders.account.fullname }</td>
										<td>${Orders.address }</td>
										<td>${Orders.createDate }</td>
										<td><fmt:formatNumber value="${Orders.amount }"
												type="currency" /></td>
										<td>${Orders.available?"Đã xác nhận":"Chưa xác nhận"}</td>
										<td><a style="margin-right: 15px;"
											href="/user/oderDetails/${Orders.id }"
											class="btn-outline-warning"><i class="fas fa-edit"></i></a> <%--  <a
											href="/admin/deletecate/${Orders.id }"
											class="btn-outline-info"><i class="fas fa-trash-alt"></i></a> --%></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="mt-2">
				<tr>
					<td><a href="/user/index" class="btn btn-warning" style="background-color: #fb5533;"><i
							class="fa fa-angle-left"></i> Tiếp tục mua hàng</a></td>
					<td class="hidden-xs"></td>
				</tr>
			</div>
		</section>
		
	</div>
</main>
