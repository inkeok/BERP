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
<h3>채용공고 글쓰기</h3>
<form method='post' action='insert.rec' enctype='multipart/form-data'>
<table class='w-px1000'>

<tr><th class='w-px140'>유형</th>
	<td>
	<select	name='employee_pattern' class='w-px200' > 
				
				
						<option value='-1'>정규직</option>
						<option value='1'>계약직</option>
	
				
<%-- 				<c:forEach items='${code}' var='c'>
						<option value='${c.code_value }'>
	 ${c.code_name }</option>
	
				</c:forEach> --%>
			</select>
	</td>
</tr>
<tr><th>채용시작일</th>
<td><input type="text" id="from" name="recruit_start" readonly>
<a id='delete'><i class="font-r fa-regular fa-calendar-xmark"></i></a>
</td>
</tr>
<tr><th>채용종료일</th>
<td><input type="text" id="to" name="recruit_end" readonly>
<a id='delete'><i class="font-r fa-regular fa-calendar-xmark"></i></a>
</td>
</tr>



<tr><th class='w-px140'>제목</th>
	<td><input type='text' name='recruit_title' class='full chk' title='제목'></td>
</tr>
<tr><th>내용</th>
	<td><textarea name='recruit_content' class='full chk' title='내용'></textarea></td>
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
<input type='hidden' name='writer' value='${loginInfo.id}'>
</form>
<div class='btnSet'>
	<a class='btn-fill' id='save'>저장</a>
	<a class='btn-empty' href='list.rec'>취소</a>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  <script>
  $( function() {
	  
	    var dateFormat = "yy/mm/dd",
	      from = $( "#from" )
	        .datepicker({
	          showMonthAfterYear: true, //연도,달 순서로 지정
	          changeMonth: true,//달 변경 지정
	          dateFormat:"yy/mm/dd",//날짜 포맷
	          dayNamesMin: ["일", "월", "화", "수", "목", "금", "토" ],//요일 이름 지정
	          monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],//월 이름 지정
	          minDate:0 //오늘 이전 날짜를 선택할 수 없음
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate(this) );//종료일의 minDate 지정
	        }),
	      to = $( "#to" ).datepicker({
	     showMonthAfterYear: true,  
	        changeMonth: true,
	        dateFormat:"yy/mm/dd",
	        dayNamesMin: ["일", "월", "화", "수", "목", "금", "토" ],
	        monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
	        minDate:'+1D' //내일부터 선택가능, 지정형식 예(+1D +1M +1Y)
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate(this) );//시작일의 maxDate 지정
	      });
	 
	    function getDate(element) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	        if(element.id == 'from'){
	        date.setDate(date.getDate()+1);//종료일은 시작보다 하루 이후부터 지정할 수 있도록 설정
	        }else{
	         date.setDate(date.getDate()-1);//시작일은 종료일보다 하루 전부터 지정할 수 있도록 설정
	        }
	      } catch( error ) {
	        date = null;
	      }
	      return date;
	    }
	  } );
  
  $('#save').click(function(){
		$('form').submit(); //빈칸 체크 : if( emptyCheck() ) 
	});
</script>
</body>
</html>







