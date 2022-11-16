<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!-- CSS only -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css?<%=new java.util.Date()%>" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Maven+Pro&family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

<style>
h1, h2, h3, h4, h5, h6, span, p {
	font-family: 'Noto Sans KR' !important;
}

.sec-text1 {
	position: absolute;
	top: 28%;
	left: 20%;
	animation: text1 1.5s;
}

.sec-text2 {
	color: #ffffff;
	position: absolute;
	top: 34%;
	left: 20%;
	animation: text2 3s;
}

.ask {
	position: absolute;
	top: 58%;
	left: 20%;
	color: #ffffff;
	animation: ask 3s;
}

.service {
	background: url(imgs/service-bg.jpg) repeat-x;
	width: 1903px;;
	height: 1000px;
}

span.fi {
	display: none;
}

span.fi2 {
	display: none;
}

button.fi {
	display: none;
}

img.sec-image {
	display: none;
}




.sec-image {
	position: absolute;
	top: 30%;
	left: 60%;
	animation: img 3s;
}

/* index keyframes */

@keyframes text1 { 	
0%{
	left: 0%;
}
100%{
	left : 20%;
}
}

@keyframes text2 { 	
0%{
	left: 0%;
}
100%{
	left : 20%;
}
}

@keyframes ask { 	
0%{
	left: 0%;
}
100%{
	left : 20%;
}
}

@keyframes img { 	
0%{
	left: 70%;
}
100%{
	left : 60%;
}
}
</style>
</head>
<body>
	<div style="height: 810px;">
		<section class="sec-body">
			<span class="sec-text1 fi" style="font-size: 27px; color: #E0DCDC;">​
				모바일앱, 웹 어플리케이션제작</span><br /> <span class="sec-text2 fi2"
				style="font-size: 44px">기획부터 디자인, 개발까지<br /> 영문 네트워크에서<br />
				앱/웹 개발을 연구합니다
			</span>
			<button class="btn btn-dark btn-lg ask fi"
				onclick='location="login.mem"'>문의하기</button>
			<img class="sec-image" src="imgs/logo.png" alt="bodyimage" />
		</section>
	</div>
	<div class="center mb-5">
		<span style="font-size: 44px;">설명만 해주시면<br />현실을 만들수 있습니다
		</span>
	</div>
	<section class="service">
		<div style="display: flex;">
			<span style="font-size: 44px; margin-top: 145px; margin-left: 26rem;">서비스
				영역</span>
		</div>
	</section>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$('span.fi').fadeIn(3000);
		});

		$(document).ready(function() {
			$('span.fi2').fadeIn(3000);
		});

		$(document).ready(function() {
			$('button.fi').fadeIn(3000);
		});

		$(document).ready(function() {
			$('img.sec-image').fadeIn(3000);
		});
	</script>
</body>
</html>