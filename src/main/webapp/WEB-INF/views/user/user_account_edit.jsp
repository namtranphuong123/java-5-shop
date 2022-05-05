<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<main class=" container" style="margin-top: 100px;">
	<div class="container-fluid px-4" style="margin-top: 26px;">
		<section class="row" style="background: url(/images/bg_login.png);background-size: cover;background-position: center;background-repeat: no-repeat;">
			<div class="col-6 offset-3 mt-4 ">
				<div class="card" style="background-color: #ffebda; width: 70%;margin: 0 auto;">
					<div class="card-header" style="background-color: #d0011b;">
						<h1 style="font-size: 20px; text-align: center;color: white;">
							<b>THÔNG TIN CÁ NHÂN</b>
						</h1>
					</div>
					<div class="card-body">
						<form:form action="/user/UpdateUserAccount"
							modelAttribute="ACCOUNTS" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>Tên Tài Khoản</label>
								<form:input type="text" readonly="true" class="form-control"
									path="username" placeholder="Enter UserName" />
								<br>
								<form:errors cssClass="text-danger" path="username"></form:errors>
							</div>
							<div class="form-group">
								<label>Mật khẩu</label>
								<form:input type="password" readonly="true" class="form-control" path="password"
									placeholder="Enter password" />
								<br>
								<form:errors cssClass="text-danger" path="password"></form:errors>

							</div>
							<div class="form-group">
								<label>Họ và tên</label>
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
								<label>Ảnh cá nhân</label> <input type="file" class="form-control"
									name="image" accept="image/png,image/jpeg" /><br>
								<p class="text-danger">${error_photo }</p>
							</div>
							<div class="card-footer d-flex" style="padding: 0;background-color: transparent; border: none">
								<form:button type="submit" class="btn btn-primary float-left" style="width: 48%; background-color: #f94c2f!important;">
									<i class="fas fa-save"></i> Cập  Nhật</form:button>
								<form:button type="reset" class="btn btn-danger float-right" style="width: 48%;background-color: #f94c2f!important;">
									<i class="fas fa-redo"></i> Mới
				</form:button>
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
<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script> -->
