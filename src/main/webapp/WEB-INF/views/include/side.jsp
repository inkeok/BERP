<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="css/app.css" rel="stylesheet">
<link href="css/common.css?<%=new java.util.Date()%>" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>
body{
	width: 100%;
}
#sideBackground{
	background-color: #222e3c;
	width: 100%;
	height: 100%;
}
#sideFix{
	position: fixed;
	top: 0;
	left: 0;
}
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
#backFromSide{
	position: fixed;
	bottom: 3%;
	left: 2%;
	color: #fff;
}
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content a{
	display: none;  
  background-color: #222e3c;
  min-width: 160px;
  z-index: 1;
  margin-left: 10px;
}

.dropdown-content a {
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}
.dropdown:hover .dropdown-content{
  display: block;
  animation-name:slide_down;
  animation-duration:3s;
}


</style>
<div id='sideBackground'>
	<div id='sideFix'>
		<div class="sidebar-content js-simplebar" data-simplebar="init">
			<div class="simplebar-wrapper" style="margin: 0px;">
				<div class="simplebar-height-auto-observer-wrapper">
					<div class="simplebar-height-auto-observer"></div>
				</div>
				<div class="simplebar-mask">
					<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
						<div class="simplebar-content-wrapper" tabindex="0" role="region"
							aria-label="scrollable content"
							style="height: 100%; overflow: hidden scroll;">
							<div class="simplebar-content" style="padding: 0px;">
							<div class="logo mt-10">
								<img class="me-4" alt="logo" src="imgs/icons/icon-48x48.png">
						  		<p class="align-middle">B-ERP</p>
							</div>
		
								<ul class="sidebar-nav">
							<li class="sidebar-header"></li>
							
							<li class="sidebar-item active mt-10 dropdown"><a class="sidebar-link"
								href="index"> <i class="align-middle"
									data-feather="sliders"></i> <span class="align-middle">회사정보</span>
							</a>		<div class='dropdown-content'><a>1</a><a>1</a></div></li>

							<li class="sidebar-item mt-10"><a class="sidebar-link"
								href="recruit"> <i class="align-middle"
									data-feather="user"></i> <span class="align-middle">채용관리</span>
							</a></li>
		
							<li class="sidebar-item mt-10"><a class="sidebar-link"
								href="personnel"> <i class="align-middle"
									data-feather="log-in"></i> <span class="align-middle">인사관리</span>
							</a></li>
		
							<li class="sidebar-item mt-10"><a class="sidebar-link"
								href="attendance-management"> <i class="align-middle"
									data-feather="user-plus"></i> <span class="align-middle">근태관리</span>
							</a></li>
		
							<li class="sidebar-item mt-10"><a class="sidebar-link"
								href="pages-blank.html"> <i class="align-middle"
									data-feather="book"></i> <span class="align-middle">코드관리</span>
							</a></li>
							
							<li class="sidebar-item mt-10"><a class="sidebar-link"
								href="pages-blank.html"> <i class="align-middle"
									data-feather="book"></i> <span class="align-middle">급여관리</span>
							</a></li>
							
							
							
							<li class="sidebar-item mt-10 dropdown"><a class="sidebar-link">
							 <i class="align-middle" data-feather="book"></i>
							  <span class="align-middle">업무관리</span></a>
									<div class='dropdown-content'>
										<a href='saveList.ap'>보관함</a>
										<a href='submitList.ap?employee_id=1'>상신함</a>
										<a href='approvalList.ap'>결재함</a>
									</div></li>
							
							<a id='backFromSide' class="material-symbols-outlined" href='<c:url value="/" />'>undo</a>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>

