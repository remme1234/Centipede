<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script>
	$(function() {
		$("#menubar-menus>li").mouseenter(function(event) {
			$(this).find("div").parent().css("background", "#FFF");
			$(this).find("div").parent().children("a").css("color", "#000");
			$(this).find("div").slideDown("fast");
		}).mouseleave(function() {
			$(this).find("div:visible").slideUp(50, function() {
				// #menubar-menus li:hover 처리를 하지 않을 경우 아래 라인 활성,
				$(this).parent().css("background", "#FFF");
				$(this).parent().children("a").css("color", "#030303");
			});
		});
	});
</script>
<style>
/* body {
	background: #424242; margin: 50px 0;
} */
#menubar {
	width: 100%; height: 40px; background: #FFF;
}
#menubar-menus {
	width: 900px; margin: 0 auto; list-style: none; padding: 0; text-align: center; font-size: 0; display: table;
}
#menubar-menus > .menu {
	width: 200px; height: 40px; display: table-cell; vertical-align: middle; text-align: center; font-size: 20px;
}
#menubar-menus > #mainLogo {
	width: 200px; height: 40px; display: table-cell; vertical-align: middle; text-align: center; font-size: 18px;
}
#menubar-menus > li > a {
	 display: table-cell; vertical-align: middle; width: 200px; height: 40px; text-decoration: none; color: #030303;
	/* 서브 메뉴 영역이 가로 방향으로 100% 보이는 것을 원치 않을 때 아래 라인을 활성 */
	/*position: relative;*/
}
/* #menubar-menus li를 position: relative 처리를 하는 경우에 아래 hover 상태 처리를 주석 처리 할 것. */
/*#menubar-menus li:hover {
	background: #FFF;
}*/
#menubar-menus > li > div {
	position: absolute; background: #FFF; color: #000; left: 0; width: 100%; top: auto; display: none; /*opacity: 0.5;*/
	padding: 50px 0; z-index: 10;
}

</style>
<div id="menubar">
	<ul id="menubar-menus">
		<li id="mainLogo" class="menu">
			<a href="main.do">
				<img src="images/centipede/main/logo_sample.jpg" style="width:100px; height:80px;"/>
			</a>
		</li>
		<li class="menu">
			<a href="#">Introduce</a>
			<div><p>Submenu 1</p></div>		
		</li>
		<li class="menu">
			<a href="#">Community</a>
			<div>
				<p><a href="releaseInfoView.do">Release Information</a></p>	
				<p><a href="reviewView.do">Sneaker Review</a></p>
			</div>	
		</li>
		<li class="menu">
			<a href="noticeView.do">Notice</a>
		</li>
		<li class="menu">
			<a href="#">My page</a>
			<div><p>Submenu 4</p></div>		
		</li>
		<li class="menu">
			<a href="#">Managing page</a>
			<div>
				<p><a href="mngRelInfoList.do">Release Information</a></p>	
				<p><a href="mngReviewView.do">Sneaker Review</a></p>
				<p><a href="mngNotice.do">Notice</a></p>
			</div>		
		</li>
		
	</ul>
</div>