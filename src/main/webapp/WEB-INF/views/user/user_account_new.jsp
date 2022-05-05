<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<div class="col-6 offset-3 mt-4 ">
				<div class="card" style="background-color: #ffebda;">
					<div class="card-header" style="background-color: #d0011b;">
						<h1 style="font-size: 20px; color: white;text-align: center; ">
							<b >Đăng ký tài khoản</b>
						</h1>
					</div>
					<div class="card-body">
						<form:form action="/user/SaveUserAccount"
							modelAttribute="ACCOUNTS" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>Tài khoản</label>
								<form:input type="text" class="form-control" path="username"
									placeholder="Enter UserName" />
								<br>
								<form:errors cssClass="text-danger" path="username"></form:errors>
							</div>
							<div class="form-group">
								<label>Mật khẩu</label>
								<form:input type="password" class="form-control" path="password"
									placeholder="Enter password" />
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
							<div class="card-footer">
								<form:button type="submit" class="btn btn-primary" style="background:#fb5533">
									<i class="fas fa-save"></i> Submit</form:button>
								<form:button type="reset" class="btn btn-danger float-right" style="background: #fb5533!important;">
									<i class="fas fa-redo"></i> Reset
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