<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main class=" container" style="margin-top: 100px;">
	<div class="container-fluid px-4" style="margin-top: 26px;">
		<section class="row">
			<div class=" mt-4  ">
				<div class="card">
					<div class="card-header">
						<h1 style="font-size: 20px">
							<b>Chi tiết đơn hàng</b>
						</h1>
					</div>
					<div class="card-body">


						<table class="table table-striped table-inverse table-hover ">
							<thead class="thead-inverse">
								<tr>
									<th>Ảnh&ensp;&ensp;&ensp;&ensp;</th>
									<th>Tên sản phẩm</th>
									<th>Giá tiền</th>
									<th>Số lượng</th>
									<th>Thể loại</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="OrderDetails" items="${OrderDetailss}">
									<tr>
										<td><img alt="" width="80" height="60"
											style="margin-left: -8px; margin-right: -20px;"
											src="/upload/${OrderDetails.product.image}" /></td>
										<td scope="row">${OrderDetails.product.name }</td>
										<td><fmt:formatNumber value="${OrderDetails.price}"
												type="currency" /></td>
										<td>${OrderDetails.quantity}</td>
										<td>${OrderDetails.product.category.name}</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="mt-2">
					<tr>
						<td><a href="/user/oder/${user.username}"
							class="btn btn-warning"><i class="fa fa-angle-left"></i> Danh
								sách đơn hàng</a></td>
						<td class="hidden-xs"></td>
					</tr>
				</div>
			</div>
		</section>
	</div>
</main>
