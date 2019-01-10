<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/js/materialize.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/css/materialize.min.css">
<title>Insert title here</title>

<script>
	$(document).ready(function(){
		$('.slider').slider();
	});
</script>

<style type="text/css">
.slider .indicators .indicator-item {
  background-color: #666666;
  border: 3px solid #ffffff;
  -webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
}
.slider .indicators .indicator-item.active {
  background-color: #ffffff;
}
.slider {
  width: 900px;
  margin: 100px auto;
}
.slider .indicators {
  bottom: 60px;
  z-index: 100;
  /* text-align: left; */
}
</style>

</head>
<body>

	<div class="slider">
    <ul class="slides">
		<li>
        	<img src="images/centipede/main_1.jpg"> <!-- random image -->
        	<div class="caption center-align">
				<h3>This is our big Tagline!</h3>
				<h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
			</div>
		</li>
		<li>
        	<img src="images/centipede/main_2.jpg"> <!-- random image -->
        	<div class="caption center-align">
				<h3>This is our big Tagline!</h3>
				<h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
			</div>
		</li>
    </ul>
  </div>

</body>
</html>