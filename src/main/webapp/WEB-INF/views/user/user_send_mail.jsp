<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<main class="container" style="margin-top: 100px;">
	<section class="row">
		<div class="col-6 offset-3 mt-4 ">
			<form action="/user/passwordMaill" method="POST">
				<div class="card">
					<div class="card-header">
						<h1 style="font-size: 20px;">
							<b>Quên mật khẩu</b>
					</div>
					<div class="card-body">
						<div>Quên mật khẩu? Nhập địa chỉ email của bạn và chúng tôi
							sẽ gửi cho bạn mật khẩu</div>
						<div class="form-group mt-3">
							<label for="email">Email</label> <input type="text"
								class="form-control" name="email" id="email" required="required"
								aria-describedby="emailHid" placeholder="Email"> <small
								id="emailHid" class="form-text text-muted">&ensp;</small>
						</div>
						<div class="card-footer text-muted">
						<button class="btn btn-primary">Gửi email</button>
					</div>
					</div>
				</div>
			</form>
			<div class=" mt-2 mb-5">
				<c:if test="${!empty message}">
					<div class="alert alert-danger" role="alert">
						<b>${message}</b>
					</div>
				</c:if>
			</div>
		</div>
	</section>
	<footer class="row"></footer>
</main>
