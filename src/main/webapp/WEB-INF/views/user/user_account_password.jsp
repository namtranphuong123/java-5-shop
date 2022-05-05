<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
	body{
		background: url(/images/bg_login.png);
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	}
</style>
<main class=" container" style="margin-top: 100px;">
	<div class="container-fluid px-4" style="margin-top: 26px;">
		<section class="row">
			<div class="col-6 offset-3 mt-4 ">
				<div class="card" style="background-color: #ffebda;">
					<div class="card-header" style="background-color: #d0011b;text-align: center;">
						<h1 style="font-size: 20px;color: white; ">
							<b >Đổi mật khẩu</b>
						</h1>
					</div>
					<div class="card-body">
						<form:form action="/user/updatePassword" modelAttribute="ACCOUNTS"
							method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label>Tài khoản</label>
								<form:input type="text" readonly="true" class="form-control"
									path="username" placeholder="Enter UserName" />
								<br>
								<form:errors cssClass="text-danger" path="username"></form:errors>
							</div>
							<div class="form-group">
								<label for="password">Mật khẩu</label> <input type="password"
									class="form-control" name="password" id="password"
									aria-describedby="passwordHid" placeholder="Password">
								<small id="passwordHid" class="form-text text-muted">&ensp;</small>
							</div>

							<div class="form-group">
								<label for="password">Mật khẩu mới</label> <input
									type="password" class="form-control" name="passwordnew"
									id="passwordnew" aria-describedby="passwordHid"
									placeholder="Password new"> <small id="passwordHid"
									class="form-text text-muted">&ensp;</small>
							</div>
							<div class="form-group">
								<label for="password">Nhập mật khẩu mới</label> <input
									type="password" class="form-control" name="passwordnew1"
									id="passwordnew1" aria-describedby="passwordHid"
									placeholder="Password new"> <small id="passwordHid"
									class="form-text text-muted">&ensp;</small>
							</div>
							<div class="card-footer">
								<form:button type="submit" class="btn btn-primary" style="background-color: #f94c2f;" >
									<i class="fas fa-save"></i> Update</form:button>
								<form:button type="reset" class="btn btn-danger float-right" style="background-color: #f94c2f!important;">
									<i class="fas fa-redo"></i> Reset
				</form:button>
							</div>

						</form:form>
					</div>
				</div>
				<div class="mb-5">

					<c:if test="${!empty mess }">
						<div class="alert alert-danger" role="alert">
							<b>${mess}</b>
						</div>
					</c:if>
					<c:if test="${!empty message }">
						<div class="alert alert-info" role="alert">
							<b>${message}</b>
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
