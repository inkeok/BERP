<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>

.w-px1600 {
	width: 1600px;
}
.center{
	text-align: center;
}
.hrlist{
 margin : 3rem 0 ;
 
}

</style>
</head>
<body>
<h2 class="center hrlist">코드관리</h2>
<form action="list.cd">
	<div class="w-px1600">
		<table class="table table-striped table-hover">
			<colgroup>
					<col width="120px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="130px" />
					<col width="130px" />
				</colgroup>
				
				<tr>
					<th>인사코드</th>
					<th>문서코드</th>
					<th>근무구분코드</th>
					<th>고용형태</th>
					
					<th>코드생성일</th>
					<th>코드생성자</th>
				</tr>
				<tr>
					<select class='w-px100'>
						<option value="none">==선택==</option>
						<option value="1">one</option>
						<option value="2">two</option>
					</select>
				</tr>
		</table>
	</div>
</form>
</body>
</html>