<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
th{
	background : none;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<h3>신규사원등록</h3>
	<form action="insert.hr">
		<table class="w-px800">
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
					<label for=""></label>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>