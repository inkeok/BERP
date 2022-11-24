<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="css/common.css?<%=new java.util.Date()%>" rel="stylesheet">
<link href="css/side.css?<%=new java.util.Date()%>" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>

</style>

<body id="body-pd">
	<div class="l-navbar" id="navbar">
		<nav class="nav">
			<div>
				<div class="nav__brand">
					<ion-icon name="reorder-three-outline" class="nav__toggle"
						id="nav-toggle"></ion-icon>
				</div>
				<div class="sidebar-logo">
					<div class="nav-img">
						<img src="imgs/icons/icon.png" alt="logo" />
					</div>
					<div>
						<a href="/berp" class="nav__logo">YM NetWork</a>
					</div>
				</div>
				<div class="nav__list">
					<div class="side-menu">
						<a href="#" class="nav__link active"> <ion-icon
								name="home-outline" class="nav__icon"></ion-icon> <span
							class="nav_name">회사정보</span>
						</a>
<!-- 						<div class="side-content"> -->
<!-- 							<ul class="hidden list"> -->
<!-- 								<li><a href="#">aaaaaa</a></li> -->
<!-- 								<li><a href="#">ssssss</a></li> -->
<!-- 								<li><a href="#">dddddd</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
					</div>
					<div class="side-menu side-menu2">
						<a href="#" class="nav__link"> <ion-icon
								name="settings-outline" class="nav__icon"></ion-icon> <span
							class="nav_name">업무관리</span>
						</a>
						<div class="side-content">
							<ul class="hidden list2 sidebar">
								<li onclick='location="lockerList.ap?employee_id=${loginInfo.employee_id}"'>보관함</a></li>
								<li onclick='location="submitList.ap?employee_id=${loginInfo.employee_id}"'>상신함</li>
								<li onclick='location="receiveList.ap?employee_id=${loginInfo.employee_id}"'>수신함</li>
								<li onclick='location="approvalList.ap?employee_id=${loginInfo.employee_id}"'>결재함</li>
							</ul>
						</div>
					</div>

					<a href="#" class="nav__link"> <ion-icon
							name="chatbubbles-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">채용관리</span>
					</a>
					 <a href="list.hr" class="nav__link"> <ion-icon
							name="person-circle-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">인사관리</span>
					</a>
					<!-- 					<div href="#" class="nav__link collapse"> -->
					<!-- 						<ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon> -->
					<!-- 						<span class="nav_name">코드관리</span> -->

					<!-- 						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon> -->
					<!-- 					</div> -->

					<a href="workList" class="nav__link"> <ion-icon name="alarm-outline"
							class="nav__icon"></ion-icon> <span class="nav_name">근태관리</span>
					</a>
					 <a href="#" class="nav__link"> <ion-icon
							name="settings-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">코드관리</span>
					</a>
					 <a href="#" class="nav__link"> <ion-icon name="server-outline"
							class="nav__icon"></ion-icon> <span class="nav_name">급여관리</span>
					</a>

				</div>
				<a href="/berp" class="nav__link"> <ion-icon
						name="log-out-outline" class="nav__icon"></ion-icon> <span
					class="nav_name">Log out</span>
				</a>
			</div>
		</nav>
	</div>
          
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="js/main.js"></script>

</body>
</html>
