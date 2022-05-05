<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/cssadmin/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

	<style>
		main{
			background-color: #ffebda;
		}
	</style>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4" style="margin-top: 26px;">
			<section class="row">
				<div class=" mt-4  ">
					<div class="card">
						<div class="card-header">
							<h1 style="font-size: 20px">
								<b>Danh sách đơn hàng</b>
							</h1>
						</div>
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-8"></div>
								<div class="col-4">
									<form class="d-flex" action="/admin/SearchOrders" method="post">
										<input name="keywordsOrders" value="${keywordsOrders}"
											class="form-control" type="search" placeholder="Search"
											aria-label="Search">
										<button class="btn btn-outline-success"
											style="margin-left: 5px" type="submit">Tìm</button>
									</form>
								</div>
							</div>
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
									<c:forEach var="Orders" items="${Orderss.content}">
										<tr>
											<td scope="row">${Orders.account.fullname }</td>
											<td>${Orders.address }</td>
											<td>${Orders.createDate }</td>
											<td><fmt:formatNumber value="${Orders.amount }"
													type="currency" /></td>
											<td>${Orders.available?"Đã xác nhận":"Chưa xác nhận"}</td>
											<td><a style="margin-right: 15px;"
												href="/admin/edit_orders/${Orders.id }"
												class="btn-outline-warning"><i class="fas fa-edit"></i></a>
												<a href="/admin/oderDetails/${Orders.id }"
												class="btn-outline-info"><i class="fas fa-list-ul"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
			</section>
		</div>
	</main>
</div>