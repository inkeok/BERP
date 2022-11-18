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
.nav-img img{
	width : 40px;
	height : 40px;
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
<div onclick='location="lockerList.ap?employee_id=${loginInfo.employee_id}"'>보관함</div>
				<div onclick='location="submitList.ap?employee_id=${loginInfo.employee_id}"'>상신함</div>
				<div onclick='location="receiveList.ap?employee_id=${loginInfo.employee_id}"'>수신함</div>
				<div onclick='location="approvalList.ap?employee_id=${loginInfo.employee_id}"'>결재함</div>
<div id='fix'><a href='<c:url value="/" />'><img src='imgs/hanul.logo.png'></a></div>
</body>
</html>
