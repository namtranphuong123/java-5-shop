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
				<div class="col-8 offset-2 mt-4 ">
					<div class="card" style="width: 70%;margin: 0 auto;">
						<div class="card-header" style="background-color: #d0011b; color: white; text-align: center;">
							<h1 style="font-size: 20px">
								<b>Thể loại</b>
							</h1>
						</div>
						<div class="card-body">
							<form:form action="/admin/SaveCategory" modelAttribute="Category"
								method="post">
								<div class="form-group">
									<label>ID</label>
									<form:input type="text" readonly="true" class="form-control"
										path="id" placeholder="Enter CategoryID" />
									<br>
									<form:errors cssClass="text-danger" path="id"></form:errors>
								</div>

								<div class="form-group">
									<label>Tên thể loại</label>
									<form:input type="text" class="form-control" path="name"
										placeholder="Enter name" />
									<br>
									<form:errors cssClass="text-danger" path="name"></form:errors>
								</div>
								<div class="card-footer d-flex mt-3" style="padding: 0;justify-content: space-between;background-color: transparent;border: none;">
									<form:button type="submit" class="btn btn-primary" style="width: 150px;height: 42px;">
										<i class="fas fa-save"></i> Submit</form:button>
									<form:button type="reset" class="btn btn-danger float-right" style="width: 150px;height: 42px;">
										<i class="fas fa-redo"></i> Reset
				</form:button>
									<a href="/admin/category_views" class="btn btn-success" ><i class="fas fa-list-ul"></i> List Categories</a>
								</div>

							</form:form>
						</div>
					</div>
					<div class=" mt-2 mb-5">

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

