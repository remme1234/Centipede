<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  



<style>
.review-cat-nm {
	font-weight: 700;
    font-size: 20px;
    margin-bottom: 10px; 
}
</style>
	
<section class="wn__product__area brown--color pt--80  pb--30">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section__title text-center">
					<h2 class="title__be--2">please <span class="color--theme">compare</span> your shoe <span class="color--theme"> size</span></h2>
					<p>This board was made to compare relative shoe sizes.</p>
					<p>Please write a review of the products you own.</p>
					<p>Someday, you can get information about the size of the shoes you want here.</p>
				</div>
			</div>
		</div>
		<div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50 owl-loaded owl-drag">
			<c:forEach items="${catCdList}" var="catCdList" >
				<div class="main_sample">
					<ul class="review-list">
						<div class="review-cat-nm">
							<a href ="reviewSearchView.do?catCd=${catCdList.catCd}"><c:out value="${catCdList.brndNm}"/>》</a>
						</div>
						
						<c:forEach items="${reviewList}" var="vo">
							<c:if test="${catCdList.brndNm eq vo.catCd}" >
								<div class="owl-item active">
									<div class="product product__style--3">
										<div class="col-lg-3 col-md-4 col-sm-6 col-12">
											<div class="product__thumb">
												<a class="first__img" href="reviewDetailView.do?number=${vo.number}"><img src="centipede/../images/centipede/board/${vo.savedFileNm}" style="width:300px; height:230px;"></a>
												
												<!-- 현재날짜와 비교하여 new 표시 -->
												<fmt:parseDate var="rsgst_date" value="${vo.rsgstDt}" pattern="yyyy-MM-dd" />
												<fmt:formatDate var="saved_date" value="${rsgst_date}" pattern="yyyy-MM-dd"/>
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<fmt:formatDate var="now_date" value="${now}" pattern="yyyy-MM-dd" /> 	
												
												<c:if test="${saved_date == now_date }">
													<div class="hot__box">
														<span class="hot-label">NEW</span>
													</div>
												</c:if>									
											</div>
											<div class="product__content content--center">
												<h4> [${vo.catCd}] </h4>
												<h4>${vo.title}</h4>
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
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<!-- 검색기능 -->
<div style="clear:both; text-align:center;" class="search">
	<form autocomplete="off" name="sendForm" method="get" action="">
		<select name="catCd">
			<option value="">Brand</option>
			<c:forEach items="${catCdList}" var="catCdList">
				<option value="<c:out value ="${catCdList.catCd}"/>"><c:out value ="${catCdList.brndNm}"/></option>
			</c:forEach>
		</select>
		<input type="text" name="searchText" value="">
		<input type="button" onclick="reviewList.search()" value="검색">
	</form>
</div>

