<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table class="table table-hover">
	<thead>
		<tr>
			<td>${releaseInfoDetail.title}</td>
			<td>${releaseInfoDetail.rsgstDt}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">${releaseInfoDetail.userId}</td>
		</tr>
		<tr>
			<td colspan="2">${releaseInfoDetail.contents}</td>
		</tr>
	</tbody>
</table>

<form action="" name="sendForm" method="POST">
	<input type="hidden" name="number" value="${releaseInfoDetail.number}" />
</form>

<td>&nbsp;</td>
<a href="releaseInfoView.do"><button type="button" >목록으로</button></a>
<button type="button" onclick="menu.del()">삭제하기</button>
<a href="releaseInfoUpdateView.do?number=${releaseInfoDetail.number}"><button type="button">수정하기</button></a>
<td>&nbsp;</td>
