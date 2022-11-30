<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style>
h3{
	text-align: center;
	margin: 3rem 0;
}
table {
	margin-top: 10px;
	border-radius : 20px;
	border-collapse: collapse;
	overflow: hidden;
	margin-bottom : 18rem;
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
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<h3>사원정보수정</h3>
	<form action="update.hr" method="post">
		<div class="w-px800">
			<table>
			<colgroup>
				<col width="200px" />
				<col width="500px" />
			</colgroup>
				<tr>
					<th>사번</th>
					<td>${vo.employee_id}</td>
				</tr>
				<tr>
					<th>부서명</th>
				<td><select name="department_id" style="width:185px">
				<option value="">${vo.department_name}</option>
					<c:forEach items="${departments}" var="d">
						<option value="">${d.department_name}</option>
					</c:forEach>
				</select></td>
				</tr>
				<tr>
					<th>회사코드</th>
					<td><select name="company" style="width:185px">
					<option value="">${vo.company_name}</option>
						<c:forEach items="${company}" var="c">
							<option value="">${c.company_name}</option>
						</c:forEach>
				</select></td>
				</tr>
				<tr>
					<th>사원명</th>
					<td><input type="text" name="name" value="${vo.name}" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="${vo.email}" /></td>
				</tr>
				<tr>
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
				<option value="">${vo.position_name}</option>
					<c:forEach items="${position}" var="p">
						<option value="">${p.position_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>고용형태</th>
				<td><select name="employee_pattern" style="width:185px">
				<option value="">${vo.employee_pattern}</option>
					<c:forEach items="${employee_pattern}" var="emp">
						<option value="">${emp.employee_pattern}</option>
					</c:forEach>
				</select></td>
			</tr>
			</table>
		</div>
	</form>
	<div class='btnSet center'>
		<a class='btn-fill' onclick='$("form").submit()'>저장</a>
		 <a class='btn-empty' href='list.hr'>취소</a>
	</div>
</body>
</html>