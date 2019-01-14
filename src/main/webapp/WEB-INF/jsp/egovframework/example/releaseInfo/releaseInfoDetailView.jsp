<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

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
		<tr>
      	<th>첨부파일</th>
            <td>
             <c:forEach items="${fileDetail }" var="fvo" >
                 <input type="hidden" id="NUMBER" value="${fvo.NUMBER }">
                 <a href="#this" id="file">${fvo.ORIGIN_FILE_NM }</a>
                 (${fvo.FILE_SIZE}kb)
             </c:forEach>
            </td>
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
