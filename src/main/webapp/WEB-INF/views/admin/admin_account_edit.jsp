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


<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4" style="margin-top: 26px;">
			<section class="row">
				<div class="col-8 offset-2 mt-4 ">
					<div class="card" style="width: 70%;margin: 0 auto;">
						<div class="card-header">
							<h1 style="font-size: 20px; ">
								<b>Tài khoản</b>
							</h1>
						</div>
						<div class="card-body">
							<form:form action="/admin/Update" modelAttribute="ACCOUNTS"
								method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label>Tài khoản</label>
									<form:input type="text" readonly="true" class="form-control"
										path="username" placeholder="Enter UserName" />
									<br>
									<form:errors cssClass="text-danger" path="username"></form:errors>
								</div>
								<div class="form-group">
									<label>Mật khẩu</label>
									<form:input type="password" class="form-control"
										path="password" placeholder="Enter password" />
									<br>
									<form:errors cssClass="text-danger" path="password"></form:errors>

								</div>
								<div class="form-group">
									<label>Họ tên</label>
									<form:input type="text" class="form-control" path="fullname"
										placeholder="Enter fullname" />
									<br>
									<form:errors cssClass="text-danger" path="fullname"></form:errors>
								</div>
								<div class="form-group">
									<label>Email</label>
									<form:input type="text" class="form-control" path="email"
										placeholder="Enter email" />
									<br>
									<form:errors cssClass="text-danger" path="email"></form:errors>
								</div>
								<div class="form-group">
									<label>Số điện thoại</label>
									<form:input type="text" class="form-control" path="phone"
										placeholder="Enter phone" />
									<br>
									<form:errors cssClass="text-danger" path="phone"></form:errors>
								</div>
								<div class="form-group">
									<label>Địa chỉ</label>
									<form:input type="text" class="form-control" path="address"
										placeholder="Enter address" />
									<br>
									<form:errors cssClass="text-danger" path="address"></form:errors>
								</div>
								<div class="form-group">
									<label>Ảnh</label> <input type="file" class="form-control"
										name="image" accept="image/png,image/jpeg" /><br>
									<p class="text-danger">${error_photo }</p>
								</div>
								<div class="form-group">
									<label>Status</label>
									<div class="radio">
										<!--value = 1 => Nam| 0 =>Nu -->
										<label class="checkbox-inline"> <form:checkbox
												path="activated" />Kích hoạt
										</label> <label class="checkbox-inline"> <form:checkbox
												path="admin" />Admin
										</label>
									</div>
								</div>
								<div class="card-footer d-flex mt-3 py-0" style="background-color: transparent;justify-content: space-between;border: none;">
									<form:button type="submit" class="btn btn-primary" style="width: 150px;height: 42px;">
										<i class="fas fa-save"></i> Update</form:button> 
									<form:button type="reset" class="btn btn-danger float-right" style="width: 150px;height: 42px;"><i class="fas fa-redo"></i> Reset
				</form:button>
									<a href="/admin/SearchAccount" class="btn btn-success" style="width: 150px;height: 42px;"><i class="fas fa-list-ul"></i> 
										List Account</a>
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
