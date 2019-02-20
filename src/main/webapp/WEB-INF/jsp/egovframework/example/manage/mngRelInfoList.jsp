<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="title" style="text-align:center ">
<h3>Release Info manage page</h3>
</div>
<div class="manage">
	<table class="table table-hover">
		<colgroup>
			<col width = "10%">
			<col width = "30%">
			<col width = "20%">
			<col width = "15%">
			<col width = "20%">
			<col width = "5%">
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
			<c:forEach items="${mngRelInfoList}" var="mngRelInfoList">
				<tr>
					<td>${mngRelInfoList.rnum}</td>
					<td><a href="mngRelInfoUpdateView.do?number=${mngRelInfoList.number}">${mngRelInfoList.title }</a></td>
					<td>${mngRelInfoList.rsgstDt }</td>
					<td>${mngRelInfoList.visitCnt }</td>
					<td>${mngRelInfoList.rsgstrId }</td>
					<td><a href="#" onclick="manageCls.disable('${mngRelInfoList.number}','${mngRelInfoList.useYn}','${mngRelInfoList.boardUid}')">${mngRelInfoList.useYn}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div style="clear:both;">
<a href="mngRelInfoUpdateView.do"><button type="button">글 작성</button></a></div>

<!-- 검색기능 -->
<div style="clear:both; text-align:center;" class="search">
	<form autocomplete="off"name="sendForm" method="get" action="">
		<input type="text" name="searchText" value="">
		<input type="button" onclick="manageCls.search()" value="검색">
	</form>
</div>
