<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<script type="text/javascript" src="<c:url value='/js/jquery.1.11.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='jqgrid/jqGrid-master/js/jquery.jqGrid.js'/>"></script>
												


<div class="title" style="text-align:center ">
<h3>NOTICE</h3>
</div>

<div class="notice">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Number</th>
				<th>Title</th>
				<th>Contents</th>
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
					<td>${noticeViewList.contents }</td>
					<td>${noticeViewList.rsgstDt }</td>
					<td>${noticeViewList.visitCnt }</td>
					<td>${noticeViewList.rsgstrId }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
