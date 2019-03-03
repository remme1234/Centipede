<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="title" style="text-align:center ">
	<h3>Release Info manage page</h3>
</div>
<div class="manage" style="margin-top: 20px;">
	<table class="table table-hover">
		<colgroup>
			<col width = "10%">
			<col width = "45%">
			<col width = "15%">
			<col width = "10%">
			<col width = "10%">
			<col width = "10%">
		</colgroup>
		<thead>
			<tr>
				<th>Num</th>
				<th>Title</th>
				<th>Date</th>
				<th>User</th>
				<th>Visit Cnt</th>
				<th>Use yn</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mngRelInfoList}" var="mngRelInfoList">
				<tr>
					<td>${mngRelInfoList.rnum}</td>
					<td><a href="mngRelInfoUpdateView.do?number=${mngRelInfoList.number}">${mngRelInfoList.title }</a></td>
					<td>${mngRelInfoList.rsgstDt }</td>
					<td>${mngRelInfoList.rsgstrId }</td>
					<td>${mngRelInfoList.visitCnt }</td>
					<td><a href="#" onclick="manageCls.disable('${mngRelInfoList.number}','${mngRelInfoList.useYn}','${mngRelInfoList.boardUid}')">${mngRelInfoList.useYn}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div style="clear:both;">
<a href="mngRelInfoUpdateView.do"><button type="button">글 작성</button></a></div>

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
	<form autocomplete="off"name="sendForm" method="get" action="">
		<input type="text" name="searchText" value="">
		<input type="button" onclick="manageCls.search('B0001')" value="검색">
	</form>
</div>
