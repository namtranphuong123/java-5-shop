<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.5.0/mdb.min.css"
	rel="stylesheet" />

<div style="margin-top: 63px;" class="my-data" data-spy="scroll"
	data-bs-offset="0" data-target="#subject" id="subject">
	<div class="container">

		<div id="myCarousel" class="carousel slide border"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/images/banner1.png" class="d-block w-100" alt="">
				</div>
				<div class="carousel-item">
					<img src="/images/banner2.png" class="d-block w-100" alt="">
				</div>
			</div>
			<!-- Controls -->
			<a class="carousel-control-prev" href="#myCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#myCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>

		<div class="row" style="margin-top: 20px;">
			<c:forEach var="item" items="${page.content}">
				<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
					<div class="card">
						<div class="hovereffect">
							<img class="card-img-top img-fluid"
								src="/images/rosa_img/${item.image}" alt="">
							<div class="overlay">
								<h2>Đặt hàng</h2>
								<p>
									<a href="/shoppingCart/add/${item.id}"> <i
										class="fas fa-cart-plus"></i>
									</a> <a href="/shoppingCart/add/${item.id}"> <i
										class="fa fa-facebook"></i>
									</a> <a href="/shoppingCart/add/${item.id}"> <i
										class="fas fa-phone"></i>
									</a> <a href="/shoppingCart/add/${item.id}"> <i
										class="fas fa-shipping-fast"></i>
									</a>
								</p>
							</div>
						</div>
						<div class="card-body text-center ">
							<h5>
								<a href=""><b>${item.name}</b></a>
							</h5>

							<fmt:setLocale value="vi_VN" />
							<fmt:formatNumber value="${item.price}" type="currency" />

							<br> <a href="/shoppingCart/add/${item.id}"><button
									type="button" class="btn btn-danger mt-2 hvr-pulse-shrink">Mua</button></a>
						</div>
					</div>

				</div>
			</c:forEach>
		</div>
	</div>
	<div style="margin-bottom: -24px;" class="text-center">${page.number+1}/
		${page.totalPages}</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li ng-click="first()" class="page-item text-primary"><a
				href="/user/search?p=0" class="page-link" style="font-size: 14px;">Đầu
					trang</a></li>
			<c:choose>
				<c:when test="${page.number>0}">
					<li ng-click="prev()" class="page-item text-primary"><a
						href="/user/search?p=${page.number-1}" class="page-link"
						style="font-size: 14px;">Trước</a></li>
				</c:when>
				<c:when test="${page.number>-1}">
					<li ng-click="prev()" class="page-item text-primary"><a
						onclick="return false;" href="/user/search?p=${page.number-1}"
						class="page-link" style="font-size: 14px;">Trước</a></li>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${page.number<page.totalPages-1}">
					<li ng-click="next()" class="page-item text-primary"><a
						href="/user/search?p=${page.number+1}" class="page-link"
						style="font-size: 14px;">Tiếp theo</a></li>
				</c:when>
				<c:when test="${page.number<page.totalPages}">
					<li ng-click="next()" class="page-item text-primary"><a
						onclick="return false;" href="/user/search?p=${page.number+1}"
						class="page-link" style="font-size: 14px;">Tiếp theo</a></li>
				</c:when>
			</c:choose>
			<li ng-click="last()" class="page-item text-primary"><a
				href="/user/search?p=${page.totalPages-1}" class="page-link"
				style="font-size: 14px;">Cuối trang</a></li>
		</ul>
	</nav>

	<section class="smart-testing" style="margin-bottom: -60px;">
		<div class="container">
			<h2 class="title40Bold center-title text-center mt-5">
				<span>UY TÍN TẠO NÊN</span><span> CHẤT LƯỢNG</span>
			</h2>
			<div class="row justify-content-center">
				<div class="col-12 col-lg-3 col-sm-4 col-custom-padding">
					<div class="smart-box">
						<div class="green-rect">
							<img src="/images/smart1.png" alt="Đa dạng nội dung" />
						</div>
						<h3 class="title25Bold">
							<i class="far fa-address-card"></i> Thẻ thành viên
						</h3>
						<p>Chế độ ưu đãi thành viên VIP: 5% cho thành viên Bạc , 10%
							cho thành viên Vàng</p>
					</div>
				</div>
				<div class="col-12 col-1dot4">
					<div class="green-line"></div>
				</div>
				<div class="col-12 col-lg-3 col-sm-4 col-custom-padding">
					<div class="smart-box">
						<div class="green-rect">
							<img src="/images/smart2.png" alt="Ma trận câu hỏi" />
						</div>
						<h3 class="title25Bold">
							<i class="fas fa-shipping-fast"></i> Thanh toán và giao hàng
						</h3>
						<p>Miễn phí vận chuyển cho đơn hàng trên 599.000 VNĐ - Giao
							hàng và thu tiền tận nơi</p>
					</div>
				</div>
				<div class="col-12 col-1dot4">
					<div class="green-line"></div>
				</div>
				<div class="col-12 col-lg-3 col-sm-4 col-custom-padding last">
					<div class="smart-box">
						<div class="green-rect">
							<img src="/images/smart3.png" alt="Đáp án chi tiết" />
						</div>
						<h3 class="title25Bold">
							<i class="fas fa-phone"></i> Hỗ trợ 24/7
						</h3>
						<p>Gọi ngay cho chúng tôi khi bạn có thắc mắc: 0867898999</p>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>