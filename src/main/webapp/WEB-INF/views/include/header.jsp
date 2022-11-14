<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
	
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
	padding-top: 10px;
	font-size: 16px;
	font-weight: bold;
}
#nav-top > li > a:hover{
	color: #6ca6fa;
}
#nav-top > li {
	margin-left: 60px;
}
#nav-sign{
	align-items: center;
	margin-bottom: 0.5rem;
	margin-left: 60px;
}

#nav-sign > button:nth-child(2){
	margin-left: 10px;
}

#sideIndex{
	cursor: pointer;
	margin-left: 5px;
	vertical-align: top;
}

#nav-menu{
	display: none;
	background: #91aed7a8;
	font-size: 16px;
	position: absolute;
	top: 50px;
	left: 100px;
	width: 850px;
	height: 260px;
	margin-left: 65px;
}





</style>

<header>
	<!-- 		로고 -->
		<div id="nav">
			<a class="logo" href='<c:url value="/" />'>
				<img class="me-4" alt="logo" src="imgs/icons/icon-48x48.png">
			</a>
			<label id='nav-mouse'>
			<ul id="nav-top">
				<li><a href="#">공지사항</a></li>
				<li><a href="#">회사정보</a></li>
				<li><a href="#">채용안내</a></li>
				<li><a href="#">고객센터</a></li>
 				<li><a href="#">고객센터</a></li>
 				<li><a href="#">고객센터</a></li>
			</ul>
			
			<ul id='nav-menu'>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">회사정보</a></li>
				<li><a href="#">채용안내</a></li>
				<li><a href="#">고객센터</a></li>
 				<li><a href="#">고객센터</a></li>
 				<li><a href="#">고객센터</a></li>
			</ul>
			</label>
			
				
				
			<div id='nav-sign'>
				<c:if test="${empty loginInfo}">
				<button class="frontBtn-fill" onclick='location="login.mem"'>로그인</button>
				<button class="frontBtn-empty" onclick='location="join.mem"'>회원가입</button>
				</c:if>
				
				<c:if test="${not empty loginInfo}">
				<span>${loginInfo.name} 님</span>
				<button class="frontBtn-empty" onclick='location="logout.mem"'>로그아웃</button>
				</c:if>
				<c:if test='${loginInfo.admin eq "Y"}'>
				<li><span id='sideIndex' class="material-symbols-outlined" onclick='location="sideIndex"'>
				login
				</span></li>
				</c:if>
			</div>
		</div>
</header>
<script>
$('#nav-mouse').hover(function(){
	$('#nav-menu').show();
});
$('#nav-mouse').mouseleave(function(){
	$('#nav-menu').hide();
});
</script>

