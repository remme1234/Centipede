<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    


<div class="category">
	<!-- 추후 말머리 카테고리를 받아서 쓰도록 만들 예정 -->
</div>

 
<table class="table table-hover">
	<colgroup>
		<col width="10%" />
		<col width="15%" />
		<col width="30%" />
		<col width="15%" />
		<col width="20%" />
		<col width="10%" />
	</colgroup>
	<thead>
		<tr>
			<td>번호</td>
			<td>말머리</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${reviewList}" var="vo">
			<tr>
				<td>${vo.count}</td>
				<td>[${vo.catCd}]</td>
				<td><a href="reviewDetailView.do?number=${vo.number}">${vo.title}</a></td>
				<td>${vo.userId}</td>
				<td>${vo.rsgstDt}</td>
				<td>${vo.visitCnt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<a href="reviewUpdateView.do"><button type="button">글 작성</button></a>
