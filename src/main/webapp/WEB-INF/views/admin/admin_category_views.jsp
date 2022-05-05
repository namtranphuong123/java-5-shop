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
							<h1 style="font-size: 20px">
								<b>Danh sách thể loại</b>
							</h1>
						</div>
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-8">
									<a href="/admin/category" class="btn btn-primary"><i
										class="fas fa-plus"></i> Add Account</a>
								</div>
								<div class="col-4">
									<form class="d-flex" action="/admin/SearchCategory"
										method="post">
										<input name="keywordCategory" value="${keywordCategory}"
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
										<th>Category ID</th>
										<th>Thể loại</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cate" items="${cate.content}">
										<tr>
											<td scope="row">${cate.id }</td>
											<td>${cate.name }</td>
											<td><a href="/admin/editCate/${cate.id }"
												class="btn btn-outline-warning"><i class="fas fa-edit"></i></a>
												<a href="/admin/deletecate/${cate.id }"
												class="btn btn-outline-info"><i class="fas fa-trash-alt"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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