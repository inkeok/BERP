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
<h3>지원서 제출</h3>

<form method='post' action='insert.apply'  enctype='multipart/form-data'>
<!-- 
<form method='post' action='fillout.apply'  enctype='multipart/form-data'>
 -->
<h3>${recruit.recruit_title}</h3>
<input type='hidden' name='recruit_num' value='${recruit.recruit_num}'>
<table class='w-px1000'>
<tr><th>이름</th>
<td> 
<input type='text' class="chk" name='apply_name' placeholder="이름">
</td>
<tr>
<th>휴대폰번호</th>
<td>
<input type='text' class="chk"  name='apply_phone' placeholder="휴대폰">
<a class='btn-fill' id='btn-id'>중복확인</a>
<div class='valid'>휴대폰번호를 입력하세요</div>
</td>
</tr>
<tr>
<th>이메일</th>
<td>
<input type='text'  class="chk" name='apply_email' placeholder="email">
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

<tr>
<th>지원서 비밀번호</th>
<td>
<input type='password'  class="chk" name='apply_pw' id="apply_pw" placeholder="비밀번호">

<span id="passEqual1">비번입력</span>
</td>
</tr>
<tr>
<th>비밀번호 확인</th>
<td>
<input type='password'  class="chk" name='apply_pw_ck' id="apply_pw_ck" placeholder="비밀번호 확인">

<span id="passEqual2">한번더 비번입력</span>
</td>

</tr>
 

</table>
<div class='btnSet'>
	<a class='btn-fill' id='save'>저장</a>
	<a class='btn-empty' href='applyList.apply'>취소</a>
</div>
</form>

<script>
/* $('#save').click(function(){
	$('form').submit(); //빈칸 체크 : if( emptyCheck() ) 
}); */
$('#save').click(function(){
	if( $('[name=apply_name]').val()=='' ){
		alert( '성명을 입력하세요!' );
		$('[name=apply_name]').focus();
		return;
	}
	
	var apply_phone = $('[name=apply_phone]');
	if( apply_phone.hasClass('chked') ){
		//중복확인한 경우
		if( apply_phone.siblings('div').hasClass('invalid') ){
			alert('회원가입 불가!\n' + member.id.unUsable.desc);
			apply_phone.focus();
			return;
		}
		
	}else{
		//중복확인하지 않은 경우
		//태그의 입력값이 유효한지 확인
		if(  tagIsInValid( apply_phone ) )	return;	
		else{
			//입력값은 유효하지만 중복확인하지 않은 경우
			alert('회원가입 불가!\n' + member.id.valid.desc);
			apply_phone.focus();
			return;
		}	
	}
	
	
	
	
	
	$('form').submit();
});


//★★★비번확인
$(document).ready(function() {
	$("#apply_pw_ck").keyup(function() {
		var pass1 = $("#apply_pw").val();
		var pass2 = $("#apply_pw_ck").val();
		
		if(pass1==pass2) {
			$("#passEqual1").hide();
			$("#passEqual2").html("<span style='color:green'>일치</span>");
		}else {
			$("#passEqual1").hide();
			$("#passEqual2").html("<span style='color:red'>불일치</span>");
			
		}
	});
	
	
});




function tagIsInValid( tag ){
	var status = member.tag_status(tag);
	if(status.code=='invalid'){
		alert('지원서 제출 불가\n' + status.desc);
		tag.focus();
		return true;;
	}else 
		return false;



}


$('#btn-id').click(function(){
	phone_check();
});
//아이디 중복확인
function phone_check(){
	var apply_phone = $('[name=apply_phone]');
	//이미 중복확인 했다면 다시 확인할 필요 없음 
	if(apply_phone.hasClass('chked')) return;
	var status = member.tag_status(apply_phone);
	if(status.code == 'invalid') {
		alert('중복확인 불필요\n' + status.desc);
		apply_phone.focus();
	}else {
		$.ajax({//★★확인
			url: 'phone_check',
			data: {apply_phone: apply_phone.val()},
			success: function(response){
				console.log(response)
				//1, 사용불가 , 0 사용가능 <controller에서 설정함
				response = response ? member.id.usable : member.id.unUsable;
				apply_phone.siblings('div').text(response.desc)
					.removeClass('invalid valid').addClass(response.code);
				apply_phone.addClass('chked');
				
			}, error: function(req,text) {
				alert(text+':'+req.status);
			}
			
		});
	}
}


$('.chk').keyup(function(e){
	//아이디 태그에서 enter인 경우는 중복확인 처리 
	if($(this).attr('name')=='apply_phone' && e.keyCode==13 ){
		phone_check();
	}else {
		$(this).removeClass('chked');
		var status = member.tag_status($(this) );
		$(this).siblings('div').text( status.desc )
			.removeClass('valid invalid').addClass(status.code);	
		
	}
	
	
});



</script>


</body>
</html>