<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/cssadmin/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" >
		<div class="sb-sidenav-menu" style="background-color: #d0011b; ">
			<div class="nav" >

				<a class="nav-link" href="/admin/report" style="color: white!important;">
					<div class="sb-nav-link-icon" style="color: white!important;">
						<i class="fas fa-tachometer-alt"></i>
					</div> Thống kê
				</a>
				<div class="sb-sidenav-menu-heading" style="color: white!important;">QUẢN LÝ</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayouts" aria-expanded="false"
					aria-controls="collapseLayouts" style="color: white!important;">
					<div class="sb-nav-link-icon" style="color: white!important;">
						<i class="fas fa-columns" ></i>
					</div> Tài khoản
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" >
					<nav class="sb-sidenav-menu-nested nav" >
						<a class="nav-link" href="/admin/account" >Tài Khoảng Mới</a> <a
							class="nav-link" href="/admin/account_views">Danh sách tài
							khoản</a>
					</nav>
				</div>
				

				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayout" aria-expanded="false"
					aria-controls="collapseLayout" style="color: white!important;">
					<div class="sb-nav-link-icon" style="color: white!important;">
						<i class="fas fa-columns" ></i>
					</div> Thể Loại
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>	
				<div class="collapse" id="collapseLayout"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="/admin/category"> Thể loại mới</a> <a
							class="nav-link" href="/admin/category_views">Danh sách thể
							loại</a>
					</nav>
				</div>

				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayou" aria-expanded="false"
					aria-controls="collapseLayou" style="color: white!important;">
					<div class="sb-nav-link-icon"style="color: white!important;">
						<i class="fas fa-columns"></i>
					</div> Mặt hàng
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayou"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="/admin/product_new"> Thêm  Mặt hàng</a> <a
							class="nav-link" href="/admin/product_views">Danh sách  Mặt hàng</a>
					</nav>
				</div>

				<a class="nav-link collapsed" href="/admin/oder" style="color: white!important;">
					<div class="sb-nav-link-icon"style="color: white!important;">
						<i class="fas fa-columns"></i>
					</div> Danh sách đặt hàng
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
			</div>
		</div>
	</nav>
</div>