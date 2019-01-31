<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<script>
	var review = {
			
		// 리뷰게시글 삭제 버튼 
		del : function() {
			if(confirm("리뷰 게시글을 삭제하시겠습니까?")) {
				var doc = document.sendForm;
				
				doc.action = "reviewDelete.do";
				doc.submit();
			}
		},
		
		// 하위 셀렉트박스 option value를 붙여주는 기능 
		displayRplPrdSelectBox : function(rplPrdList) {
			if(rplPrdList.length > 0) {
				
				$(".rpl_prd").append("<option value=''>Product</option>");
				
				$.each(rplPrdList, function(i,item) {
					var optionPrd = "<option value=" + item.gdCd + ">" +  item.gdNm + "</option>"
					$(".rpl_prd").append(optionPrd);
				})
			} else { 
				$(".rpl_prd").append("<option value=''>없음</option>");
			}
		},
		
		// 리플 저장 메서드
		rplSave : function() {
			var $form = $("form[name=rplSave]"),
				$pastLength = $("input[name=pastLength]"),
				$newLength = $("input[name=newLength]");
				
			if($pastLength.val() 	=== null || $pastLength.val() === ""
				|| $newLength.val() === null || $newLength.val() === ""){
				alert("빈칸을 채워주세요")
				return
			}
			
			$form.attr("action","rplUpdate.do")
			$form.submit()
			alert("입력한 사이즈 후기가 정상적으로 등록되었습니다.")
		}
		
	}
	
	// 하위 셀랙트박스를 호출하는 ajax  
	$(function() {
		$(".rpl_cat").change(function() {
			var thisParam = $(this).val();
			var	form  	  = {"catCd" : thisParam}; 
			
			$(".rpl_prd").children().remove();
			
			$.ajax({
				type : "post",
				url : "rplPrd.do",
				data : JSON.stringify(form),
				contentType : "application/Json",
				success : function(data) {
					var jObj = JSON.parse(data);
					
					console.log(jObj)
					if(jObj.result === "SUCCESS") {
						review.displayRplPrdSelectBox	(jObj.rplPrdList);
					}
				}
			})
		})
		
		for(var i=0; i<21; i++) {
			var length = 200+i*5;
			
			$(".rpl_past_length").append("<option value='"+length+"'>"+length+"</option>"); 
			$(".rpl_new_length").append("<option value='"+length+"'>"+length+"</option>"); 
		}
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
<h4>사이즈 후기 // 기존 신발과 새로산 신발을 비교한 평가</h4>
<form autocomplete="off" name="rplSave" method="POST" action="" >
	<div class="rpl">
		<select class="rpl_cat" name="catCd">
		<option>Brand</option>
			<c:forEach items="${rplCatList}" var="rplCatList">
			<option value="<c:out value='${rplCatList.catCd }'/>">
				<c:out value='${rplCatList.brndNm }'/>
			</option>
			</c:forEach>
		</select>
		<select class="rpl_prd" name="gdNm" >
			<option value=''>Product</option>
		</select>
		<select class="rpl_past_length" name="pastLength"> <option value="">Owned shoe size</option></select>
		<select class="rpl_new_length" name="newLength"> <option value="">New shoe size</option> </select>
		<select class="rpl_size" name="size">
			<option value="">Size</option>
			<option value="s">작음</option>
			<option value="m">적당함</option>
			<option value="l">큼</option>
		</select>
	</div>
</form>
<button type="button" onclick="review.rplSave()">입력</button>

<!-- <button type="button" class="AddRplBtn" onclick="review.reply()"> 추가  </button> -->

<form action="" name="sendForm" method="POST">
	<input type="hidden" name="number" value="${reviewDetail.number}" />
</form>

<td>&nbsp;</td>

<a href="reviewView.do"><button type="button" >목록으로</button></a>
<button type="button" onclick="review.del()">삭제하기</button>
<a href="reviewUpdateView.do?number=${reviewDetail.number}"><button type="button">수정하기</button></a>
<td>&nbsp;</td>