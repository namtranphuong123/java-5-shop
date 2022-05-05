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
					<div class="card">
						<div class="card-header">
							<h1 style="font-size: 20px;">
								<b>Đơn hàng</b>
							</h1>
						</div>
						<div class="card-body">
							<form:form action="/admin/SaveOrders" modelAttribute="Orderss"
								method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label>Id</label>
									<form:input type="text" readonly="true" class="form-control"
										path="id" placeholder="Enter id" />
									<br>
								</div>
								<div class="form-group">
									<label>Tên khách hàng</label>
									<form:input type="text" readonly="true" class="form-control"
										path="account.fullname" placeholder="Enter fullname" />
									<br>
								</div>
								<div class="form-group">
									<label>Địa chỉ</label>
									<form:input type="text" readonly="true" class="form-control"
										path="address" placeholder="Enter address" />
									<br>
								</div>
								<div class="form-group">
									<label>Trạng thái</label>
									<div class="radio">
										<!--value = 1 => Nam| 0 =>Nu -->
										<label class="checkbox-inline"> <form:checkbox
												path="available" /> Xác nhận 
									</div>
								</div>
								<div class="card-footer">
									<form:button type="submit" class="btn btn-primary">
										<i class="fas fa-save"></i> Submit</form:button>
									<a href="/admin/oder" class="btn btn-success"><i
										class="fas fa-list-ul"></i> Danh sách đơn hàng</a>
								</div>

							</form:form>
						</div>
					</div>
					<div class="mb-5">
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
