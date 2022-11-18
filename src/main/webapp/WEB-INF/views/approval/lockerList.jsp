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


<colgroup>
	<col width='150px'>
	<col width='100px'>
	<col width='100px'>
</colgroup>

<tr>
	<th>번호</th>
	<th>제목</th>
	<th>날짜</th>
</tr>
<c:forEach items='${lockerList}' var='l'>
<tr>
	<td>${l.no}</td>
	<td><a onclick='location="lockerListDetail.ap?no=${l.no}&email=${email}&ing_no=${l.ing_no}"'>${l.document_title}</a></td>
	<td>${l.document_date}</td>
</tr>
</c:forEach>
</table>
<a class='sideBtn-empty' onclick='location="post.ap"'>삭제</a>
</div>
</body>
</html>