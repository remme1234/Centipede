<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    

<script>
	var save = function() {
		var $form 		= $("form[name=saveForm]"),  
			$title 		= $("input[name=title]"),
			$contents 	= $("textarea[name=contents]"),
			$file 		= $("input[name=file]");
		
		if($title.val() === null || $title.val() === "") {
			alert ("제목을 입력해주세요");
			$title.focus();
			return
		}
		if($contents.val() === null || $contents.val() === "") {
			alert ("내용을 입력해주세요")
			$contents.focus();
			return
		}
		
		$form.attr("action","mngNoticeUpdate.do")
		$form.submit()
		alert("입력한 글이 정상적으로 등록되었습니다.")	
	}
</script>

<form autocomplete="off" name="saveForm" method="POST" action="" enctype="multipart/form-data">
	<input type="hidden" name="boardUid" value="B0003" />
	<input type="hidden" name="fileNo" value="${mngNoticeUpdateView.fileNo}" />
	<input type="hidden" name="number" value="${mngNoticeUpdateView.number}" />
	<table class="table">
		<thead>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${mngNoticeUpdateView.title}" style= width:300px></td>
			</tr>
		</thead>
		<tbody>
			<tr>	
				<th>내용</th>
				<td><textarea rows="13" cols="50" name="contents" style="resize: vertical;">${mngNoticeUpdateView.contents}</textarea></td>
			</tr>
		</tbody>
	</table>
	<div class="filebox"> 
		<label for="ex_file">Upload</label> 
		<input type="file" name="file" id="ex_file"> 
	</div>
</form>
	
<form action="" name="delForm" method="POST">
	<input type="hidden" name="number" value="${mngNoticeUpdateView.number}" />
</form>

<div class="btn__Bundle">
	<button class="btn__design" type="button" onclick="save()">저장</button>
	<c:if test="${mngReviewUpdateView ne null}">
		<button class="btn__design" type="button" onclick="manageCls.del('${mngNoticeUpdateView.boardUid}')">삭제</button>
	</c:if>
	<a href="mngNoticeList.do"><button class="btn__design" type="button">취소</button></a>
</div>	

