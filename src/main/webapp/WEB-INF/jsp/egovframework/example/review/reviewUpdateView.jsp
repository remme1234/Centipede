<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	var save = function() {
		var $form = $("form[name=saveForm]"),  
			$title = $("input[name=title]"),
			$contents = $("textarea[name=contents]");
			$file = $("input[name=file]");
		
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
		
		
		$form.attr("action","releaseInfoUpdate.do")
		$form.submit()
		alert("입력한 글이 정상적으로 등록되었습니다.")	
	}
	
	
</script>

<form name="saveForm" method="POST" action="" enctype="multipart/form-data">
	<input type="hidden" name="boardUid" value="B0001" />
	<input type="hidden" name="number" value="${reviewDetail.number}" />
	<table class="table">
		<thead>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${reviewDetail.title}" style= width:300px></td>
			</tr>
			<tr>
				<th>말머리</th>
				<td>
					<select name="catCd">
						<option value="01">나이키</option>
						<option value="02">아디다스</option>
						<option value="03">컨버스</option>
					</select>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>	
				<th>내용</th>
				<td><textarea rows="13" cols="50" name="contents" style="resize: vertical;">${reviewDetail.contents}</textarea></td>
			</tr>
		</tbody>
	</table>
	<input type="file" name="file"> 
	
	
	<button type="button" onclick="save()">저장</button>
	
	<!-- 취소시 번호설정 -->
	<c:if test="${releaseInfoDetail.number ne null}">
		<a href ="releaseInfoDetailView.do?number=${reviewDetail.number}"><button type="button">취소</button> </a>
	</c:if>	
	<c:if test="${releaseInfoDetail.number eq null}">
		<a href="releaseInfoView.do"><button type="button">취소</button></a>
	</c:if>
</form>

