<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>

<link href="css/app.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/@alphardex/aqua.css/dist/aqua.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
	
<style>
#nav{
	display: flex;
	justify-content: space-between;
	margin-top: 30px;
}
#nav-top, #nav-sign, #nav-top > li{
	display: flex;
}
#nav-top{
	align-items: flex-end;
	font-size: 16px;
	font-weight: bold;
	
}
#nav-top > li > a:hover{
	color: #6ca6fa;
}
#nav-top > li {
	margin-left: 20px;
}
#nav-sign{
	align-items: center;
}
#nav-sign > button:nth-child(1){
	margin-left: 40px;
}
#nav-sign > button:nth-child(2){
	margin-left: 10px;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  background-color:  var(--bs-body-bg);
  color: #3b7ddd;
  text-align: center;
  min-width: 160px;
  z-index: 1;
  margin-left: 10px;
  position: absolute;
  left: -2%;
  top: 100%;
}

.dropdown-content a {
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}
.dropdown:hover .dropdown-content {display: block;}

#sideIndex{
	cursor: pointer;
}

</style>

<header>
	<!-- 		로고 -->
		<div id="nav">
			<div class="logo">
				<a href="index"><img class="me-4" alt="logo"
					src="imgs/icons/icon-48x48.png" href='<c:url value="/" />'></a>
			</div>
			<ul id="nav-top" class='dropdown'>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">회사정보</a></li>
				<li><a href="#">채용안내</a></li>
				<li><a href="#">고객센터</a></li>
 				<li><a href="#">고객센터</a></li>
			</ul>
				
				
			<div id='nav-sign'>
				<c:if test="${empty loginInfo}">
				<button class="btn-fill" onclick='location="login.mem"'>로그인</button>
				<button class="btn-empty" onclick='location="join.mem"'>회원가입</button>
				</c:if>
				
				<c:if test="${not empty loginInfo}">
				<span>${loginInfo.name} 님</span>
				<button class="btn-empty" onclick='location="logout.mem"'>로그아웃</button>
				</c:if>
				<c:if test='${loginInfo.admin eq "Y"}'>
				<li><span id='sideIndex' class="material-symbols-outlined" onclick='location="sideIndex"'>
				login
				</span></li>
				</c:if>
			</div>
		</div>
</header>

