<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<script>
	var review = {
		
		del : function() {
			if(confirm("리뷰 게시글을 삭제하시겠습니까?")) {
				var doc = document.sendForm;
				
				doc.action = "reviewDelete.do";
				doc.submit();
			}
		},
		
		reply : function() {
		}
	}
	
	$(function() {
		$(".rpl_cat").change(function() {
			var thisParam = $(this).val();
			var	form  = {"catCd" : thisParam}; 
			
			$(".rpl_prd").children().remove();
			
			$.ajax({
				type : "post",
				url : "rplPrd.do",
				data : JSON.stringify(form),
				contentType : "application/Json",
				success : function(data) {
					
				}
			})
		})
	})
</script>


<table class="table table-hover">
	<thead>
		<tr>
			<td>${reviewDetail.title}</td>
			<td>${reviewDetail.rsgstDt}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">${reviewDetail.userId}</td>
		</tr>
		<tr>
			<td colspan="2">
			
			<!-- 파일 경로 이상으로 추후 보완 예정 -->
			<div id="imageArea">
				<c:forEach items="${fileInfo }" var="fileInfo" >
					 <c:if test="${fileInfo.fileNo ne null}">
						<img src="centipede/../images/centipede/board/${fileInfo.savedFileNm}"  width="200px" height="200px" >
		              </c:if>
	             </c:forEach>
			</div>
				<p>${reviewDetail.catCd}</p>
				<p>${reviewDetail.contents}</p>
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


<!-- 댓글로 사이즈 평가 -->
<h4>사이즈 후기</h4>
<div class="rpl">
	<select class="rpl_cat">
		<c:forEach items="${rplCatList}" var="rplCatList">
		<option value="<c:out value='${rplCatList.catCd }'/>">
			<c:out value='${rplCatList.brndNm }'/>
		</option>
		</c:forEach>
	</select>
	<select class="rpl_prd">
		<option value="">없음</option>
	</select>
	<select class="rpl_size">
		<option value="1">작음</option>
	</select>
</div>


<button type="button" class="AddRplBtn" onclick="review.reply()"> 추가  </button>
<!-- <div class="rpl">
	<div class="rpl_cat">
		<select>
			<option value="01">나이키</option>
		</select>
	</div>
	<div class="rpl_prd">
		<select>
			<option value="a00001">허라취</option>
		</select>
	</div>
	<div class="rpl_size">
		<select>
			<option value="1">작음</option>
		</select>
	</div>
</div> -->

<form action="" name="sendForm" method="POST">
	<input type="hidden" name="number" value="${reviewDetail.number}" />
</form>

<td>&nbsp;</td>

<a href="reviewView.do"><button type="button" >목록으로</button></a>
<button type="button" onclick="review.del()">삭제하기</button>
<a href="reviewUpdateView.do?number=${reviewDetail.number}"><button type="button">수정하기</button></a>
<td>&nbsp;</td>