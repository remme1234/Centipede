<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
 
 

<style>
.releases-list .draw-title {
	font-weight: 700;
    margin-top: 20px;
    font-size: 15px;
}

.releases-list li{
	width: 33.3333%;
	padding: 2%;
	float: left;
	text-align: center;
	font-size: 15px;
	font-weight: 700;
}

li { list-style: none }

.title h3 {
	font-size: 36px;
    color: #1a1a1a;
    font-weight: bold;
    line-height: 36px;
    text-transform: uppercase;
}
</style>
 
<script>
	var releaseInfoList = {
			
		search : function() {
			var $search = $("form[name=sendForm]");
			
			$search.attr("action","releaseInfoView.do");
			$search.submit();
		}
	}
</script>	
 
<div class="title" style="text-align:center ">
<h3>RELEASE INFO</h3>
</div>
<ul class="releases-list">
	
	<c:forEach items="${releaseInfoList}" var="vo">
	<li>
		<a href="releaseInfoDetailView.do?number=${vo.number}">
			<img src="centipede/../images/centipede/board/${vo.savedFileNm}" width="400px" height="200px">
		</a>
		<h3 class="draw-title">${vo.title}</h3>
		<div>${vo.relDt}</div>	
	</li>
	</c:forEach>
</ul>

<!-- 페이징 시작 -->
<div id="paging_div">
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
