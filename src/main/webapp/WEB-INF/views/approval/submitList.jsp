<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#submitListTable{
	margin: 10px 0;
}

.w-px1600 {
	width: 1600px;
}
.center{
	text-align: center;
}
.hrlist{
 margin : 3rem 0 ;
 
}
</style>
</head>
<body>
<div class='centerFrame'>

<h1 class="center">상신함</h1>

<table class="table table-striped table-hover w-px1600">

<colgroup>
	<col width='50px'>
	<col width='50px'>
	<col width='150px'>
	<col width='100px'>
	<col width='100px'>
	<col width='100px'>
	<col width='100px'>
</colgroup>

<tr>
	<th>번호</th>
	<th>제목</th>
	<th>제출일</th>
	<th>상태</th>
	<th>결재자</th>
	<th>결재일</th>
	<th>비고</th>
</tr>
<c:forEach items='${submitList}' var='s'>
<tr>
	<td>${s.no}</td>
	<td><a onclick='location="submitListDetail.ap?no=${s.no}&email=${email}"'>${s.document_title}</a></td>
	<td>${s.document_date}</td>
	<td>${s.c_status}</td>
	<td>${s.c_position} ${s.approver}</td>
	<td>${s.finish_date}</td>
	<td>${s.document_comment}</td>
</tr>
</c:forEach>
</table>
<a class='sideBtn-fill' onclick='location="post.ap"'>작성</a>
</div>
</body>
</html>