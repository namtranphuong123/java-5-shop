<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.menult {
	display: none;
}

.mainmenu:hover .menult {
	display: block;
}

.img-responsive {
	width: 100%;
}

.thongbaocss {
	text-align: left;
	padding: 10px;
	background: #000000;
	margin-top: 10px;
	color: #fff;
	font-weight: bold;
}

.list-group {
	margin-top: 15px;
}

.list-group-item {
	padding: 10px;
}

.text-muted {
	color: #ff0000 !important;
	font-weight: bold;
}
</style>
<style>
.shop_table th {
	font-weight: 600 !important;
	background: #fafafa;
}

.shop_table .cart-subtotal th, .shop_table .shipping th, .shop_table .total th,
	.order_details th, .shop_table .order-total th {
	border-right: 1px solid #e8e8e8 !important;
}

table.shop_table th {
	font-weight: 700;
	padding: 9px 12px;
}

table.shop_table tfoot th {
	font-weight: 700;
	border-top: 1px solid rgba(0, 0, 0, .1);
}

table td {
	border-top: 1px solid rgba(0, 0, 0, .1);
	padding: 6px 12px;
	vertical-align: middle;
}

table td {
	padding: 6px 6px 0 6px;
}

table th {
	border: 1px solid #e3e3e3;
}

.woocommerce-Price-amount {
	color: #e32124;
	font-weight: bold;
}

table {
	width: 100%;
	border: 1px solid #e3e3e3;
}
body{
	background: url(../images/bg_login.png);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}
</style>

<main class="container" style="background-color: #ffebda ;margin-top: 100px; margin-bottom: 108px">
	<div class="row">
		<table id="cart"
			class="table table-hover table-condensed d-none d-sm-block">
			<thead>
				<tr>
					<th style="width: 45%"><b>Sản phẩm</b></th>
					<th style="width: 10%"><b>Đơn giá</b></th>
					<th style="width: 13%"><b>Số lượng</b></th>
					<th style="width: 22%" class="text-center"><b>Tổng tiền</b></th>
					<th style="width: 10%"><b>Cập nhật</b></th>
				</tr>
			</thead>
			<tbody>
				<c:set var="no" value="1"></c:set>
				<c:forEach var="item" items="${items}">
					<form action="/shoppingCart/update" method="post">
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<img src="/images/rosa_img/${item.image}"
											style="height: 100px; width: 80px" alt=" "
											class="img-responsive" />
									</div>
									<div class="col-sm-10">
										<h4 class="nomargin" style="font-size: 16px;">${item.name}</h4>
										<%-- <p>${item.status}</p> --%>
									</div>
								</div>
							</td>
							<td style="padding-top: 35px;"><fmt:formatNumber
									value="${item.price}" type="currency" />
								<p class="mb-2" style="color: red; margin-top: 5px;">(-${item.discount}%)</p></td>
							<td data-th="Quantity"><input type="hidden" name="id"
								value="${item.id}"> <input type="number"
								class="form-control text-center" value="${item.quantity}"
								name="quantity" onblur="this.form.submit()"></td>
							<td data-th="Subtotal" class="text-center"><fmt:formatNumber
									value="${item.price*item.quantity*(100-item.discount)*0.01 }"
									type="currency" /></td>
							<td>
								<button class="btn btn-danger btn-sm">
									<a style="background: #fb5533;color: white; padding: 10px 80px; margin: 0px -60px;"
										href="/remove/${item.id}"><i class="far fa-trash-alt"></i></a>
								</button> <%-- <button class="btn btn-sm btn-danger">
										<i class="fa fa-trash"></i><a style="color: white;"
											href="/remove/${item.id}"> REMOVE</a>
									</button> --%>
							</td>
						</tr>
					</form>
					<c:set var="no" value="${no + 1}"></c:set>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td><a style="background: #fb5533" href="/user/index" class="btn btn-warning"><i
							class="fa fa-angle-left"></i> Thêm sản phẩm</a></td>
					<td class="hidden-xs"></td>
					<td></td>
					<td class="hidden-xs text-center"><b
						style="margin-top: 13px; line-height: 41px; color: #f00;">
							Tổng tiền: <fmt:formatNumber value="${total}" type="currency" />
					</b></td>
					<c:if test="${Count eq 0 }">
						<td><a href="" class="btn btn-success btn-block"
							style="padding: 0px">Thanh toán <i class="fa fa-angle-right"></i>
						</a></td>
					</c:if>
					<c:if test="${Count > 0 }">
						<td><a href="/shoppingCart/checkout"
							class="btn btn-success btn-block" style="padding: 0px">Thanh
								toán <i class="fa fa-angle-right"></i>
						</a></td>
					</c:if>
				</tr>
			</tfoot>
		</table>
		<div class=" mt-2 mb-5 row">
			<div class="col-3">
				<c:if test="${!empty param.messageCheckOut }">
					<div class="alert alert-info" role="alert">
						<b><i class="fas fa-bullhorn"></i> ${param.messageCheckOut} <i
							class="fas fa-check"></i></b>
					</div>
				</c:if>
			</div>
			<div class="col-9"></div>
		</div>
	</div>
</main>