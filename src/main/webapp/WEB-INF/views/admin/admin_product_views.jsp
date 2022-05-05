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
				<div class="col mt-4 ">
					<div class="card">
						<div class="card-header">
							<h1 style="font-size: 20px; ">
								<b>Danh sách sản phẩm</b>
							</h1>
						</div>
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-8">
									<a href="/admin/product_new" class="btn btn-primary"> <i
										class="fas fa-plus"></i> Add Product
									</a>
								</div>
								<div class="col-4">
									<form class="d-flex" action="/admin/SearchProducts"
										method="post">
										<input name="keywordsProduct" value="${keywordsProduct}"
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
										<th>Ảnh&ensp;&ensp;&ensp;&ensp;</th>
										<th>Tên sản phẩm</th>
										<th>Số lượng</th>
										<th>Giá</th>
										<th>Thể loại</th>
										<th>Thông tin</th>
										<th>Ngày nhập</th>
										<th>Giảm giá</th>
										<th>Tình trạng</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pt" items="${page.content}">
										<%-- <c:forEach items="${ACCOUNTS}" var="ac"> --%>
										<tr>
											<td><img alt="" width="80" height="60"
												style="margin-left: -8px; margin-right: -20px;"
												src="/upload/${pt.image}" /></td>
											<td>${pt.name}</td>
											<td>${pt.quantity}</td>
											<td><fmt:formatNumber value="${pt.price}"
													type="currency" /></td>
											<td>${pt.category.name}</td>
											<td>${pt.status}</td>
											<td>${pt.createDate}</td>
											<td>${pt.discount}</td>
											<td>${pt.available?"Có sẵn":"Chưa có"}</td>
											<td><a href="/admin/edit_Product/${pt.id}"
												class="btn btn-outline-warning"><i class="fas fa-edit"></i></a>
												<a href="/admin/deleteProduct/${pt.id}"
												class="btn btn-outline-info"><i class="fas fa-trash-alt"></i></a>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					

					<div class=" mt-2 mb-5">
						<c:if test="${!empty param.message }">
							<div class="alert alert-info" role="alert">
								<b>${param.message}</b>
							</div>
						</c:if>
						<c:if test="${!empty param.messagee }">
							<div class="alert alert-danger" role="alert">
								<b>${param.messagee}</b>
							</div>
						</c:if>
					</div>
				</div>
			</section>
		</div>
	</main>
</div>