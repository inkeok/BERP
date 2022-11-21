0<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='css/styles.css?<%=new java.util.Date() %>' type='text/css' rel='stylesheet'>
<style>

body{
	width : 1600px;
}

td {
	color: #b1b1b1;
}
</style>
</head>
<body>
	<!-- <h2 class="center hrlist">코드관리</h2> -->
	<form action="common.cd">

		<div class="card mb-4">
			<div class="card-header">코드관리</div>
			<div class="card-body">
				<div
					class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
					<div class="dataTable-top">
						<div class="dataTable-dropdown">
							<label> <select class="dataTable-selector"
								name="membercode" onchange='$("form").submit()'>
									<option value="all">인사전체코드</option>
									<c:forEach items='${code_title}' var='c'>
										<option ${code_title eq c.code_title ? 'selected' : ''}
											value='${c.code_title}'>${c.code_title}</option>
									</c:forEach>
							</select>
							</label> <label> <select class="dataTable-selector">
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="25">25</option>
							</select>
							</label>

						</div>
					</div>
					<div class="dataTable-container">
						<table id="datatablesSimple" class="dataTable-table">
							<thead>
								<tr>
									<th data-sortable="" style="width: 10%;"><span
										class="dataTable-sorter">문서코드</span></th>
									<th data-sortable="" style="width: 10%;"><span
										class="dataTable-sorter">근무구분코드</span></th>
									<th data-sortable="" style="width: 10%;"><span
										class="dataTable-sorter">고용형태</span></th>
									<th data-sortable="" style="width: 10%;"><span
										class="dataTable-sorter">코드생성일</span></th>
									<th data-sortable="" style="width: 13%;"><span
										class="dataTable-sorter">코드생성자</span></th>
								</tr>
							</thead>
							<c:forEach items="${list}" var="vo">
								<tr>
									<td>${vo.code_title}</td>
									<td>${vo.code_value}</td>
									<td>${vo.code_name}</td>
									<td>${vo.code_birth}</td>
									<td>${vo.code_maker_name}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
<!-- 					<div class="dataTable-bottom"> -->
<!-- 						<div class="dataTable-info"></div> -->
<!-- 						<nav class="dataTable-pagination"> -->
<!-- 							<ul class="dataTable-pagination-list"> -->
<!-- 								<li class="active"><a href="#" data-page="1">1</a></li> -->
<!-- 								<li class=""><a href="#" data-page="2">2</a></li> -->
<!-- 								<li class=""><a href="#" data-page="3">3</a></li> -->
<!-- 								<li class=""><a href="#" data-page="4">4</a></li> -->
<!-- 								<li class=""><a href="#" data-page="5">5</a></li> -->
<!-- 								<li class=""><a href="#" data-page="6">6</a></li> -->
<!-- 								<li class="pager"><a href="#" data-page="2">›</a></li> -->
<!-- 							</ul> -->
<!-- 						</nav> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</form>
 
</body>
</html>