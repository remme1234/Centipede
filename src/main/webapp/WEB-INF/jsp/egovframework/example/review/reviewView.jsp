<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    



<style>
.review-list .draw-title {
	font-weight: 700;
    margin-top: 20px;
    font-size: 15px;
}

.review-list li{
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
	var reviewList = {
			
		search : function() {
			var $search = $("form[name=sendForm]");
			
			$search.attr("action","reviewView.do");
			$search.submit();
		}
	}
</script>

<div class="title" style="text-align:center ">
<h3>REVIEW BOARD</h3>
</div>

<%-- <div class="category" >
	<c:forEach items="${catCdList}" var="catCdList">
		<button type="button" onclick="reviewList.sortBrand(${catCdList.catCd})">
			<c:out value ="${catCdList.catCdNm}"/>
		</button>
	</c:forEach>
</div> --%>
 
<ul class="review-list">
	<c:forEach items="${reviewList}" var="vo">
	<li>
		<a href="reviewDetailView.do?number=${vo.number}">
			<img src="centipede/../images/centipede/board/${vo.savedFileNm}" width="400px" height="200px">
		</a>
		<div>[${vo.catCd}]</div>
		<h3 class="draw-title">${vo.title}</h3>
	</li>
	</c:forEach>
</ul>

<div style="clear:both; text-align:center;" class="search">
	<form name="sendForm" method="get" action="">
		<select name="catCd">
			<option value="">Brand</option>
			<c:forEach items="${catCdList}" var="catCdList">
				<option value="<c:out value ="${catCdList.catCd}"/>"><c:out value ="${catCdList.catCdNm}"/></option>
			</c:forEach>
		</select>
		<input type="text" name="searchText" value="">
		<input type="button" onclick="reviewList.search()" value="검색">
	</form>
</div>

<div style="clear:both">
	<a href="reviewUpdateView.do"><button type="button">글 작성</button></a>
</div>
