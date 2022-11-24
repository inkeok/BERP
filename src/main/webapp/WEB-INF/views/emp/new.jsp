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
select{
	width:185px;
}

table {
	margin-top : 5px;
	margin-bottom : 20px;
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
.new-btn{
  padding: 1em 2.2em;
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
}
</style>
</head>
<body>
	<h3 class="center">신규사원등록</h3>
	<form action="insert.hr" method="post" class="w-px1000">
	
		<table class="">
		<colgroup>
			<col width="200px">
			<col width="450px">
			
		</colgroup>
			<tr>
				<th>부서명</th>
				<td><select name="department_id" >
				<option value="-1">부서선택</option>
					<c:forEach items="${departments}" var="vo">
						<option value="${vo.department_id}">${vo.department_id}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>회사코드</th>
				<td><select name="company_cd" style="width:185px">
				<option value="-1">코드선택</option>
					<c:forEach items="${emp}" var="vo">
						<option value="${vo.company_cd}">${vo.company_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th class="">사원명</th>
				<td>
					<input type="text" name="name" placeholder="성명" style="width:205px; "/>
				</td>
			</tr>
			<tr>
				<th class="">이메일</th>
				<td>
					<input type="text" name="email" placeholder="이메일" style="width:205px;"/>
				</td>
			</tr>
			<tr>
				<th class="">전화번호</th>
				<td>
					<input type="text" name="phone" placeholder="전화번호" style="width:205px;"/>
				</td>
			</tr>
			<tr>
				<th class="">관리자</th>
				<td>
					<label><input type="radio" name="admin" value="y">Y</label>
					<label><input type="radio" name="admin" value="n" checked>N</label>
				</td>
			</tr>
			<tr>
				<th>직급</th>
				<td><select name="position" style="width:185px">
				<option value="">직급선택</option>
					<c:forEach items="${position}" var="vo">
						<option value="${vo.position}">${vo.position_name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>고용형태</th>
				<td><select name="employee_pattern" style="width:185px">
				<option value="">고용선택</option>
					<c:forEach items="${pattern}" var="vo">
						<option value="${vo.employee_pattern}">${vo.employee_pattern_name}</option>
					</c:forEach>
				</select></td>
			</tr>
		</table>
	</form>
	
	<div class='center'>
		<a class='new-btn' onclick='$("form").submit()'>저장</a>
		 <a class='new-btn' href='list.hr'>취소</a>
	</div>
	<script>
	</script>
</body>
</html>