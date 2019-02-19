<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript" src="<c:url value='/js/jquery.1.11.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='jqgrid/jqGrid-master/js/jquery.jqGrid.js'/>"></script>


<style>
.ui-jqgrid .ui-jqgrid-bdiv { overflow-y: scroll }
</style>

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
				$pastLength = $("select[name=pastLength]"),
				$newLength = $("select[name=newLength]");
			
			// 유효성검사 
			if($pastLength.val() 	=== null || $pastLength.val() === ""
				|| $newLength.val() === null || $newLength.val() === ""){
				alert("빈칸을 채워주세요")
				return
			}
			
			$form.attr("action","rplUpdate.do")
			$form.submit();
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
				type 		: "post",
				url 		: "rplPrd.do",
				data 		: JSON.stringify(form),
				contentType : "application/Json",
				success 	: function(data) {
					var jObj = JSON.parse(data);
					
					console.log(jObj)
					if(jObj.result === "SUCCESS") {
						review.displayRplPrdSelectBox(jObj.rplPrdList);
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
	
	var rplCls = {
			
		$jqGrid		: $,
		
		gridInit	: function() {
			this.$jqGrid = $("#rplArea");
		},
		
		gridInitFn	: function() {
			
			this.$jqGrid.jqGrid({
				
				datatype   : "local",
				colModel   : [
					{label : "Brand", 			name : "brndNm", 		width : 80, 	align : "center" },
					{label : "Product", 		name : "gdNm", 			width : 100, 	align : "center" },
					{label : "Owned shoe size", name : "pastLength",	width : 150, 	align : "center" },
					{label : "New shoe size", 	name : "newLength", 	width : 150, 	align : "center" },
					{label : "Size", 			name : "size", 			width : 50, 	align : "center" },
					{label : "User Id", 		name : "rsgstrId", 		width : 80, 	align : "center" },
				],
				height	   : 150,
				autowidth  : true,
				caption    : "Shoe size review table"
			})
		},
		
		goSearchFn	:function(number) {
			
			this.$jqGrid.setGridParam({
				
				// 해당게시글의 rpl을 가져오기 위해서 number 매개변수를 이용
				url		   	: "<c:url value='rplTableList.do?number=" + number + "'/>",
				datatype	: "json",
				mtype		: "GET",
				
				loadCompelete	: function(data) {
					cosole.log("data : ", data);
				}
			}).trigger("reloadGrid");
		}
	}
	
	$(function() {
		rplCls.gridInit();
		rplCls.gridInitFn();
	})
	
	var goSearch = function(number) {
		
		$("#rplArea").setGridParam({
			
			// 해당게시글의 rpl을 가져오기 위해서 number 매개변수를 이용
			url		   	: "<c:url value='rplTableList.do?number=" + number + "'/>",
			datatype	: "json",
			mtype		: "GET",
			
			loadCompelete	: function(data) {
				cosole.log("data : ", data);
			}
		}).trigger("reloadGrid");
	}
</script>

<table class="table table-hover">
	<colgroup>
		<col width="50px" />
		<col width="100px" />
		
	</colgroup>
	<thead>
		<tr>
			<td>${reviewDetail.title}</td>
			<td>${reviewDetail.rsgstDt}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">${reviewDetail.rsgstrId}</td>
		</tr>
		<tr>
			<td>
				<!-- 파일 경로 이상으로 추후 보완 예정 -->
				<div id="imageArea">
					<c:forEach items="${fileInfo }" var="fileInfo" >
						 <c:if test="${fileInfo.fileNo ne null}">
							<img src="centipede/../images/centipede/board/${fileInfo.savedFileNm}"  width="200px" height="200px" >
			              </c:if>
		             </c:forEach>
				</div>
				<p>${reviewDetail.contents}</p>
			</td>
			<td>
				<button type="button" onclick="rplCls.goSearchFn(${reviewDetail.number})">검색</button>
				<!-- jqGrid를 통해서 테이블 생성 -->
				<table id="rplArea"></table>
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
<form autocomplete="off" name="rplSave" method="POST" action="" >
	<input type="hidden" name="number" value="${reviewDetail.number}">
	<div class="rpl">
		<select class="rpl_cat" name="catCd">
		<option>Brand</option>
			<c:forEach items="${rplCatList}" var="rplCatList">
			<option value="<c:out value='${rplCatList.catCd }'/>">
				<c:out value='${rplCatList.brndNm }'/>
			</option>
			</c:forEach>
		</select>
		<select class="rpl_prd" name="gdCd" >
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
		<input type="button" value="입력" onclick="review.rplSave()">
	</div>
</form>


<form action="" name="sendForm" method="POST">
	<input type="hidden" name="number" value="${reviewDetail.number}" />
</form>

<td>&nbsp;</td>

<div align="right">
	<a href="reviewView.do"><button type="button" >목록으로</button></a>
	<button type="button" onclick="review.del()">삭제하기</button>
	<a href="reviewUpdateView.do?number=${reviewDetail.number}"><button type="button">수정하기</button></a>
	<td>&nbsp;</td>
</div>
