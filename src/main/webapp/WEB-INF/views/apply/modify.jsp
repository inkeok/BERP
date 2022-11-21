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
<script src='js/apply.js?<%=new java.util.Date() %>'></script>

</head>
<body>
<h3>지원서 수정!!!!!!!!!!!!!</h3>

<form method='post' action='update.apply'  enctype='multipart/form-data'>
<!-- 
<form method='post' action='fillout.apply'  enctype='multipart/form-data'>
 -->
<h3>${recruit.recruit_title}</h3>
<input type='hidden' name='apply_num' value="${vo.apply_num }">
<input type='hidden' name='file_name' value="${vo.file_name }">

<table class='w-px1000'>
<tr><th>이름</th>
<td> 
<input type='text' class="chk" name='apply_name' value="${vo.apply_name }">
</td>

<tr>
<th>이메일</th>
<td>
<input type='text'  class="chk" name='apply_email' value="${vo.apply_email }">
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
	<a class='btn-empty' onclick="history.go(-1)">취소</a>
</div>
</form>

<script>
/* $('#save').click(function(){
	$('form').submit(); //빈칸 체크 : if( emptyCheck() ) 
}); */
$('#save').click(function(){

	
	$('form').submit();
});
if(isImage("${vo.file_name}")) {
	$('#file_name').after('<span id="preview"><img src="${vo.file_path}"</span>' );
	
}








</script>


</body>
</html>