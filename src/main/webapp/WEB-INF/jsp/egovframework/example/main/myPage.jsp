<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	var modify = function() {
		
		var	$emailChange	= $("input[name=emailChange]"),
			$cpNoChange		= $("input[name=cpNoChange]");
			
		// 정규식
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i,
			cpNoReg	 = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		
		if ($emailChange.val() == "${info.email}" && $cpNoChange.val() == "${info.cpNo}"){
			
			alert ("수정된 내용이 없습니다.")
			return;
		
		// email 변경내용 체크
		} else if ($emailChange.val() != null && $emailChange.val() != ""){
			
			if( !emailReg.test( $emailChange.val())) {
				alert("이메일을 올바른 형식으로 입력해주세요.");
				$emailChange.focus()
				return;	
			
			// cpNo 변경내용 체크
			} else if ($cpNoChange.val() != null && $cpNoChange.val() != "") {
				
				if( !cpNoReg.test( $cpNoChange.val())) {
					alert("휴대폰번호 11자리를 '-' 를 빼고 입력해주세요.");
					$cpNoChange.focus()
					return;	
				}
			}
		}
		
		if(confirm("수정하시겠습니까?")) {
			
			var form = $("form[name=modifyForm]").serialize();
			
			$.ajax({
				
				url	 : "modify.do",
				data : form,
				type : "post",
				success : function(data) {
					var jObj = JSON.parse(data);
					
					if (jObj.result === "true") {
						alert("개인정보 수정을 완료했습니다.");
						location.href="main.do";
					} else{
						alert("개인정보 수정에 실패했습니다.");
						location.reload();
					}
				}
			});
		}
	}
	
	var changePwd = function() {
		
		var $pwdChange 		= $("input[name=pwdChange]"),
			$pwdChangeChk 	= $("input[name=pwdChangeChk]");
		
		if ($pwdChange.val() !== $pwdChangeChk.val()) {
			
			alert("변경할 비밀번호가 일치하지 않습니다.")
			$pwdChange.focus();
			return;
		} else if ($pwdChange.val() == "${info.pwd}") {
			alert("기존 비밀번호와 동일하게 변경할 수 없습니다.")
			$pwdChange.focus();
			return;
		}
		
		if(confirm("비밀변호를 변경하시겠습니까?")) {
			
			var form = $("form[name=changePwdForm]").serialize();
			
			$.ajax({
				
				url	 : "changePwd.do",
				data : form,
				type : "post",
				success : function(data) {
					var jObj = JSON.parse(data);
					
					if (jObj.result === "true") {
						alert("비밀번호를 변경했습니다.");
						location.href="main.do";
					} else{
						alert("비밀번호 변경에 실패했습니다.");
						location.reload();
					}
				}
			});
		}
	}
			
		
	
</script>

<section class="my_account_area pt--80 pb--55 bg--white">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-12">
				<div class="my__account__wrapper">
					<h3 class="account__title">My page</h3>
					<div class="account__form">
						<form name="modifyForm" action="" method="post">
							<input type="hidden" name="loginId" value="${info.loginId}" >
							<div class="input__box">
								<label>User Id</label>
								<h5>${info.loginId}</h5>	
							</div>
							<div class="input__box">
								<label>Email</label>
								<input name="emailChange" type="text" value="${info.email}">
							</div>
							<div class="input__box">
								<label>Tel</label>
								<input name="cpNoChange" type="text" value="${info.cpNo}">
							</div>
							<div class="form__btn" style="text-align: right">
								<button type="button" onclick="modify()">Save</button>
							</div>
						</form>
						</br>
						<form name="changePwdForm" action="" method="post">
							<input type="hidden" name="loginId" value="${info.loginId}" >	
							<div class="input__box">
								<label><span>※ If you want to change your password, please fill out the following items.</span></label>
								<label>Change password</label>
								<input name="pwdChange" type="password">
							</div>							
							<div class="input__box">
								<label>Check change password<span>*</span></label>
								<input name="pwdChangeChk" type="password">
							</div>
							<div class="form__btn" style="text-align: right">
								<button type="button" onclick="changePwd()">Change PWD</button>
							</div>
							<div class="form__btn">
								<button><a href="main.do">go back</a></button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>