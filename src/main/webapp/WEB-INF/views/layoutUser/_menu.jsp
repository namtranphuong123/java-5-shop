<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
		<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.5.0/mdb.min.css" rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.5.0/mdb.min.css"
	rel="stylesheet" /> -->

		<!-- <link rel="stylesheet"
	href="https://s.tracnghiem.net/assets/css/common.css?id=1.002j">
<link rel="stylesheet"
	href="https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css" />
<script
	src="https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js"></script> -->

		<body>
			<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" style="background: #f5f5f5!important;">
				<div class="container">
					<a class="navbar-brand" href="/user/index">
						<img height="60" src="/images/logo.png" alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#collapsibleNavbar">
						<span class="navbar-toggler-icon "><i class="fas fa-align-justify"></i></span>
					</button>
					<div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
						<ul class="navbar-nav ">
							<li class="nav-item mx-2">&ensp;&ensp;&ensp;&ensp;</li>
							<li class="nav-item mx-2">&ensp;&ensp;&ensp;&ensp;</li>
							<li class="nav-item mx-2"><a class="nav-link hvr-underline-from-center text-body"
									href="/user/index"> <i class="fas fa-home"></i> TRANG CHỦ
								</a></li>

							<div class="wrap-header">
								<form action="/user/search" method="POST">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm" style="border: 1px solid #fb5533"
											name="keywords" value="${keywords}">
										<div class="input-group-append">
											<button style="min-width: 100px;max-width: 110px;padding: 0;height: 35px;border-radius: 0;" class="btn btn-outline-secondary" type="submit">Search</button>
										</div>
									</div>
								</form>
							</div>
							
						</ul>
						<div style="margin-bottom: 3px">
						
							
								<c:if test="${empty user }">
									<a href="/user/login"><button type="button" class=" mx-2 button1 button1:hover" style="background: #fb5533!important;">
											<span class="caret"></i>Đăng nhập</span>
										</button> </a>
									

								</c:if>
								<c:if test="${!empty user }">
									<span>&ensp;&ensp;</span>
									<button type="button" class=" button1 button1:hover" data-toggle="dropdown">
										<span class="caret"><i class="fas fa-user-cog"></i>
											${user.fullname}</span>
									</button>
									<div class="dropdown-menu" style="margin-left: 90px">
										<a class="dropdown-item" href="/user/editUserAccount/${user.username}">Tài khoảng
									</a> <a class="dropdown-item" href="/user/editPassword/${user.username}">
											Đổi mật khẩu</a> <a class="dropdown-item"
											href="/user/oder/${user.username}">hàng đã mua</a> <a
											class="dropdown-item" href="/user/logout"> Đăng xuất</a>
									</div>
								</c:if>
						</div>
					</div>
				</div>
			</nav>
		</body>