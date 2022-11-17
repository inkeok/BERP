<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="css/common.css?<%=new java.util.Date()%>" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>

#sideFix{
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
	color: #717ca2;
}

.dropdownMenu > div{
	display: none;
}

.dropdownSelect{
	margin-bottom: 25px;
	font-size: 18px;
	cursor: pointer;
}

.dropdownMenu > div{
	cursor: pointer;
	margin-left: 10px;
	font-size: 16px;
	color: #e8e7e3;
}
#sideNav{
	margin-top: 35px !important;
	margin-left: 20px !important;
}

</style>
<div id='sideFix'>
	<a class="logo mt-15 ml-7" href='<c:url value="/" />'>
		<img src="imgs/icons/icon-48x48.png" >
	</a>
	
  	<div id='sideNav'>
  		<div class="dropdownSelect">회사정보
		<div class='dropdownMenu'>
		</div>
    </div>

    <div class="dropdownSelect">채용관리
		<div class='dropdownMenu'>
		</div>
    </div>

    <div class="dropdownSelect">인사관리
		<div class='dropdownMenu'>
		</div>
    </div>

    <div class="dropdownSelect">근태관리
		<div class='dropdownMenu'>
		</div>
    </div>

    <div class="dropdownSelect">코드관리
		<div class='dropdownMenu'>
		</div>
    </div>

    <div class="dropdownSelect">급여관리
		<div class='dropdownMenu'>
		</div>
    </div>

    <div class="dropdownSelect">업무관리
		
			<div onclick='location="lockerList.ap?email=${loginInfo.email}"'>보관함</div>
			<div onclick='location="submitList.ap?email=${loginInfo.email}"'>상신함</div>
			<div onclick='location="receiveList.ap?email=${loginInfo.email}"'>수신함</div>
			<div onclick='location="approvalList.ap?email=${loginInfo.email}"'>결재함</div>
		
    </div>
    
    <div class="dropdownSelect">마이페이지
		<div class='dropdownMenu'>
		</div>
    </div>
  	</div>
	<a id='backFromSide' class="material-symbols-outlined" href='<c:url value="/" />'>undo</a>
</div>
<script>


</script>
