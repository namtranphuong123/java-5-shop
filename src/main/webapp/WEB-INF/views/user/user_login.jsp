<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<main class="container" style="margin-top: 100px;background: url(../images/bg_login.png);background-position: center;background-size: cover;background-repeat: no-repeat">
	<section class="row">
		<div class="col-6 offset-3 mt-4 ">

			<form class="form_login" action="/user/dologin" method="post">
                <h2>Đăng Nhập</h2>
                <input type="text" placeholder="Tên đăng nhập" name="username" id="username" aria-describedby="usernameHid" required>
                <input type="password" placeholder="Mật khẩu" name="password" id="password" aria-describedby="passwordHid" required>
                <div class="form-check">
                    <label class="form-check-label">
                      <input type="checkbox" class="form-check-input" name="remember" id="rememberMe" value="true" >
                      Remember Me
                    </label>
                  </div>
				<div class="group-login d-flex mt-3" style="align-items: center;">
					<button style="width: 48%" type="submit">Đăng Nhập</button>
					<button style="width: 48%; height: 44px;align-items: center;justify-content: center;" type="reset" class="d-flex btn btn-secondary">Reset</button>
				</div>
               
            </form>

			<div class=" row py-3" style="width: 400px;padding: 1.375rem 1.875rem;margin: 0 auto;background: #fff;">
				<div class=" col-6 small">
					<a href="/user/passwordMail">Quên mật khẩu?</a>
				</div>
				<div class="col-6 small">
					<a href="/user/newAccount">Chưa có tài khoản? Đăng ký ngay!</a>
				</div>
			</div>
			<div class=" mt-2 mb-5" style="width: 400px; margin: 0 auto">
				<c:if test="${!empty mess}">
					<div class="alert alert-danger" role="alert">
						<b>${mess}</b>
					</div>
				</c:if>
			</div>
		</div>
	</section>
	<footer class="row"></footer>
</main>
