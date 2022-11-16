<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
 

</head>
<body>
<h3>지원서 제출</h3>
<form method='post' action='insert.apply'  enctype='multipart/form-data'>
<input type='hidden' name='recruit_num' value='${recruit_num}'>

<table class='w-px1000'>
<tr><th>이름</th>
<td> 
<input type='text' name='apply_name'>
</td>
<tr>
<th>휴대폰번호</th>
<td>
<input type='text' name='apply_phone'>
</td>
</tr>
<tr>
<th>이메일</th>
<td>
<input type='text' name='apply_email'>
</td>
</tr>
<tr><th>첨부파일</th>
	<td class='text-left'>
		<div class='align'>
		<label>
			<input type='file' name='file' id='attach-file'>
			<a><i class="font-b fa-solid fa-file-circle-plus"></i></a>
		</label>
		<span id='file_name'></span>
		<span id='preview'></span>
		<a id='delete-file'><i class="font-r fa-solid fa-trash-can"></i></a>
		</div>
	</td>
</tr>

</table>
<div class='btnSet'>
	<a class='btn-fill' id='save'>저장</a>
	<a class='btn-empty' href='applyList.apply'>취소</a>
</div>
</form>

<script>
$('#save').click(function(){
	$('form').submit(); //빈칸 체크 : if( emptyCheck() ) 
});

</script>


</body>
</html>