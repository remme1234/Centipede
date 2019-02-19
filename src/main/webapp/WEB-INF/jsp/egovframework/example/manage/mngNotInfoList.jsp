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
			<c:forEach items="${mngNotInfoList}" var="mngNotInfoList">
				<tr>
					<td>${mngNotInfoList.number }</td>
					<td>${mngNotInfoList.title }</td>
					<td>${mngNotInfoList.rsgstDt }</td>
					<td>${mngNotInfoList.visitCnt }</td>
					<td>${mngNotInfoList.rsgstrId }</td>
					<td>${mngNotInfoList.useYn }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>