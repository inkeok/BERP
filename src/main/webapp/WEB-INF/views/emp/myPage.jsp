<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />   --%>
 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>

<script src='js/mypage.js?<%=new java.util.Date() %>'></script>

<style>
form{
	margin-top: 45px;
}
table {
	margin-top: 5px;
	/* 	border-top-left-radius: 20px; */
	/*     border-top-right-radius: 20px; */
	padding-bottom: 2rem;
	border-radius: 15px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
}

td a {
	color: #323232;
}

th, td {
	padding: 15px;
	background-color: rgba(255, 255, 255, 0.2);
	color: #000000;
}

th {
	text-align: center;

}

th {
	background: #12192c;
	color: #fff;
}
td {
 text-align: left;
 padding-left: 40px;
}

tbody tr:hover, td:hover {
	background-color: rgba(255, 255, 255, 0.5);
}

tbody td {
	position: relative;
}

tbody td:hover:before {
	background-color: rgba(255, 255, 255, 0.2);
	z-index: -1;
}

.new-btn {
	padding: 1em 1.8em;
	font-size: 14px;
	font-weight: 400;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 4px;
	cursor: pointer;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: none;
	color: #ffffff;
	margin-bottom: 10px;
	background: #12192c;
	position: relative;
	left: 4%;
	margin-right: 10px;
}
.margin {
margin-top: 40px;
}

.valid {
color: green;
font-size: 14px;
font-weight: bold;
}

.invalid {
color: red;
font-size: 14px;
font-weight: bold;
}

</style>
</head>
<body>
<h2 class="center hrlist">${loginInfo.name } 님 정보변경 </h2>

<form method='post' action='update.mypage'>
<input type='hidden' name='employee_id' value='${vo.employee_id}'>



<table class='w-px1000'>
<tr><th>이메일</th>
<td> 
<input type='text' class="chk" name='email' value="${vo.email }"
placeholder="이메일">
<div class='valid'>이메일 입력하세요</div>
</td>

<tr>
<th>휴대폰번호</th>
<td>
<input type='text'  class="chk" name='phone' value="${vo.phone }"
placeholder="휴대폰">
<div class='valid'>휴대폰번호를 입력하세요</div>
</td>
</tr>
<tr>
<th>비밀번호</th>
<td>
<input type='password'  class="chk" name='pw' value="${vo.pw }"
placeholder="비밀번호">
<div class='valid'>비밀번호 입력하세요</div>
</td>
</tr>
<tr>
<th>비번밀번호 확인 </th>
<td>
<input type='password'  class="chk" name='pw_ck' 
placeholder="비밀번호">
<div class='valid'>비밀번호 입력하세요</div>
</td>
</tr>



</table>
<div class='margin'>
	<a class='new-btn' id='save'>저장</a>
	<a class='new-btn' href="<c:url value='/'/>">취소</a>
</div>
</form>

<script>

$('#save').click(function(){
	
	if( emptyCheck() ) $('form').submit();
});

$('.chk').keyup(function(e){
	
	
		$(this).removeClass('chked');
		var status = member.tag_status($(this) );
		$(this).siblings('div').text( status.desc )
			.removeClass('valid invalid').addClass(status.code);	
		

	
	
});



</script>


</body>
</html>