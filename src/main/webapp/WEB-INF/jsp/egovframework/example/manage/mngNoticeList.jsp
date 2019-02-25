<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="title" style="text-align:center ">
<h3>Notice manage page</h3>
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
				<th>Check Visit Count</th>
				<th>User</th>
				<th>Use_yn</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mngNoticeList}" var="mngNoticeList">
				<tr>
					<td>${mngNoticeList.number }</td>
					<td><a href="mngNoticeUpdateView.do?number=${mngNoticeList.number}">${mngNoticeList.title }</a></td>
					<td>${mngNoticeList.rsgstDt }</td>
					<td>${mngNoticeList.visitCnt }</td>
					<td>${mngNoticeList.rsgstrId }</td>
					<td><a href="#" onclick="manageCls.disable('${mngNoticeList.number}','${mngNoticeList.useYn}','${mngNoticeList.boardUid}')">${mngNoticeList.useYn }</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div style="clear:both">
	<a href="mngNoticeUpdateView.do"><button type="button">글 작성</button></a>
</div>

<!-- 검색기능 -->
<div style="clear:both; text-align:center;" class="search">
	<form autocomplete="off"name="sendForm" method="get" action="">
		<input type="text" name="searchText" value="">
		<input type="button" onclick="manageCls.search('B0003')" value="검색">
	</form>
</div>
