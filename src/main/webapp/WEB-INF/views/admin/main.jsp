<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/cssadmin/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>



<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Thống kê</h1>
			<section class="row">
				<div class="col mt-4 mb-4 ">
					<div class="card">
						<div class="card-header">
							<h1 style="font-size: 20px">
								<b>TỒN KHO THEO THỂ LOẠI</b>
							</h1>
						</div>
						<div class="card-body">
							<table class="table table-striped table-inverse table-hover ">
								<thead class="thead-inverse">
									<tr>
										<th>Loại hàng</th>
										<th>Tổng giá</th>
										<th>Số sản phẩm</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${items}">
										<tr>
											<td scope="row">${item.group.name }</td>
											<td><fmt:formatNumber value="${item.sum}"
													type="currency" /></td>
											<td>${item.count }</td>
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