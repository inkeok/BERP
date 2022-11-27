<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link href='css/recruit.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>
 <script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src='js/recruit.js?<%=new java.util.Date() %>'></script>

<!-- ★jquery선언문 jquery.com -> blog들가서 긁어옴-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js"></script>
</head>
<body>
<h3>지원서 확인하기</h3>
<form method='post' action='detail.apply'>
<div>
<ul>
<li>
<input type="text" id="apply_phone" class="chk" name="apply_phone" placeholder="phone_number">
</li>
<li>
<input type="password" id="apply_pw" class="chk"  name="apply_pw" placeholder="password">
</li>
<li><a type='button'  id='check'>확인</a></li>
<li><a type='button'   href='applyList.apply'>취소</a></li>

</ul>
</div>
</form>


<script>


$('#apply_pw').keyup(function(e){
	if(e.keyCode==13) check();
});
function check() {
	
	if(emptyCheck()) {//empty check가 true일때 실행 < webapp-> resources->js-> common.js
			
			$.ajax({
				url: 'application_detail',	//controller
				data: { apply_phone:$('#apply_phone').val(), apply_pw:$('#apply_pw').val()},
				
				success: function(response){
					console.log(response);
					
					if(response.exist) {
						
						location = 'detail.apply?apply_num='+response.apply_num;
					}
					
					else{
						alert('일치하지 않습니다');
						$('#apply_phone').focus();
					} 
				},error: function(req, text){
					alert(text+':'+req.status);
				}
				
			});	
		}	
	}
	$('#check').click(function(){
		check();
	});
</script>

</body>
</html>