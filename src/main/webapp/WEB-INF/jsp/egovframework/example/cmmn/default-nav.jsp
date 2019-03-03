<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

$(function() {
	var settingTrigger = $('.setting__active'),
		settingContainer = $('.setting__block');
	
	settingTrigger.on('click', function (e) {
    	e.preventDefault();
    	settingContainer.toggleClass('is-visible');
	});
	
	settingTrigger.on('click', function (e) {
		e.preventDefault();
    	settingContainer.toggleClass('');
	});
});

</script>

<header id="wn__header" class="oth-page header__area header__absolute sticky__header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-7 col-lg-2">
				<div class="logo" style="text-align: center;">
					<a href="main.do">
						<img src="images/centipede/main/logo.jpg" alt="logo images">
					</a>
				</div>
			</div>
			<div class="col-lg-8 d-none d-lg-block" style="margin-left: 50px;">
				<nav class="mainmenu__nav">
					<ul class="meninmenu d-flex justify-content-start">
						<li class="drop with--one--item"><a href="#;">Introduce</a></li>
						<li class="drop"><a href="#">Community</a>
							<div class="megamenu mega03">
								<ul class="item item03">
									<li class="title">Release</li>
									<li><a href="releaseInfoView.do">Release Information</a></li>
								</ul>
								<ul class="item item03">
									<li class="title">Review</li>
									<li><a href="reviewView.do">Sneaker Review</a></li>
								</ul>
								<ul class="item item03">
									<li class="title">Sample</li>
								</ul>
							</div>
						</li>
						<li class="drop with--one--item"><a href="noticeView.do">Notice</a></li>
						<li class="drop with--one--item"><a href="#;">My page</a></li>
						<li class="drop"><a href="#">Managing page</a>
							<div class="megamenu dropdown">
								<ul class="item item01">
									<li><a href="mngRelInfoList.do">Release Information</a></li>
									<li><a href="mngReviewList.do">Sneaker Review</a></li>
									<li><a href="mngNoticeList.do">Notice</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
			<div class="col-md-6 col-sm-6 col-6 col-lg-1" style="margin-left: 30px;">
				<ul class="header__sidebar__right d-flex justify-content-end align-items-center">
					<li class="shop_search"><a class="search__active" href="#"></a></li>
					<li class="setting__bar__icon" style="margin-left: 16px;">
						<a class="setting__active" href="#"></a>
						<div class="searchbar__content setting__block">
							<div class="content-inner">
								<c:choose>
									<c:when test='${empty sessionScope}'>
										<strong class="label switcher-label">
											<span><a href="loginView.do">Sign In</a></span>
										</strong>
										<br/>
										<strong class="label switcher-label">
											<span><a href="joinView.do">Join</a></span>
										</strong>
									</c:when>
									<c:otherwise>
										<strong class="label switcher-label">
											<span><a href="#">Mypage</a></span>
										</strong>
										<br/>
										<strong class="label switcher-label">
											<span><a href="logout.do">Logout</a></span>
										</strong>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</header>