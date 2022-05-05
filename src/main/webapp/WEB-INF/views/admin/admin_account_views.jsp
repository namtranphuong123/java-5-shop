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
				<div class="col mt-4 ">
					<div class="card">
						<div class="card-header">
							<h1 style="font-size: 20px;">
								<b>Danh sách tài khoản</b>
							</h1>
						</div>
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-8">
									<a href="/admin/account" class="btn btn-primary"> <i
										class="fas fa-plus"></i> Add Account
									</a>
								</div>
								<div class="col-4">
									<form class="d-flex" action="/admin/SearchAccount"
										method="post">
										<input name="keywordss" value="${keywordss}"
											class="form-control" type="search" placeholder="Search"
											aria-label="Search">
										<button class="btn btn-outline-success"
											style="margin-left: 5px" type="submit">Tìm</button>
									</form>
								</div>
							</div>
							<table class="table table-striped table-inverse table-hover ">
								<thead class="thead-inverse">
									<tr>
										<th>Ảnh&ensp;&ensp;&ensp;&ensp;</th>
										<th>Tài khoản</th>
										<th>Mật khẩu</th>
										<th>Họ tên</th>
										<th>Email</th>
										<th>SĐT</th>
										<th>Địa chỉ</th>
										<th>Kích hoạt</th>
										<th>Admin</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ac" items="${page.content}">
										<tr>
											<td><img alt="" width="80" height="60"
												style="margin-left: -8px; margin-right: -20px;"
												src="/upload/${ac.photo}" /></td>
											<td>${ac.username}</td>
											<td>${ac.password}</td>
											<td>${ac.fullname}</td>
											<td>${ac.email}</td>
											<td>${ac.phone}</td>
											<td>${ac.address}</td>
											<td>${ac.activated?"online":"offline"}</td>
											<td>${ac.admin?"admin":"user"}</td>
											<td><a href="/admin/edit/${ac.username}"
												class="btn btn-outline-warning"><i class="fas fa-edit"></i></a>
												<%-- <a href="/admin/delete/${ac.username}"
												class="btn btn-outline-info"><i class="fas fa-trash-alt"></i></a> --%>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class=" mt-2 mb-5">
						<c:if test="${!empty param.message }">
							<div class="alert alert-danger" role="alert">
								<b>${param.message}</b>
							</div>
						</c:if>
					</div>
				</div>
			</section>
		</div>
	</main>
</div>