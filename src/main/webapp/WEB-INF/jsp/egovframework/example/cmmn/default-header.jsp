<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	var reviewList = {
			
		search : function() {
			var $search = $("form[name=sendForm]");
			
			$search.attr("action","reviewSearchView.do");
			$search.submit();
		},
	
		more : function(brndNm) {
			var $searchFrm = $("form[name=sendForm]");
			
			$searchFrm.attr("action","reviewSearchView.do?catCd=" + "brndNm")
			$searchFrm.submit();
		}		
	}
</script>
