<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#lockerListTable{
	margin: 10px 0;
}
</style>
</head>
<body>
<div class='centerFrame'>
<h1>보관함</h1>
<table id='lockerListTable'>
<c:forEach items='${lockerList}' var='l'>

<colgroup>
	<col width='50px'>
	<col width='150px'>
	<col width='100px'>
	<col width='100px'>
</colgroup>

<tr>
	<th>번호</th>
	<th>제목</th>
	<th>날짜</th>
	<th>상태</th>
</tr>
<tr>
	<td>${l.no}</td>
	<td>${l.document_title}</td>
	<td>${l.document_date}</td>
	<td>${l.document_check}</td>
</tr>
</c:forEach>
</table>

</div>
</body>
</html>