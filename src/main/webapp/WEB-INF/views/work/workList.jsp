<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

table {
	margin-top: 5px;
/* 	border-top-left-radius: 20px; */
/* 	border-top-right-radius: 20px; */
	border-radius : 15px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
	margin-bottom: 10rem;
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
margin-left: 43px;
  position: relative;
  left : -2%;
  width: 180px;
  padding: .7em 1.9em;
  font-family: inherit;
  background: url('imgs/arrow.jfif') no-repeat 95% 50%; 
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 1px solid #999;
  border-radius: 0px;

}

select::-ms-expand {
  display: none;
}
ul{
	margin-bottom: 0;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<h2 style="text-align: center;">근무 내역</h2>
		<form method='post' action='workList'>
			<div id='list-top' style="margin-bottom: 0;">
				<ul class="select-list">
					<li><select name='department_id' class='w-px200'
						onchange='$("form").submit()'>
							<option value='-1'>전체 부서</option>
							<c:forEach items='${departments}' var='d'>
								<option ${department_id eq d.department_id ? 'selected' : ''}
									value='${d.department_id}'>${d.department_name}</option>
							</c:forEach>
					</select></li>
				</ul>
			</div>
		</form>

	
	<!--  work_result table 에서 가져온다 -->
	<table style="width: 1400px">
		<thead>
			<tr>
				<th scope="col">근무 일자</th>
				<th scope="col">사번</th>
				<th scope="col">이름</th>
				<th scope="col">부서</th>
				<th scope="col">출근시간</th>
				<th scope="col">퇴근시간</th>
				<th scope="col">근무구분코드</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="15" items='${workList}' var='vo'>
				<tr>
					<td><fmt:formatDate value="${vo.work_date}" dateStyle="full"
							pattern="yyyy년MM월dd일" /></td>
					<td>${vo.employee_id}</td>
					<td>${vo.name}</td>
					<td>${vo.department_name}</td>
					<c:if test="${not empty vo.start_work }">
						<td>${vo.start_work}</td>
						<td>${vo.end_work}</td>
					</c:if>
					<c:if test="${empty vo.start_work }">
						<td>-</td>
					</c:if>
					<c:if test="${empty vo.end_work }">
						<td>-</td>
					</c:if>
					<td>${vo.work_status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>











