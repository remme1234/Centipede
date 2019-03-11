<%@page import="java.io.Console"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="egovframework.example.login.service.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="css/style.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 이미지 슬라이드  slick css-->
<link rel="stylesheet" type="text/css" href="css/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="css/slick/slick-theme.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="css/slick/slick.min.js"></script>

<script>
	var reviewList = {
			 	
		search : function(boardUid) {
			var $search = $("form[name=sendForm]");
			
			$search.attr("action","reviewSearchView.do");
			$search.submit();
		}
	}	
	
	var manageCls = {
			
		search : function(boardUid) {
			var $search = $("form[name = sendForm]");
			
			if(boardUid == 'B0001') {
				$search.attr("action","mngRelInfoList.do");
			} else if (boardUid == 'B0002') {
				$search.attr("action","mngReviewList.do");
			} else if (boardUid === 'B0003') {
				$search.attr("action","mngNoticeList.do");
			}
			
			$search.submit();
		},
		
		disable : function(number, useYn, boardUid) {
			
			if(confirm("상태를 변경하시겠습니까?")){
				if(boardUid == 'B0001'){
					location.href="mngRelInfoDisable.do?number=" + number + "&useYn=" + useYn; 
				} else if(boardUid == 'B0002') {
					location.href="mngReviewDisable.do?number=" + number + "&useYn=" + useYn;
				} else if(boardUid == 'B0003') {
					location.href="mngNoticeDisable.do?number=" + number + "&useYn=" + useYn;
				}
			}
		},
		
		del : function(boardUid) {
			
			if(confirm("삭제하시겠습니까?")) {
				var doc = document.delForm;
				
				if(boardUid == 'B0001'){
					doc.action = "mngRelInfoDelete.do"; 
				} else if(boardUid == 'B0002') {
					doc.action = "mngReviewDelete.do";
				} else if(boardUid == 'B0003') {
					doc.action = "mngNoticeDelete.do";
				}
				
				doc.submit();
			}
		}
	}
	
</script>


<title>Shoes Community Centipede</title>
