<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	var join = function() {
		
		var $loginId	= $("input[name=loginId]"),
			$pwd		= $("input[name=pwd]"),
			$email		= $("input[name=email]"),
			$cpNo		= $("input[name=cpNo]");
			
		// email 정규식
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if($loginId.val() == null || $loginId.val() == "") {
			alert("아이디를 입력해주세요.");
			$loginId.focus();
			return
		}
		if($pwd.val() == null || $pwd.val() == "") {
			alert("패스워드를 입력해주세요.");
			$pwd.focus();
			return
		}
		if($email.val() == null || $email.val() == "") {
			alert("이메일을 입력해주세요.");
			$email.focus();
			return
		}
		
		 if( !emailReg.test( $email.val() ) ) {
	            alert("이메일을 올바른 형식으로 입력해주세요.");
	            $email.focus()
	            return;
	        }
		if($cpNo.val() == null || $cpNo.val() == "") {
			alert("연락처를 입력해주세요.");
			$cpNo.focus();
			return
		}
		
		if(confirm("회원가입하시겠습니까?")) {
			var form = $("form[name=sendForm]").serialize();
			
			$.ajax({
				
				url	 : "join.do",
				data : form,
				type : "post",
				success : function(data) {
					var jObj = JSON.parse(data);
					
					if (jObj.result === "true") {
						alert("회원가입이 완료되었습니다.");
						location.href="loginView.do";
					} else{
						alert("회원가입에 실패하였습니다.");
						location.reload();
					}
				}
			});
		}
		
	}
	
	var idCheck = function() {
		
		var idData = $("input[name=loginId]").val();
		
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
        if( !idReg.test( idData ) ) {
            alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
            $("input[name=loginId]").focus()
            return;
        }
		
		$.ajax({
			
			url	 : "idCheck.do",
			data : {"loginId" : idData},
			type : "post",
			success : function(data) {
				var jObj = JSON.parse(data);
				
				if (jObj.result === "false") {
					$(".ableId").css("display", "none");
					$(".disableId").css("display", "inline");
				} else if (jObj.result === "true"){
					$(".ableId").css("display", "inline");
					$(".disableId").css("display", "none");
				} else {
					$(".ableId").css("display", "none");
					$(".disableId").css("display", "none");
				}
			}
		});
	}

</script>

</head>
<body>
	<div class="col-lg-6 col-12">
		<div class="my__account__wrapper">
			<h3 class="account__title">Register</h3>
			<form name="sendForm" method="post">
				<div class="account__form">
					<div class="input__box">
						<label>ID <span>*</span>
							<span class="ableId" style="margin-left:10px; display:none; color:green">사용 가능한 아이디입니다</span>						
							<span class="disableId" style="margin-left:10px; display: none; color:red">사용할 수 없는 아이디입니다</span>						
						</label>
						<input type="text" name="loginId" onchange="idCheck()" style="ime-mode:disablex">
					</div>
					<div class="input__box">
						<label>Password <span>*</span></label>
						<input type="password" name="pwd">
					</div>
					<div class="input__box">
						<label>Email address <span>*</span></label>
						<input type="text" name="email">
					</div>
					<div class="input__box">
						<label>TEL<span>*</span></label>
						<input type="text" name="cpNo">
					</div>
					<div class="form__btn">
						<button onclick="join()">Register</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>