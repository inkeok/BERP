<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상신함</h1>
<table>
<c:forEach items='${submitList}' var='s'>

<tr><th>번호</th>
	<td>${s.document_code}</td>
	</tr>
<tr><th>제목</th>
	<td>${s.document_title}</td>
	</tr>
<tr><th>날짜</th>
	<td>${s.document_date}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>