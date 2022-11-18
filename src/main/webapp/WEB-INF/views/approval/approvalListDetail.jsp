<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='css/approval.css?<%=new java.util.Date()%>' rel='stylesheet'>
<style>
.result tr td{
	text-align: left;
	padding-left: 10px;
}
</style>
</head>
<body>
<div class='centerFrame'>
<table class="table result">
	<colgroup>
		<col width='100px'>
		<col>
	</colgroup>
	
		<tr>
			<th>제목</th>
			<td>${approvalListDetail.document_title}</td>
		</tr>
		
		
		<tr>
			<th>기안자</th>
			<td>${approvalListDetail.drafter_position} ${approvalListDetail.drafter}</td>
		</tr>
		<tr>
			<th>제출일자</th>
			<td>${approvalListDetail.document_date}</td>	
		</tr>
		
		<tr>
			<th>결재자</th>
			<td>${approvalListDetail.approver_position} ${approvalListDetail.approver}</td>
		</tr>
		<tr>
			<th>결재일자</th>
			<td>${approvalListDetail.finish_date}</td>	
		</tr>
		
		<tr><th class='content'>내용</th>
			<td>${approvalListDetail.document_content}</td>	
		</tr>

		<tr><th>첨부파일</th>
			<td></td>	
		</tr>
		
		<tr>
			<th>처리결과</th>
			<td>${approvalListDetail.c_status}</td>
		</tr>
		
		
		
	</table>
	</div>
	<div id='btnFix'><a class='btn-empty' href='approvalList.ap?employee_id=${employee_id}'>뒤로가기</a></div>
</body>
</html>