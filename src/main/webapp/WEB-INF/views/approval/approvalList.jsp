<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#approvalListTable{
	margin: 10px 0;
}
</style>
</head>
<body>
<div class='centerFrame'>
<h1>결재함</h1>
<table id='approvalListTable'>


<colgroup>
	<col width='50px'>
	<col width='150px'>
	<col width='100px'>
	<col width='100px'>
	<col width='100px'>
</colgroup>

<tr>
	<th>번호</th>
	<th>제목</th>
	<th>제출일</th>
	<th>상태</th>
	<th>기안자</th>
</tr>
<c:forEach items='${approvalList}' var='a'>
<tr>
	<td>${a.no}</td>
	<td>${a.document_title}</td>
	<td>${a.document_date}</td>
	<td>${a.document_check}</td>
	<td>${a.drafter}</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>