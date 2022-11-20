<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='css/approval.css?<%=new java.util.Date()%>' rel='stylesheet'>
</head>
<body>
<div class='centerFrame'>
	<table class='table w-px1600'>
<colgroup>
	<col width='100px'>
	<col>
	<col width='100px'>
	<col>
</colgroup>	
		<tr><th>제목</th>
			<td colspan='3'>${submitListDetail.document_title}</td>
		</tr>
		<tr>
			<th>제출일자</th>
			<td>${submitListDetail.document_date}</td>	

			<th>결재자</th>
			<td>${submitListDetail.c_position} ${submitListDetail.approver}</td>
		</tr>	

		<tr><th>내용</th>
			<td class='t-l' colspan='3'>${submitListDetail.document_content}</td>	
		</tr>
		<tr><th>첨부파일</th>
			<td colspan='3'></td>	
		</tr>
		
	</table>
	</div>
	<div id='btnFix'><a class='btn-empty' href='submitList.ap?employee_id=${employee_id}'>뒤로가기</a></div>

</body>
</html>