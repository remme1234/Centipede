<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
 
 

<style>
.releases-list .draw-title {
	font-weight: 700;
    margin-top: 20px;
    font-size: 15px;
}

.releases-list li{
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
	var releaseInfoList = {
			
		search : function() {
			var $search = $("form[name=sendForm]");
			
			$search.attr("action","releaseInfoView.do");
			$search.submit();
		}
	}
</script>
 
<div class="title" style="text-align:center ">
<h3>RELEASE INFO</h3>
</div>
<ul class="releases-list">
	
	<c:forEach items="${releaseInfoList}" var="vo">
	<li>
		<a href="releaseInfoDetailView.do?number=${vo.number}">
			<img src="centipede/../images/centipede/board/${vo.savedFileNm}" width="400px" height="200px">
		</a>
		<h3 class="draw-title">${vo.title}</h3>
		<div>${vo.relDt}</div>	
	</li>
	</c:forEach>
</ul>
<
<!-- 검색기능 -->
<div style="clear:both; text-align:center;" class="search">
	<form autocomplete="off"name="sendForm" method="get" action="">
		<input type="text" name="searchText" value="">
		<input type="button" onclick="releaseInfoList.search()" value="검색">
	</form>
</div>

<div style="clear:both;">
<a href="releaseInfoUpdateView.do"><button type="button">글 작성</button></a></div>
