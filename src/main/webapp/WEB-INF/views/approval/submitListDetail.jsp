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
<div class='centerFrame'>
	<table>
	<colgroup>
		<col width='100px'>
		<col width='100px'>
		<col width='100px'>
		<col width='100px'>
		<col width='100px'>
	</colgroup>
	
		<tr><th>제목</th>
			<td colspan='5'>${submitListDetail.document_title}</td>
			<th>제출일자</th>
			<td>${submitListDetail.document_date}</td>	
		</tr>

		<tr><th>결재자</th>
			<td>${submitListDetail.c_position} ${submitListDetail.approver}</td>
			<th>결재일자</th>
			<td>${submitListDetail.document_date}</td>	
		<tr>	

		<tr><th>내용</th>
			<td colspan='5'>${submitListDetail.document_content}</td>	
		</tr>
		<tr><th>첨부파일</th>
			<td colspan='5'></td>	
		</tr>
		<tr><th>처리</th>
			<td>${submitListDetail.c_status}</td>
			<th>Comment</th>
			<td>${submitListDetail.document_comment}</td>	
		</tr>
		
	</table>
	<a href='submitList.ap?email=${email}'>뒤로가기</a>
</div>
</body>
</html>