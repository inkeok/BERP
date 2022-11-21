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
li a{
	color : #ffffff;
	font-size: 14px;
}
body {
    position: relative;
    margin: 0;
    padding: 2rem 0 0 3.75rem;
/*     font-family: var(--body-font); */
/*     font-size: var(--normal-font-size); */
    transition: .5s;
}

/*  #backFromSide{
	position: fixed;
	bottom: 3%;
	left: 2%;
	color: #717ca2; */

li:before, .side-menu:before {
	font-family: "Material Icons" !important;
	font-feature-settings: "liga";
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

*, :before, :after {
	box-sizing: border-box;
	transition: 0.3s;
}

ul {
	background: #12192c;
	padding: 1.5em;
	margin: 0;
	margin-top: 1em;
	border-radius: 5px;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.6);
	position: absolute;
	top: 100%;
	left: 0;
	font: 400 18px Roboto;
	white-space: nowrap;
	cursor: default;
	animation-name: side-right;
    animation-duration: 500ms;
    animation-direction: normal;
	z-index: 101;

}

@keyframes side-right {
  from {
    opacity: 0;
    transform: translateX(-30px);
  }
  to {
    opacity: 1;
  }
}

ul.hidden {
	margin-top: 0.7em;
	display: none;
	opacity: 0;
}

ul:before {
	content: "";
	width: 0.75em;
	height: 0.75em;
	background: inherit;
	position: absolute;
	left: -0.375em;
	left: calc(56px/ 2 - .375em);
	transform: rotate(45deg);
}

li {
	list-style: none;
	padding: 0.5em;
	margin: 0;
	position: relative;
	cursor: pointer;
}

li:before {
	position: absolute;
	top: calc(5% + 8px);
	left: 8px;
}

.nav-img img {
	width: 40px;
	height: 40px;
}
#fix{
	background-color: black;
	width: 20%;
	height: 20%;;
	position: fixed;
	bottom: 30px;
	left: 30px;
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
							<ul class="hidden list2">
								<li onclick='location="lockerList.ap?employee_id=${loginInfo.employee_id}"'>보관함</li>
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
					 <a href="#" class="nav__link"> <ion-icon
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
