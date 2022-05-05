<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.5.0/mdb.min.css" rel="stylesheet" />

			<div style="margin-top: 63px;background-color: rgb(244, 244, 244);" class="my-data" data-spy="scroll" data-bs-offset="0" data-target="#subject"
				id="subject">
				<div class="container">

					<div class="wrap-quangcao" style="padding-top: 36px">
						<img src="/images/quangcao1.png" alt="">
						<img src="/images/quangcao2.png" alt=""> 
						<img src="/images/quangcao3.png" alt=""> 
						<img src="/images/quangcao4.png" alt="">
					</div>

					<div class="row" style="margin-top: 20px;">
						<c:forEach var="item" items="${page.content}">
							<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
								<div class="card">
									<div class="hovereffect">
										<img style="height: 360px;object-fit:cover" class="card-img-top img-fluid" src="/images/rosa_img/${item.image}" alt="">
										
									</div>
									<div class="card-body text-center ">
										<h5>
											<a href=""><b>${item.name}</b></a>
										</h5>

										<fmt:setLocale value="vi_VN" />
										<fmt:formatNumber value="${item.price}" type="currency" />

										<br> <a href="/shoppingCart/add/${item.id}"><button type="button"
												class="btn btn-danger mt-2 ">Chọn Mua</button></a>
									</div>
								</div>

							</div>
						</c:forEach>
					</div>
				</div>
			<%-- 	//<div style="margin-bottom: -24px;" class="text-center">${page.number+1}/
					${page.totalPages}</div>// --%>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li ng-click="first()" class="page-item text-primary"><a href="/user/search?p=0"
								class="page-link" style="font-size: 14px;">Đầu
								trang</a></li>
						<c:choose>
							<c:when test="${page.number>0}">
								<li ng-click="prev()" class="page-item text-primary"><a
										href="/user/search?p=${page.number-1}" class="page-link"
										style="font-size: 14px;">Trước</a></li>
							</c:when>
							<c:when test="${page.number>-1}">
								<li ng-click="prev()" class="page-item text-primary"><a onclick="return false;"
										href="/user/search?p=${page.number-1}" class="page-link"
										style="font-size: 14px;">Trước</a></li>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.number<page.totalPages-1}">
								<li ng-click="next()" class="page-item text-primary"><a
										href="/user/search?p=${page.number+1}" class="page-link"
										style="font-size: 14px;">Tiếp theo</a></li>
							</c:when>
							<c:when test="${page.number<page.totalPages}">
								<li ng-click="next()" class="page-item text-primary"><a onclick="return false;"
										href="/user/search?p=${page.number+1}" class="page-link"
										style="font-size: 14px;">Tiếp theo</a></li>
							</c:when>
						</c:choose>
						<li ng-click="last()" class="page-item text-primary"><a
								href="/user/search?p=${page.totalPages-1}" class="page-link"
								style="font-size: 14px;">Cuối trang</a></li>
					</ul>
				</nav>
				
				<section class="danhmuc_noibat">
					<div class="container">
						<div class="wrap_noibat">
                    <h2>Danh mục nổi bật</h2>
                    <div class="wrap-danhmuc">
                        <div class="item">
                            <a href="#!">
                                <img src="/images/item-1.jpg">
                                <h6>Dây Đeo Thay Thế, Phụ Trợ - Phụ Kiện Khác</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="/images/item-2.jpg">
                                <h6>Adapter Sạc - Cáp Sạc Cho Thiết Bị Đeo</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="/images/item-3.jpg">
                                <h6>Đèn khác</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-4.jpg">
                                <h6>Nội thất</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-5.jpg">
                                <h6>Đồ dùng phòng ngủ</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-6.jpg">
                                <h6>Tai Nghe Có Dây Nhét Tai</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-7.jpg">
                                <h6>Vòng Đeo Thông Minh - Vòng Theo Dõi Vận Động</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-8.jpg">
                                <h6>Sửa chữa nhà cửa</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-9.jpg">
                                <h6>Thiết bị gia đình</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-10.jpg">
                                <h6>Bể cá & Phụ kiện</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-1.jpg">
                                <h6>Dây Đeo Thay Thế, Phụ Trợ - Phụ Kiện Khác</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-2.jpg">
                                <h6>Adapter Sạc - Cáp Sạc Cho Thiết Bị Đeo</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-3.jpg">
                                <h6>Đèn khác</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-4.jpg">
                                <h6>Nội thất</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-5.jpg">
                                <h6>Đồ dùng phòng ngủ</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-6.jpg">
                                <h6>Tai Nghe Có Dây Nhét Tai</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-7.jpg">
                                <h6>Vòng Đeo Thông Minh - Vòng Theo Dõi Vận Động</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-8.jpg">
                                <h6>Sửa chữa nhà cửa</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-9.jpg">
                                <h6>Thiết bị gia đình</h6>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#!">
                                <img src="../images/item-10.jpg">
                                <h6>Bể cá & Phụ kiện</h6>
                            </a>
                        </div>
                    </div>
                </div>
					</div>
				</section>
				
			</div>