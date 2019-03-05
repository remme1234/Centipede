<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

 
<script>
	var releaseInfoList = {
			
		search : function() {
			var $search = $("form[name=sendForm]");
			
			$search.attr("action","releaseInfoView.do");
			$search.submit();
		}
	}
</script>
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
				<c:forEach items="${releaseInfoList}" var="vo">
					<div class="owl-item active">
						<div class="product product__style--3">
							<div class="col-lg-3 col-md-4 col-sm-6 col-12">
								<div class="product__thumb">
									<a class="first__img" href="releaseInfoDetailView.do?number=${vo.number}"><img src="centipede/../images/centipede/board/${vo.savedFileNm}" style="width:300px; height:230px;"></a>
									
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
									<h4>${vo.title}</h4>
									<ul class="prize d-flex">
										<li>${vo.relDt}</li>
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

<!-- 페이징 시작 -->
<div id="paging_div" style="clear:both;">
   <ul class="paging_align wn__pagination">
      <c:if test='${paging.getFirstPageNoOnPageList() > 1}'>
         <li class="first-page"><a href="?pageIndex=1&view_iframe=1&mod=list">처음</a></li>
         <li class="prev-page"><a href="?pageIndex=${paging.getFirstPageNoOnPageList()-paging.pageSize}&view_iframe=1&mod=list">≪</a></li>
      </c:if>

      <c:forEach begin="${paging.getFirstPageNoOnPageList()}" end="${paging.getLastPageNoOnPageList()}" step="1" varStatus="status">
         <c:set var="curClass"></c:set>
         <c:if test='${status.index == paging.currentPageNo}'>
            <c:set var="curClass">class="active"</c:set>
         </c:if>      
         <li ${curClass}><a href="?pageIndex=${status.index}&view_iframe=1&mod=list">${status.index}</a></li>
      </c:forEach>

      <c:if test='${paging.getLastPageNoOnPageList() < paging.getTotalPageCount()}'>
         <li class="next-page"><a href="?pageIndex=${paging.getLastPageNoOnPageList()+1}&view_iframe=1&mod=list">≫</a></li>
         <li class="last-page"><a href="?pageIndex=${paging.getTotalPageCount()}&view_iframe=1&mod=list">마지막</a></li>
      </c:if>
   </ul>
</div>
<!-- 페이징 끝 -->

<!-- 검색기능 -->
<div style="clear:both; text-align:center; margin-top: 15px;" class="search">
	<form autocomplete="off" name="sendForm" method="get" action="">
		<input type="text" name="searchText" value="">
		<input type="button" onclick="releaseInfoList.search()" value="검색">
	</form>
</div>
