<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table {
	margin-top : 5px;
/* 	border-top-left-radius: 20px; */
/*     border-top-right-radius: 20px; */
	padding-bottom : 2rem;
	border-radius : 15px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}
td a{
	color : #323232;
}
th, td {
  padding: 15px;
  background-color: rgba(255, 255, 255, 0.2);
  color: #000000;
}

th {
  text-align: center;
}
th {
  background : #12192c;
  color : #fff;
}
tbody tr:hover, td:hover {
  background-color: rgba(255, 255, 255, 0.5);
}
tbody td {
  position: relative;
}
tbody td:hover:before {
 
  background-color: rgba(255, 255, 255, 0.2);
  z-index: -1;
}

.new-btn{
  padding: 1em 1.8em;
  font-size: 14px;
  font-weight: 400;
  font-family:'Noto Sans KR', sans-serif;
  border-radius: 4px;
  cursor: pointer;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  border: none;
  color: #ffffff;
  margin-bottom: 10px;
	background : #12192c;
	position: relative;
	left: 4%;
}

.centerTable{
	position: fixed;
	left: 50%;
	top: 40%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<h2 class="center hrlist">나의 급여</h2>
	
			<table class="centerTable">
				<colgroup>
					<col width="200px">
					<col width="500px">
				</colgroup>
				<tr>
					<th>사번</th>
					<td>${mySalary.employee_id}</td>
				</tr>
				<tr>
					<th>부서명</th>
				<td>${mySalary.department_name}</td>
				</tr>
				<tr>
					<th>회사코드</th>
					<td>${mySalary.company_name}</td>
				</tr>
				<tr>
					<th>사원명</th>
					<td>${mySalary.name}</td>
				</tr>
			<tr>
				<th>직급</th>
				<td>${mySalary.position_name}</td>
			</tr>
			<tr>
				<th>기본급</th>
				<td>${mySalary.salary }</td>
		
			</tr>
			<tr>
				<th>커미션 퍼센트</th>
				<td>${mySalary.commission_pct }</td>				
			</tr>
			</table>
	
</body>
</html>