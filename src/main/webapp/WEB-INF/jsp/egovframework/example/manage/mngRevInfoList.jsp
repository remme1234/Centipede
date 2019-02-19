<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="title" style="text-align:center ">
<h3>Review manange page</h3>
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
				<th>Brand</th>
				<th>Title</th>
				<th>Date</th>
				<th>Check Visit Count</th>
				<th>User</th>
				<th>Use_yn</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${mngRevInfoList}" var="mngRevInfoList">
				<tr>
					<td>${mngRevInfoList.number }</td>
					<td>${mngRevInfoList.catCd }</td>
					<td>${mngRevInfoList.title }</td>
					<td>${mngRevInfoList.rsgstDt }</td>
					<td>${mngRevInfoList.visitCnt }</td>
					<td>${mngRevInfoList.rsgstrId }</td>
					<td>${mngRevInfoList.useYn }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>