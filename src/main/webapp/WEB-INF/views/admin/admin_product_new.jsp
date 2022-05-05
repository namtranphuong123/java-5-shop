<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
				<div class="col-8 offset-2 mt-4 ">
					<div class="card" style="width: 75%;margin: 0 auto">
						<div class="card-header" style="background-color: #d0011b; color: white; text-align: center;">
							<h1 style="font-size: 20px; ">
								<b>Sản phẩm</b>
							</h1>
						</div>
						<div class="card-body">
							<form:form action="/admin/SaveProduct" modelAttribute="PRODUCT"
								method="post" enctype="multipart/form-data">
								<div class="row">
									<div class="col-7">
										<div class="form-group">
											<label>Product ID</label>
											<form:input type="text" readonly="true" class="form-control"
												path="id" placeholder="Enter productId" />
											<br>
											<form:errors cssClass="text-danger" path="id"></form:errors>
										</div>
										<div class="form-group">
											<label>Tên sản phẩm </label>
											<form:input type="text" class="form-control" path="name"
												placeholder="Enter name" />
											<br>
											<form:errors cssClass="text-danger" path="name"></form:errors>

										</div>
										<div class="form-group">
											<label>Số lượng</label>
											<form:input type="text" class="form-control" path="quantity"
												placeholder="Enter quantity" />
											<br>
											<form:errors cssClass="text-danger" path="quantity"></form:errors>
										</div>
										
										<div class="input-group form-group">
											<span class="input-group-text">Giá</span>
											<form:input type="number" class="form-control" path="price"
												placeholder="Enter price" />
											<span class="input-group-text">VNĐ</span> <br>
											<form:errors cssClass="text-danger" path="price"></form:errors>
										</div>
										<%-- 	<div class="form-group">
									<label>Ngày</label>
									<form:input type="text" class="form-control" path="price"
										placeholder="Enter price" />
									<br>
									<form:errors cssClass="text-danger" path="price"></form:errors>
								</div> --%>

										<div class="form-group">
											<label for="categoryId">Thể loại</label> <select
												class="form-control" name="categoryId" id="categoryId">
												<c:forEach var="cate" items="${categories}">
													<c:if test="${categori.id eq cate.id }">
														<option selected="selected" value="${cate.id}">${cate.name}</option>
													</c:if>
													<c:if test="${categori.id ne cate.id }">
														<option value="${cate.id}">${cate.name}</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="col-3">
										<div class="form-group">
											<label>Ảnh</label> <input type="file" class="form-control"
												name="photo" accept="image/png,image/jpeg" /><br>
											<p class="text-danger">${error_photo }</p>
										</div>
										<div class="form-group">
											<label>Tình trạng</label>
											<div class="radio">
												<!--value = 1 => Nam| 0 =>Nu -->
												<label class="checkbox-inline"> <form:checkbox
														path="available" /> Có sẵn 
											</div>
										</div>
										<div class="form-group mt-4">
											<label>Giảm giá</label>
											<form:input type="text" class="form-control" path="discount"
												placeholder="Enter discount" />
											<br>
											<form:errors cssClass="text-danger" path="discount"></form:errors>
										</div>
									</div>
								
									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="description">Thông tin sản phẩm </label>
												<form:textarea class="form-control" path="status" rows="2"></form:textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer d-flex mt-3" style="padding: 0;border: none;background-color:transparent;justify-content: space-between;">
									<form:button type="submit" class="btn btn-primary" style="width: 150px;height: 42px;">
										<i class="fas fa-save"></i> Submit</form:button>
									<form:button type="reset" class="btn btn-danger float-right" style="width: 150px;height: 42px;">
										<i class="fas fa-redo"></i> Reset
				</form:button>
									<a href="/admin/product_views" class="btn btn-success" style="width: 150px;height: 42px;"><i
										class="fas fa-list-ul"></i> List Account</a>
								</div>

							</form:form>
						</div>
					</div>
					<div class="mb-5">

						<c:if test="${!empty message }">
							<div class="alert alert-danger" role="alert">
								<b>${message}</b>
							</div>
						</c:if>
						<c:if test="${!empty messagee }">
							<div class="alert alert-info" role="alert">
								<b>${messagee}</b>
							</div>
						</c:if>
					</div>
				</div>
			</section>
		</div>
	</main>
</div>
<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script> -->
