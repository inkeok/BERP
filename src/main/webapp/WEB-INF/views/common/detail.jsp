<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3{
	text-align: center;
	padding: 3rem 0;
}

body {
	width: 1600px;
}

td {
	color: #b1b1b1;
}

table {
	margin-top : 5px;
/* 	border-top-left-radius: 20px; */
/*     border-top-right-radius: 20px; */
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
  background-color: #12192c;
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
</style>
</head>
<body>

	<h3>수정화면</h3>
	<form action="common.cd">
	
					<div class="dataTable-container">
						<table class='w-px600'>
							<tr>
								<th class='w-px160'>인사코드</th>
								<td>${vo.code_title }</td>
							</tr>
							<tr>
								<th>문서코드</th>
								<td>${vo.code_value }</td>
							</tr>
							<tr>
								<th>고용형태코드</th>
								<td>${vo.code_used }</td>
							</tr>
							<tr>
								<th>근무코드</th>
								<td>${vo.code_name }</td>
							</tr>
							<tr>
								<th>생성날짜</th>
								<td>${vo.code_maker }</td>
							</tr>
							<tr>
								<th>생성인</th>
								<td>${vo.code_maker_name }</td>
							</tr>
						</table>
					</div>
					<div>
		<div class="card mb-4">
	<div class="card-header"> 
	사원정보 </div>
	<div class="card-body">
       <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
<div class="dataTable-container">
<table class='w-px600'>
<tr><th class='w-px160'>인사코드</th>
	<td>${vo.code_title }</td>
</tr>
<tr><th>문서코드</th>
	<td>${vo.code_value }</td>
</tr>
<tr><th>고용형태코드</th>
	<td>${vo.code_used }</td>
</tr>
<tr><th>근무코드</th>
	<td>${vo.code_name }</td>
</tr>
<tr><th>생성날짜</th>
	<td>${vo.code_birth }</td>
</tr>
<tr><th>생성인</th>
	<td>${vo.code_maker_name }</td>
</tr>
</table>
</div>
<div>
						<a href='common.modify?code_value=${vo.code_value}'>정보수정</a>
<%-- 							onclick="if( confirm('사번[${vo.employee_id}] 삭제?') ) href='common.delete?id=${vo.code_value}' " >정보삭제</a> --%>
<!-- 							<a class='btn-fill' href='common.cd'>사원목록</a> -->
					</div>
	</form>

</body>
</html>