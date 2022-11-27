<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<style>
* {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 5px;
}

body {
	background: url(imgs/loginbg.png) no-repeat;
	background-size: cover;
}

.login-wrap {
	margin-top: 14rem;
	background-color: #EEEFF1;
	padding: 2rem 1rem;
	border-radius: 15px;
	box-shadow: 0px 5px 25px rgba(0, 0, 0, 0.6);
}

.login-form {
	text-align: center;
	border: none;
}

.text-field {
	font-size: 14px;
	padding: 10px;
	border: none;
	width: 260px;
	margin-bottom: 10px;
}

.submit-btn {
	font-size: 14px;
	border: none;
	padding: 10px;
	width: 260px;
	background-color: #1BBC9B;
	margin-bottom: 30px;
	color: white;
}

.links {
	text-align: center;
}

.links a {
	font-size: 12px;
	color: #9B9B9B;
}

/* .login-wrap { */
/* 	width: 1200px; */
/* 	height: 400px; */
/* 	position: relative; */
/* 	top: 48%; */
/* 	left: 0%; */
/* } */
.container {
	display: grid;
	grid-template-columns: 430px 330px;
	grid-template-rows: 250px 50px;
	align-items: center; . flex { /*Flexbox for containers*/ display : flex;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.waves {
	position: relative;
	width: 100%;
	height: 15vh;
	margin-bottom: -7px; /*Fix for safari gap*/
	min-height: 100px;
	max-height: 150px;
}

.content {
	position: relative;
	height: 20vh;
	text-align: center;
	background-color: white;
}

}
h1 {
  font-family: 'Lato', sans-serif;
  font-weight:300;
  letter-spacing: 2px;
  font-size:48px;
}
p {
  font-family: 'Lato', sans-serif;
  letter-spacing: 1px;
  font-size:14px;
  color: #333333;
}

.header {
  position:relative;
  text-align:center;
/*   background: linear-gradient(60deg, rgba(84,58,183,1) 0%, rgba(0,172,193,1) 100%); */
  color:white;
}
.logo {
  width:50px;
  fill:white;
  padding-right:15px;
  display:inline-block;
  vertical-align: middle;
}

.inner-header {
  height:65vh;
  width:100%;
  margin: 0;
  padding: 0;
}

.flex { /*Flexbox for containers*/
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.waves {
  position:relative;
  width: 100%;
  height:15vh;
  margin-bottom:-7px; /*Fix for safari gap*/
  min-height:100px;
  max-height:150px;
}

.content {
  position:relative;
  height:20vh;
  text-align:center;
  background-color: white;
}

/* Animation */

.parallax > use {
  animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;
}
.parallax > use:nth-child(1) {
  animation-delay: -2s;
  animation-duration: 7s;
}
.parallax > use:nth-child(2) {
  animation-delay: -3s;
  animation-duration: 10s;
}
.parallax > use:nth-child(3) {
  animation-delay: -4s;
  animation-duration: 13s;
}
.parallax > use:nth-child(4) {
  animation-delay: -5s;
  animation-duration: 20s;
}
@keyframes move-forever {

  0% {
   transform: translate3d(-90px,0,0);
  }
  100% { 
    transform: translate3d(85px,0,0);
  }
}
</style>
</head>
<body>
	<div class="login-wrap">
		<div class="login-form container ">
			<div>
				이미지 구상중 <img src="" alt="" />
			</div>
			<div>
				<form>
					<input type="text" id='employee_id' name="employee_id" class="text-field"
						placeholder="아이디"> <input type="password" name="pw" id='pw'
						class="text-field" placeholder="비밀번호"> <input
						type="button" onclick='login()' id='login' value="로그인" class="submit-btn">
				</form>
			</div>
			<div></div>
			<div class="links">
				<a href="#">비밀번호를 잊어버리셨나요?</a>
			</div>
		</div>
	</div>
<div>
	<div class="header">
		<div>
			<svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
				viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
				<defs>
				<path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
				</defs>
				<g class="parallax">
				<use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
				<use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
				<use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
				<use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
				</g>
			</svg>
			</div>
			</div>
				
			<div class="content flex">
	</div>
</div>
	<script>
		const employee_id = document.querySelector('#employee_id');
		const pw = document.querySelector('#pw');

		$('#pw').keyup(function(e) {
			if (e.keyCode == 13)
				login();
		});

		function login() {
			if (emptyCheck()) {

				$.ajax({
					url : 'checkLogin.mem',
					data : {
						employee_id : $('#employee_id').val(),
						pw : $('#pw').val()
					},
					success : function(response) {
						if (response)
							location = '<c:url value="/"/>';
						else {
							alert('사원번호나 비밀번호가 일치하지 않습니다!');
							$('#employee_id').focus();
						}

					},
					error : function(req, text) {
						alert(text + ':' + req.status);
					}
				});
			}
		}

		$('#login').click(function() {
			login();
		});

		function emptyCheck() {
			var ok = true;
			$('.chk').each(
					function() {
						if ($(this).val() == '') {
							var item = $(this).attr('placeholder') ? $(this)
									.attr('placeholder') : $(this)
									.attr('title');
							alert(item + ' 입력하세요!');
							$(this).focus();
							ok = false;
							return ok;
						}
					});
			return ok;
		}
	</script>

</body>
</html>