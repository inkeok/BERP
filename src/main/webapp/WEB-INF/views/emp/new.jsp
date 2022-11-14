<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
h3{
	margin : 3rem 0;
}
th{
	background : none;
}
table{

}
</style>
</head>
<body>
	<h3 class="center">신규사원등록</h3>
	<form action="insert.hr" method="post" class="w-px1000">
		<table class="table table-striped">
			<tr>
				<th>부서명</th>
				<td><select name="department_id" style="width:185px">
				<option value="${vo.department_name}">부서선택</option>
					<c:forEach items="${departments}" var="vo">
						<option value="">${vo.department_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>회사코드</th>
				<td><select name="company" style="width:185px">
				<option value="">코드선택</option>
					<c:forEach items="${company}" var="vo">
						<option value="">${vo.company_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th class="">사원명</th>
				<td>
					<input type="text" name="name" placeholder="성명" />
				</td>
			</tr>
			<tr>
				<th class="">이메일</th>
				<td>
					<input type="text" name="email" placeholder="이메일" />
				</td>
			</tr>
			<tr>
				<th class="">전화번호</th>
				<td>
					<input type="text" name="phone" placeholder="전화번호" />
				</td>
			</tr>
			<tr>
				<th class="">관리자</th>
				<td>
					<label><input type="radio" name="gender" value="y">Y</label>
					<label><input type="radio" name="gender" value="n" checked>N</label>
				</td>
			</tr>
			<tr>
				<th>직급</th>
				<td><select name="position" style="width:185px">
				<option value="">직급선택</option>
					<c:forEach items="${position}" var="vo">
						<option value="">${vo.position}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>고용형태</th>
				<td><select name="employee_pattern" style="width:185px">
				<option value="">고용선택</option>
					<c:forEach items="${employee_pattern}" var="vo">
						<option value="">${vo.employee_pattern}</option>
					</c:forEach>
				</select></td>
			</tr>
		</table>
	</form>
	
	<div class='btnSet center'>
		<a class='btn-fill' onclick='$("form").submit()'>저장</a>
		 <a class='btn-empty' href='list.hr'>취소</a>
	</div>
	<script>
	</script>
</body>
</html>