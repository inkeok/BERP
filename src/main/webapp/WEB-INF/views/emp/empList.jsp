<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>

.w-px1400 {
	width: 1400px;
}
.center{
	text-align: center;
}
.hrlist{
 margin : 3rem 0 ;
 
}

</style>
<title>Insert title here</title>
</head>
<body>
	<h2 class="center hrlist">사원목록</h2>
	<a href="new.hr" class="btn btn-outline-success">신규사원등록</a>
	<form action="list.hr">
		<div class="w-px1400">
			<table class="table table-striped table-hover">
				<colgroup>
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="170px" />
					<col width="200px" />
					<col width="200px" />
					<col width="100px" />
					<col width="130px" />
					<col width="130px" />
					<col width="130px" />
					<col width="170px" />
				</colgroup>

				<tr>
					<th>사번</th>
					<th>부서명</th>
					<th>회사코드</th>
					<th>사원명</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>관리자</th>
					<th>입사일자</th>
					<th>업무제목</th>
					<th>직급</th>
					<th>업무형태</th>
				</tr>
				<c:forEach items="${list}" var="vo">
					<tr>
						<td>${vo.employee_id}</td>
						<td>${vo.department_id}</td>
						<td>${vo.company_cd}</td>
						<td><a href="info.hr?id=${vo.employee_id}">${vo.name}</a></td>
						<td>${vo.email}</td>
						<td>${vo.phone}</td>
						<td>${vo.admin}</td>
						<td>${vo.hire_date}</td>
						<td>${vo.job_id}</td>
						<td>${vo.position}</td>
						<td>${vo.employee_pattern}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</form>
</body>
</html>