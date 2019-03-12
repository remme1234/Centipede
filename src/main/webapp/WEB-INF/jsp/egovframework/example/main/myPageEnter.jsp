<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	var pwdChk = function() {
		
		var form = $("form[name=pwdChkForm]").serialize();
		
		$.ajax({
			
			url	 : "pwdChk.do",
			data : form,
			type : "post",
			success : function(data) {
				var jObj = JSON.parse(data);
				
				if (jObj.result === "true") {
					location.href="myPage.do?loginId=${sessionScope.userId}";
				} else{
					alert("비밀번호가 다릅니다.");
					location.reload();
				}
			}
		});
	}

</script>


<section class="my_account_area pt--80 pb--55 bg--white">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-12">
				<div class="my__account__wrapper">
					<h3 class="account__title">Check password</h3>
					<form name="pwdChkForm" action="" method="post">
						<input type="hidden" name="loginId" value="${sessionScope.userId }">
						<div class="account__form">
							<div class="input__box">
								<label>비밀번호 확인</label>
								<label>please enter your password<span>*</span></label>
								<input name="pwd" type="password">
								<label style='text-align: right;'><span>※본인 확인을 위해 비밀번호를 입력해 주세요 </span></label>
							</div>
							<div class="form__btn">
								<button type="button" onclick="pwdChk()">Check</button>
								<button><a href="main.do">go back</a></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>