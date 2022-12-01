<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	/*     background: url("imgs/bg/side-bg.jpg") no-repeat; */
	/* 	background: #0061f2 no-repeat ; */
	
}

.headerwrap {
	position: fixed;
	width: 1920px;
	height: 75px;
	top: 0%;
	left: 0%;
	background: #ffffff;
	display: inline-flex;
	align-items: baseline;
	box-shadow: 0px 0px 20px 0 rgba(0, 0, 0, 0.1);
}

.mypage {
	position: relative;
	top: 8%;
	left: 70%;
}

.modify {
	position: relative;
	top: 8%;
	left: 72%;
}

.modify a {
	color: #000;
}

.logout-icon {
	color: #000;
	position: relative;
	top: 14%;
	left: 77%;
}

.logout-icon a {
	color: #000;
}

.icon {
	font-size: 1.425rem;
}
.burger{
    position: fixed;
    left: 13.3%;
    top: 1%;
}
</style>
</head>
<body>
	<div class="">
		<div class="headerwrap">
		<div class="burger">
			<ion-icon name="reorder-three-outline" class="nav__toggle"
				id="nav-toggle"></ion-icon>
		</div>
			<div class="mypage" style="margin-top: 20px;">반갑습니다
				${loginInfo.name}${loginInfo.position_name} 님</div>
			<div class="modify">
				<a
					onclick="location='modify.mypage?employee_id='+${loginInfo.employee_id }"
					class="">개인정보수정</a>
			</div>
			<div class="logout-icon">
				<a href="/berp" class=""><ion-icon name="log-out-outline"
						class="icon"></ion-icon></a>
			</div>
		</div>
	</div>
</body>
</html>