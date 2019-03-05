<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    


<script>

	$(function () {
		
		$('.banner').slick({
	
			autoplay : true,
			dots: true,
			speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
			infinite: true,
			autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
			arrows: true,
			slidesToShow: 1,
			slidesToScroll: 1,
			fade: false,
			pauseOnHover : true
			
		});
	});
	
</script>

<!-- 배너 구성요소  -->
<div class="banner slider--15">
	<div class="owl-item active" >
		<div class="slide animation__style10 bg-image--1 fullscreen align__center--left">
            <div class="container">
            	<div class="row">
            		<div class="col-lg-12">
            			<div class="slider__content">
	            			<div class="contentbox" style="margin-left: 80px;">
	            				<h2>Buy <span>your </span></h2>
	            				<h2>favorite <span>Book </span></h2>
	            				<h2>from <span>Here </span></h2>
			                   	<a class="shopbtn" href="#">shop now</a>
	            			</div>
            			</div>
            		</div>
            	</div>
            </div>
		</div>
	</div>
	<div class="owl-item active" >
		<div class="slide animation__style10 bg-image--2 fullscreen align__center--left">
            <div class="container">
            	<div class="row">
            		<div class="col-lg-12">
            			<div class="slider__content">
	            			<div class="contentbox" style="margin-left: 80px;">
	            				<h2>Buy <span>your </span></h2>
	            				<h2>favorite <span>Book </span></h2>
	            				<h2>from <span>Here </span></h2>
			                   	<a class="shopbtn" href="#">shop now</a>
	            			</div>
            			</div>
            		</div>
            	</div>
            </div>
		</div>
	</div>
</div>


<!-- NEW RELEASE PRODUCTS -->
<section class="wn__product__area brown--color pt--80  pb--30">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section__title text-center">
					<h2 class="title__be--2">New <span class="color--theme">Release Products</span></h2>
					<p>This is the recently updated release information.</p>
				</div>
			</div>
		</div>
		<div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50 owl-loaded owl-drag">
			<div class="main_sample">
				<c:forEach items="${relInfo}" var="relInfo">
					<div class="owl-item active">
						<div class="product product__style--3">
							<div class="col-lg-3 col-md-4 col-sm-6 col-12">
								<div class="product__thumb">
									<a class="first__img" href="releaseInfoDetailView.do?number=${relInfo.number}"><img src="centipede/../images/centipede/board/${relInfo.savedFileNm}" style="width:300px; height:230px;"></a>		
									<div class="hot__box">
										<span class="hot-label">NEW</span>
									</div>
								</div>
								<div class="product__content content--center">
									<h4>${relInfo.title}</a></h4>
									<ul class="prize d-flex">
										<li>${relInfo.relDt}</li>
									</ul>
									<div class="action">
										<div class="actions_inner">
											<ul class="add_to_links">
												<li><a data-toggle="modal" title="Quick View" class="quickview modal-vew detail-link" href="#"><i class="bi bi-search"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>


<!-- RECENTLY NOTICE -->
<section class = "notice brown--color pt--80  pb--30" style="clear:both;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section__title text-center">
					<h2 class="title__be--2">Recently <span class="color--theme">Notice</span></h2>
				</div>
			</div>
		</div>
	</div>
	<table class="table table-hover" style="width: 800px; margin-left:150px">
		<colgroup>
			<col width = "10%">
			<col width = "35%">
			<col width = "20%">
			<col width = "15%">
			<col width = "20%">
		</colgroup>
		<thead>
			<tr>
				<th>Number</th>
				<th>Title</th>
				<th>Date</th>
				<th>Count</th>
				<th>User</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${notice}" var="notice">
				<tr>
					<td>${notice.rownum}</td>
					<td><a href="noticeDetail.do?number=${notice.number}">${notice.title }</a></td>
					<td>${notice.rsgstDt }</td>
					<td>${notice.visitCnt }</td>
					<td>${notice.rsgstrId }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>




<!-- RECENTLY UPDATE REVIEW -->
<section class="wn__product__area brown--color pt--80  pb--30" style="clear:both;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section__title text-center">
					<h2 class="title__be--2">Recently <span class="color--theme">Updated Review</span></h2>
					<p>These are the products with the most recently entered reviews.</p>
				</div>
			</div>
		</div>
		<div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50 owl-loaded owl-drag">
			<div class="main_sample">
				<c:forEach items="${review}" var="review">
					<div class="owl-item active">
						<div class="product product__style--3">
							<div class="col-lg-3 col-md-4 col-sm-6 col-12">
								<div class="product__thumb">
									<a class="first__img" href="reviewDetailView.do?number=${review.number}"><img src="centipede/../images/centipede/board/${review.savedFileNm}" style="width:300px; height:230px;"></a>		
									<div class="hot__box">
										<span class="hot-label">NEW</span>
									</div>
								</div>
								<div class="product__content content--center">
									<h4> [${review.catCd}] </h4>
									<h4>${review.title}</h4>
									<div class="action">
										<div class="actions_inner">
											<ul class="add_to_links">
												<li><a data-toggle="modal" title="Quick View" class="quickview modal-vew detail-link" href="#"><i class="bi bi-search"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
