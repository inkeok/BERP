<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{
	width : 1600px;
}

td {
	color: #b1b1b1;
}

</style>
</head>
<body>
	<form action="common.cd">

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
<%-- 	<a class='btn-fill' href='common.modify?code_value=${vo.code_value}'>정보수정</a> --%>
<!-- 	<a class='btn-fill'  -->
<%-- 	onclick="if( confirm('사번[${vo.employee_id}] 삭제?') ) href='common.delete?id=${vo.code_value}' " >정보삭제</a> --%>
<!-- 	<a class='btn-fill' href='common.cd'>사원목록</a> -->
</div>

</div><div class="dataTable-bottom"><div class="dataTable-info"></div></div></div>
</form>
 
</body>
</html>