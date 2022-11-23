<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
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
table {
	margin-top: 5px;
	margin-bottom : 10px;
	/* 	border-top-left-radius: 20px; */
	/*     border-top-right-radius: 20px; */
	border-radius: 15px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

td a {
	color: #323232;
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
	color: #fff;
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
select {
	width : 120px;

}
</style>
</head>
<body>
	<h3>사원정보수정</h3>
	<form method='post' action='common.update'>
		<%-- <input type='hidden' name='code_value' value='${vo.code_value}'> --%>
		<table class='w-px800'>
			<!-- <tr><th class='w-px160'>사번</th> -->
			<%-- 	<td>${vo.employee_id }</td> --%>
			<!-- </tr> -->
			<!-- <tr><th>사원명</th> -->
			<%-- 	<td><input type='text' name='last_name' value='${vo.last_name }'> --%>
			<%-- 		<input type='text' name='first_name' value='${vo.first_name }'> --%>
			<!-- 	</td> -->
			<!-- </tr> -->
			<!-- <tr><th>이메일</th> -->
			<%-- 	<td><input type='text' name='email' value='${vo.email }'></td> --%>
			<!-- </tr> -->
			<!-- <tr><th>전화번호</th> -->
			<%-- 	<td><input type='text' name='phone_number' value='${vo.phone_number }'></td> --%>
			<!-- </tr> -->
			<colgroup>
				<col width= 200px;>
			</colgroup>
			<tr>
				<th>인사코드</th>
				<td><select name="code_title"
					onchange='$("#code").val("code_title"); $("form").submit()'>
						<option value="all">인사코드</option>
						<c:forEach items='${code_titles}' var='c'>
							<option ${vo.code_title eq c.code_title ? 'selected' : ''}
								value='${c.code_title}'>${c.code_title}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>문서코드</th>
				<td><select name="code_value"
					onchange='$("#code").val("code_value"); $("form").submit()'>
						<option value="-1">문서코드</option>
						<c:forEach items='${code_values}' var='v'>
							<option ${vo.code_value eq v.code_value ? 'selected' : ''}
								value='${v.code_value}'>${v.code_value}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>고용형태코드</th>
				<td><select  name="code_used"
					onchange='$("#code").val("code_used"); $("form").submit()'>
						<option value="all">고용형태코드</option>
						<c:forEach items='${code_used}' var='c'>
							<option ${vo.code_used eq c.code_used ? 'selected' : ''}
								value='${c.code_used}'>${c.code_used}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>근무코드</th>
				<td><select  style="width :120px;" class="dataTable-selector" name="code_used"
					onchange='$("#code").val("code_name"); $("form").submit()'>
						<option value="all">근무코드</option>
						<c:forEach items='${code_name}' var='c'>
							<option ${vo.code_name eq c.code_name ? 'selected' : ''}
								value='${c.code_name}'>${c.code_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>생성날짜</th>
				<td>${vo.code_birth }</td>
			</tr>
			<tr>
				<th>생성인</th>
				<td>${vo.code_maker_name }</td>
			</tr>
		</table>
	</form>
	<div class='btnSet'>
		<a class='btn-fill' onclick='$("form").submit()'>저장</a> <a
			class='btn-empty' href='common.detail?code_value=${vo.code_value}'>취소</a>
	</div>
</body>
</html>