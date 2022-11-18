<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="css/common.css?<%=new java.util.Date()%>" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
#sideFix {
	background: linear-gradient(#7cb3f4, #fff);
	width: 200px;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	font-weight: bold;
	font-style: italic;
	color: #717ca2;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

#backFromSide {
	position: fixed;
	bottom: 3%;
	left: 2%;
	color: #717ca2;
}

.dropdownMenu>div {
	display: none;
}

.dropdownSelect {
	margin-bottom: 25px;
	font-size: 18px;
	cursor: pointer;
}

.dropdownMenu>div {
	cursor: pointer;
	margin-left: 10px;
	font-size: 16px;
	color: #e8e7e3;
}

#sideNav {
	margin-top: 35px !important;
	margin-left: 20px !important;
}

.nav-img img {
	width: 40px;
	height: 40px;
}
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
						<a href="#" class="nav__link active">
						 	<ion-icon name="home-outline" class="nav__icon"></ion-icon>
							  <span class="nav_name">회사정보</span>
						</a>
						<div class="side-content">
							<ul class="hidden list">
								<li><a href="#">aaaaaa</a></li>
								<li><a href="#">ssssss</a></li>
								<li><a href="#">dddddd</a></li>
							</ul>
						</div>
					</div>
			
					<a href="#" class="nav__link"> <ion-icon
							name="chatbubbles-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">채용관리</span>
					</a> <a href="#" class="nav__link"> <ion-icon
							name="person-circle-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">인사관리</span>
					</a>
					<div href="#" class="nav__link collapse">
						<ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">코드관리</span>

						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
					</div>

					<a href="#" class="nav__link"> <ion-icon name="alarm-outline"
							class="nav__icon"></ion-icon> <span class="nav_name">근태관리</span>
					</a> <a href="#" class="nav__link"> <ion-icon
							name="settings-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">코드관리</span>
					</a> <a href="#" class="nav__link"> <ion-icon name="server-outline"
							class="nav__icon"></ion-icon> <span class="nav_name">급여관리</span>
					</a> <a href="#" class="nav__link"> <ion-icon
							name="settings-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">업무관리</span>
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
