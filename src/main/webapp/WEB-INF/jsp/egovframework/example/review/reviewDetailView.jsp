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
		<col width="10%"/>
		<col width="50%"/>
		<col width="10%"/>
		<col width="30%"/>
	</colgroup>
	<thead>
		<tr>
			<th>TITLE</th>
			<td>${reviewDetail.title}</td>
			<th>DATE</th>
			<td>${reviewDetail.rsgstDt}</td>
		</tr>
		<tr>
			<th>USER</th>
			<td colspan="3">${reviewDetail.rsgstrId}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="4">
				<div id="imageArea">
					<c:forEach items="${fileInfo }" var="fileInfo" >
						 <c:if test="${fileInfo.fileNo ne null}">
							<img src="centipede/../images/centipede/board/${fileInfo.savedFileNm}" >
			              </c:if>
		             </c:forEach>
				</div>
					<p>${reviewDetail.contents}</p>
			</td>
		</tr>
	</tbody>
</table>

<div style="width:100%; height:200px; overflow:auto">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<th>Brand</th>
				<th>Product</th>
				<th>Owned shoe size</th>
				<th>New shoe size</th>
				<th>Size</th>
				<th>User Id</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${rplDataList}" var="rplDataList">
				<tr>
					<td>${rplDataList.brndNm}</td>
					<td>${rplDataList.gdNm}</td>
					<td>${rplDataList.pastLength}</td>
					<td>${rplDataList.newLength}</td>
					<td>${rplDataList.size}</td>
					<td>${rplDataList.rsgstrId}</td>
				</tr>
			</c:forEach>			
		</tbody>
	</table>
</div>

<!-- 댓글로 사이즈 평가 -->
<form autocomplete="off" name="rplSave" method="POST" action="" >
	<input type="hidden" name="number" value="${reviewDetail.number}" />
	<input type="hidden" name="rsgstrId" value="${sessionScope.userId}" />
	<div class="rpl input">
		<select class="rpl_cat" name="catCd">
		<option>Brand</option>
			<c:forEach items="${rplCatList}" var="rplCatList">
			<option value="${rplCatList.catCd}">
				${rplCatList.brndNm }
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
			<option value="s">Small</option>
			<option value="m">Fitness</option>
			<option value="l">Large</option>
		</select>
		<input class="btn__design" type="button" value="input" onclick="review.rplSave()">
	</div>
</form>


<form action="" name="sendForm" method="POST">
	<input type="hidden" name="number" value="${reviewDetail.number}" />
</form>


<div align="right" class="return">
	<a href="reviewView.do"><button class="btn__design" type="button" >목록으로</button></a>
</div>
