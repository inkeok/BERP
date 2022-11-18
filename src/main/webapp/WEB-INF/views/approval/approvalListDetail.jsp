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
	</colgroup>
	
		<tr><th>제목</th>
			<td>${approvalListDetail.document_title}</td>
			<th>기안자</th>
			<td>${approvalListDetail.drafter_position} ${approvalListDetail.drafter}</td>
			<th>제출일자</th>
			<td>${approvalListDetail.document_date}</td>	
		</tr>
		
		<tr><th>내용</th>
			<td colspan='5'>${approvalListDetail.document_content}</td>	
		</tr>

		<tr><th>처리</th>
			<td>${approvalListDetail.c_status}</td>
			<th>결재자</th>
			<td>${approvalListDetail.approver_position} ${approvalListDetail.approver}</td>
			<th>결재일자</th>
			<td>${approvalListDetail.finish_date}</td>	
		</tr>

		
		<tr><th>첨부파일</th>
			<td colspan='5'></td>	
		</tr>
	</table>
	<a href='approvalList.ap?employee_id=${employee_id}'>뒤로가기</a>
</div>
</body>
</html>