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
<%-- <form id='resultForm' action='insertResult.ap?email=${loginInfo.email}&url=receiveList.ap'> --%>
<form id='resultForm' action='insertResultEnd.ap'>

<%-- <input type='hidden' name='employee_id' value='${loginInfo.employee_id}'> --%>
<input type='hidden' name='url' value='receiveList.ap'>

<input type='hidden' name='ing_no' value='${receiveListDetail.ing_no}'>
<input type='hidden' name='employee_id' value='${receiveListDetail.employee_id}'>
	<input type='hidden' name='department_id' value='${receiveListDetail.department_id}'>
	<input type='hidden' name='company_cd' value='${receiveListDetail.company_cd}'>
	<input type='hidden' name='document_title' value='${receiveListDetail.document_title}'>
	<input type='hidden' name='document_content' value='${receiveListDetail.document_content}'>
	<input type='hidden' name='document_date' value='${receiveListDetail.document_date}'>
<%-- 	<input type='hidden' name='document_check' value='${receiveListDetail.document_check}'> --%>
	<input type='hidden' name='document_submit' value='${receiveListDetail.document_submit}'>
	<input type='hidden' name='approver_id' value='${receiveListDetail.approver_id}'>
	
	<table>
	<colgroup>
		<col width='100px'>
		<col width='100px'>
		<col width='100px'>
		<col width='100px'>
		<col width='100px'>
	</colgroup>
	
		<tr><th>제목</th>
			<td colspan='5'>${receiveListDetail.document_title}</td>	
		</tr>

		<tr><th>기안자</th>
			<td>${receiveListDetail.c_position} ${receiveListDetail.drafter}</td>	
		<tr><th>제출일자</th>
			<td>${receiveListDetail.document_date}</td>	
		<tr><th>처리</th>
			<td><select id='document_check' name='document_check'>
				<c:forEach items='${document_checks}' var='d'>
				<option ${d.code_value eq document_check ? 'selected' : ''} value='${d.code_value}'>${d.code_name}</option>
				</c:forEach>
			</select></td>	
		</tr>

		<tr><th>내용</th>
			<td colspan='5'>${receiveListDetail.document_content}</td>	
		</tr>
		<tr><th>첨부파일</th>
			<td colspan='5'></td>	
		</tr>
		<tr><th>Comment</th>
		    <td><textarea name='document_comment'></textarea></td>
		</tr>
	</table>
</form>
	<a class='sideBtn-empty' id='resultInsert'>저장</a>
	<a href='receiveList.ap?employee_id=${loginInfo.employee_id}'>뒤로가기</a>
	
</div>
<script>
document.querySelector('#resultInsert').onclick = function(){
	if( document.querySelector('#document_check').value=='D101' ){
		alert('처리가 선택되지 않았습니다')
		return;
	}
	document.querySelector('#resultForm').submit();	
}
</script>
</body>
</html>