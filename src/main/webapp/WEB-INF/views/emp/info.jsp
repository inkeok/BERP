<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
h3 {
	text-align: center;
	margin: 3rem 0;
}

th {
	background: none;
}
</style>
</head>
<body>
	<h3>사원정보</h3>
	<div class="w-px600">
		<table class="table table-striped">
			<tr>
				<th class="">사번</th>
				<td>${vo.employee_id}</td>
			</tr>
			<tr>
				<th class="">부서명</th>
				<td>${vo.department_name}</td>
			</tr>
			<tr>
				<th class="">회사코드</th>
				<td>${vo.company_name}</td>
			</tr>
			<tr>
				<th class="">사원명</th>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<th class="">이메일</th>
				<td>${vo.email}</td>
			</tr>
			<tr>
				<th class="">전화번호</th>
				<td>${vo.phone}</td>
			</tr>
			<tr>
				<th class="">관리자</th>
				<td>${vo.admin}</td>
			</tr>
			<tr>
				<th class="">입사일자</th>
				<td>${vo.hire_date}</td>
			</tr>
			<tr>
				<th class="">직급</th>
				<td>${vo.position_name}</td>
			</tr>
			<tr>
				<th class="">업무형태</th>
				<td>${vo.employee_pattern_name}</td>
			</tr>
		</table>
	</div>
	<div class='center'>
	<a class='btn btn-primary' href='modify.hr?id=${vo.employee_id}'>정보수정</a>
	<a class='btn btn-primary' 
	onclick="if( confirm('사번[${vo.employee_id}] 삭제?') ) href='delete.hr?id=${vo.employee_id}' " >정보삭제</a>
	<a class='btn btn-primary' href='list.hr'>사원목록</a>
</div>
</body>
</html>