<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	$(function() {
		if('${msg}' != null && '${msg}' != "") alert('${msg}');
	});
	var loginFn = function() {
		
		var $form 		= $("form[name=accountForm]"),  
			$loginId 	= $("input[name=loginId]"),
			$pwd 		= $("textarea[name=pwd]");
		
		if($loginId.val() === null || $loginId.val() === "") {
			alert ("아이디를 입력해주세요");
			$loginId.focus();
			return
		}
		if($pwd.val() === null || $pwd.val() === "") {
			alert ("패스워드를 입력해주세요")
			$pwd.focus();
			return
		}
		
		$form.attr("action","login.do")
		$form.submit()
 		}
	
</script>


<section class="my_account_area pt--80 pb--55 bg--white">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-12">
				<div class="my__account__wrapper">
					<h3 class="account__title">Login</h3>
					<form name="accountForm" action="" method="post">
						<div class="account__form">
							<div class="input__box">
								<label>User Id<span>*</span></label>
								<input name="loginId" type="text">
							</div>
							<div class="input__box">
								<label>Password<span>*</span></label>
								<input name="pwd" type="password">
							</div>
							<div class="form__btn">
								<button onclick="loginFn()">Login</button>
							</div>
							<a class="forget_pass" href="#">Lost your password?</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>