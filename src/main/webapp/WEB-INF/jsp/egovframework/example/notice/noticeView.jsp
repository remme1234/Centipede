<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

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
					<td>${noticeViewList.number }</td>
					<td>${noticeViewList.title }</td>
					<td>${noticeViewList.rsgstDt }</td>
					<td>${noticeViewList.visitCnt }</td>
					<td>${noticeViewList.rsgstrId }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
