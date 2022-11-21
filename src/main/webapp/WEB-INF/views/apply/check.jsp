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
<h3>합불합</h3>
<form method='post' action='pass.apply'  enctype='multipart/form-data'>
<h3>${vo.recruit_title}</h3>
<input type='hidden' name='recruit_num' value='${vo.recruit_num}'>

<table class='w-px1000'>

<tr><th>지원자번호</th>
<td> 
${recruit_num } ${vo.apply_num }
</td>
<tr>
<tr><th>이름</th>
<td> 
${vo.apply_name }
</td>
<tr>
<th>휴대폰번호</th>
<td>
${vo.apply_phone }
</td>
</tr>
<tr>
<th>이메일</th>
<td>
${vo.apply_email }
</td>
</tr>
<tr><th>첨부파일</th>
	<td>
		<div>
<input type="hidden" id='file_name' value="${vo.file_name }">
<c:if test="${not empty vo.file_name }">
<a id='download'><i class="font-b fa-solid fa-file-arrow-down"></i></a>
</c:if>
</div>
	</td>
</tr>
<tr><th>합/불합</th>
	<td>
		
<label><input type="radio" id="apply_check" name="apply_check" value="N" 
<c:if test="${vo.apply_check eq 'N' }">checked</c:if>
>대기중</label>
<label><input type="radio" id="apply_check" name="apply_check" value="X" 
<c:if test="${vo.apply_check eq 'X' }">checked</c:if>

>불합</label>
<label><input type="radio" id="apply_check" name="apply_check" value="Y" 
<c:if test="${vo.apply_check eq 'Y' }">checked</c:if>
>합</label>
<input type="hidden" name="apply_num" value="${vo.apply_num }">
		
		<%-- 
		<input type="radio" name="apply_check" value="${vo.apply_check }"
		<c:if test="${vo.apply_check eq 'Y' }">checked</c:if>
	 	
		> 합
 
 --%>

	</td>
</tr>
	

</table>
<div class='btnSet'>
<a class='btn-fill' id="save" >저장 </a>

</div>
</form>

<script>
$('#save').click(function(){
	$('form').submit(); //빈칸 체크 : if( emptyCheck() ) 
});

$('#remove').click(function() {
	if(confirm('정말 삭제?')) {
		
		location='delete.apply?apply_num=${vo.apply_num}';
	}
});
if(isImage("${vo.file_name}")) {
	$('#file_name').after('<span id="preview"><img src="${vo.file_path}"</span>' );
	
}


</script>


</body>
</html>