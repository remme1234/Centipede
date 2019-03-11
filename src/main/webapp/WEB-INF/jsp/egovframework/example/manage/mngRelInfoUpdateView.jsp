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
			$file 		= $("input[name=file]"),
			$relDt 		= $("input[name=relDt]");
		
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
		if($file.val() === null || $file.val() === ""){
			alert("사진을 넣어주세요")
			$file.focus()
			return
		}
		if($relDt.val() === null || $relDt.val() === ""){
			alert("발매일을 지정해 주세요")
			$file.focus()
			return
		}
		
		$form.attr("action","mngRelInfoUpdate.do")
		$form.submit()
		alert("입력한 글이 정상적으로 등록되었습니다.")	
	}
	
	// 달력출력 메서드 
		$(function() {
			$( "#datepicker1" ).datepicker({
				dateFormat: 'yy-mm-dd',
			    changeMonth: true, 
			    changeYear: true,
			    nextText: '다음 달',
			    prevText: '이전 달' 
			});
		});
    
</script>

<form autocomplete="off" name="saveForm" method="POST" action="" enctype="multipart/form-data">
	<input type="hidden" name="boardUid" value="B0001" />
	<input type="hidden" name="number" value="${mngRelInfoUpdateView.number}" />
	<input type="hidden" name="rsgstrId" value="${sessionScope.userId}" />
	<table class="table">
		<thead>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${mngRelInfoUpdateView.title}" style= width:300px></td>
			</tr>
		</thead>
		<tbody>
			<tr>	
				<th>내용</th>
				<td><textarea rows="13" cols="50" name="contents" style="resize: vertical;">${mngRelInfoUpdateView.contents}</textarea></td>
			</tr>
			<tr>
				<th>발매일</th>
				
				<td><input type="text" id="datepicker1" name="relDt"></td>
			</tr>
		</tbody>
	</table>
	<div class="filebox"> 
		<label for="ex_file">Upload</label> 
		<input type="file" name="file" id="ex_file"> 
	</div>
</form>
	
<form action="" name="delForm" method="POST">
	<input type="hidden" name="number" value="${mngRelInfoUpdateView.number}" />
</form>

<div class="btn__Bundle">
	<button class="btn__design" type="button" onclick="save()">저장</button>
	<c:if test="${mngRelInfoUpdateView ne null}">
		<button class="btn__design" type="button" onclick="manageCls.del('${mngRelInfoUpdateView.boardUid}')">삭제</button>
	</c:if>
	<a href="mngRelInfoList.do"><button class="btn__design" type="button">취소</button></a>
</div>
	
