<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<script>
	var releseInfo = {
		
		del : function() {
			if(confirm("삭제하시겠습니까?")) {
				var doc = document.sendForm;
				
				doc.action = "releaseInfoDelete.do";
				doc.submit();
			}
		} 
	}
</script>

<table class="table table-hover">
	<colgroup>
		<col width="10%"/>
		<col width="50%"/>
		<col width="10%"/>
		<col width="30%"/>
	</colgroup>
	<thead>
		<tr>
			<th>TITLE</th>
			<td>${releaseInfoDetail.title}</td>
			<th>DATE</th>
			<td>${releaseInfoDetail.rsgstDt}</td>
		</tr>
		<tr>
			<th>USER</th>
			<td colspan="3">${releaseInfoDetail.rsgstrId}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="4">
			
			<!-- 파일 경로 이상으로 추후 보완 예정 -->
			<div id="imageArea">
				<c:forEach items="${fileInfo }" var="fileInfo" >
					 <c:if test="${fileInfo.fileNo ne null}">
						<img src="centipede/../images/centipede/board/${fileInfo.savedFileNm}"  width="200px" height="200px" >
		              </c:if>
	             </c:forEach>
			</div>
				<p>${releaseInfoDetail.contents}</p>
			</td>
		</tr>
		<%-- <tr>
	        <c:forEach items="${fileInfo }" var="fileInfo" >
	      	<th>첨부파일</th>
            <td>
              <c:if test="${fileInfo.fileNo ne null}">
              	<input type="hidden" id="number" value="${fileInfo.fileNo }">
              	<a href="downloadFile.do?fileNo=${fileInfo.fileNo }">${fileInfo.originFileNm}(${fileInfo.fileSize})kb</a>
              </c:if>
            </td>
	        </c:forEach>
        </tr> --%>
	</tbody>
</table>

<form action="" name="sendForm" method="POST">
	<input type="hidden" name="number" value="${releaseInfoDetail.number}" />
</form>

<td>&nbsp;</td>
<a href="releaseInfoView.do"><button type="button" >목록으로</button></a>
<td>&nbsp;</td>
