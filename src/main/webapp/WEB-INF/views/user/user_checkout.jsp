<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<style>
					body {
						background: url(../images/bg_login.png);
						background-position: center;
						background-repeat: no-repeat;
						background-size: cover;
					}

					.col-7 {
						flex: 0 0 auto;
						width: 40%;
					}
				</style>

				<main class=" container" style="margin-top: 100px;">
					<div class="container-fluid px-4" style="margin-top: 26px;">
						<section class="row col-12">
							<div class="col-1"></div>
							<div class="col-3 mt-4">
								<div class="col-md-12 col-lg-12" style="background-color: #d0011b;">
									<h4 class="d-flex justify-content-between ">
										<span class="text-danger" ><b style="color: white;">Giỏ hàng</b></span> <span
											class="badge bg-success rounded-pill"><i class="fas fa-cart-plus"></i>
											${Countt}</span>
									</h4>
									<ul class="list-group " >
										<c:forEach var="item" items="${carttItems}">
											<li class="list-group-item d-flex justify-content-between lh-sm">
												<div class="row">
													<h6 class="my-0 col-3">
														<img src="/images/rosa_img/${item.image}"
															style="height: 50px; width: 40px" alt=" "
															class="img-responsive" />
													</h6>
													<h4 class="nomargin col-6" style="font-size: 16px;">${item.name}
													</h4>
													<small class="text">SL: ${item.quantity}</small>
												</div> <span class="text">
													<fmt:formatNumber
														value="${item.price*item.quantity*(100-item.discount)*0.01 }"
														type="currency" />
												</span>
											</li>
										</c:forEach>
										<li class="list-group-item d-flex justify-content-between bg-light">
											<div class="text-danger">
												<h6 class="my-0">Tổng:</h6>
											</div> <span class="text-danger">
												<fmt:formatNumber value="${totall}" type="currency" />
											</span>
										</li>

									</ul>
								</div>
							</div>
							<div class="col-7 mt-4 " style="background-color: #ffebda;">
								<div class="">
									<div class="card-header" style="background-color: #d0011b;width: calc(100% + 24px);margin-left: -12px;">
										<h1 style="font-size: 20px;text-align: center; color: aliceblue;">
											<b>THANH TOÁN</b>
										</h1>
									</div>
									<div class="card-body">
										<form:form action="/cart/checkout" modelAttribute="UserCheckout" method="post"
											enctype="multipart/form-data">
											<div class="form-group">
												<label>Tài khoản</label>
												<form:input type="text" readonly="true" class="form-control"
													path="username" placeholder="Enter UserName" />
												<br>
											</div>
											<div class="form-group">
												<label>Họ tên</label>
												<form:input type="text" readonly="true" class="form-control"
													path="fullname" placeholder="Enter fullname" />
												<br>
											</div>
											<div class="form-group">
												<label>Email</label>
												<form:input type="text" readonly="true" class="form-control"
													path="email" placeholder="Enter email" />
												<br>
											</div>
											<div class="form-group">
												<label>Số điện thoại</label>
												<form:input type="text" class="form-control" path="phone"
													placeholder="Enter phone" />
												<br>
												<c:if test="${!empty messagePhone }">
													<h4 class="text-danger">${messagePhone}</h5>
												</c:if>
											</div>

											<div class="form-group">
												<label>Địa chỉ</label>
												<form:input type="text" class="form-control" path="address"
													placeholder="Enter address" />
												<br>
												<c:if test="${!empty messageAddress }">
													<h4 class="text-danger">${messageAddress}</h4>
												</c:if>
											</div>
											<div class="card-footer">
												<form:button type="submit" class="btn btn-success btn-block"
													style="padding: 0 10px; margin-right: 8px; max-width: 150px; width: 100%">
													<i class="fas fa-check"></i> Thanh toán
												</form:button>
												<a href="/shoppingCart/index" class="btn btn-danger"
													style=" padding: 0 10px; background-color: #fb5533!important;margin-left: 8px;"><i
														class="fas fa-list-ul"></i> Xem giỏ hàng</a>
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
								</div>
							</div>
						</section>
					</div>
				</main>