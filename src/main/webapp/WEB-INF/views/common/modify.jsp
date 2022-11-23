<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3>사원정보수정</h3>
<form method='get' action='common.update'>
<table class='w-px600'>
<tr><th>인사코드</th>
	<td>
		<select class="dataTable-selector" name="code_title" onchange='$("#code").val("code_title");'>
						<c:forEach items='${code_titles}' var='c'>
							<option ${vo.code_title eq c.code_title ? 'selected' : ''} 
									value='${c.code_title}'>${c.code_title}
							</option>
						</c:forEach>
						</select>
	</td>
</tr>
<tr><th>문서코드</th>
	<td>
		<select class="dataTable-selector" name="code_value" onchange='$("#code").val("code_value");'>
						<c:forEach items='${code_values}' var='v'>
							<option ${vo.code_value eq v.code_value ? 'selected' : ''} 
									value='${v.code_value}'>${v.code_value}
							</option>
						</c:forEach>
						</select>
	</td>
</tr>
<tr><th>고용형태코드</th>
	<td>
		<select class="dataTable-selector" name="code_used" onchange='$("#code").val("code_used");'>
						<c:forEach items='${code_used}' var='u'>
							<option ${vo.code_used eq u.code_used ? 'selected' : ''} 
									value='${u.code_used}'>${u.code_used}
							</option>
						</c:forEach>
					</select>
	</td>
</tr>
<tr><th>근무코드</th>
	<td>
		<select class="dataTable-selector" name="code_name" onchange='$("#code").val("code_name");'>
						<c:forEach items='${code_name}' var='n'>
							<option ${vo.code_name eq n.code_name ? 'selected' : ''} 
									value='${n.code_name}'>${n.code_name}
							</option>
						</c:forEach>
					</select>
	</td>
</tr>
<tr><th>생성날짜</th>
	<td>
		${vo.code_birth }
	</td>
</tr>
<tr><th>생성인</th>
	<td>${vo.code_maker_name }</td>
</tr>
</table>
</form>
<div class='btnSet'>
	<a class='btn-fill' onclick='$("form").submit()'>저장</a>
	<a class='btn-empty' href='common.detail?code_value=${vo.code_value}'>취소</a>
</div>
</body>
</html>