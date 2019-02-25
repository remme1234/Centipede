<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<script>
	var noticeViewList = {
			
		search : function() {
			var $search = $("form[name=sendForm]");
			
			$search.attr("action","mngNoticeList.do");
			$search.submit();
		}
	}
</script>	

<div class="title" style="text-align:center ">
<h3>NOTICE</h3>
</div>
<div class="notice">
	<table class="table table-hover">
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
			<c:forEach items="${noticeViewList}" var="noticeViewList">
				<tr>
					<td>${noticeViewList.rownum }</td>
					<td><a href="noticeDetail.do?number=${noticeViewList.number}">${noticeViewList.title }</a></td>
					<td>${noticeViewList.rsgstDt }</td>
					<td>${noticeViewList.visitCnt }</td>
					<td>${noticeViewList.rsgstrId }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- 페이징 시작 -->
<div id="paging_div">
   <ul class="paging_align">
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
<div style="clear:both; text-align:center;" class="search">
	<form autocomplete="off"name="sendForm" method="get" action="">
		<input type="text" name="searchText" value="">
		<input type="button" onclick="noticeViewList.search()" value="검색">
	</form>
</div>