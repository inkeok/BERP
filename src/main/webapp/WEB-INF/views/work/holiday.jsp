<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>Insert title here</title>
<style>
input {
	width: 100px;
}

body {
	width: 1200px;
}
</style>
</head>
<body>
	<a action="work_end_input" method="post" id="input" />
	<div class="row">
		<div class="col-12">
			<div style="margin: 35px"
				class="page-title-box d-sm-flex align-items-center justify-content-between">

				<h1 class="mb-sm-0 font-size-20" id="timesm">
					<i class="bx bx-buildings"></i>
				</h1>

				<div class="page-title-right">
					<ol class="breadcrumb m-0">
						<li class="breadcrumb-item"><a href="work">근태 </a></li>
						<li class="breadcrumb-item"><a href="holiday"> 휴무관리</a></li>
					</ol>
				</div>

			</div>
		</div>
	</div>
	<!-- end page title -->

	<div class="row mb-4">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-4">
							<div class="d-flex">
								<div class="flex-grow-1 align-self-center">
									<div class="text-muted">
										<p class="mb-2" id="times"></p>
										<h5 class="mb-1">${vo.name}&nbsp;[${vo.position_name}]</h5>
										<p class="mb-0">사 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번 /
											${vo.employee_id}</p>
										<p class="mb-0">입사일자 / ${vo.hire_date}</p>

									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4 align-self-center">
							<div class="text-lg-center mt-4 mt-lg-0">
								<div class="row">
									<div class="col-4">
										<div></div>
									</div>
									<div class="col-4">
										<div></div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4 d-none d-lg-block">
							<div class="clearfix mt-4 mt-lg-0"></div>
						</div>
					</div>
					<!-- end row -->
				</div>
			</div>
		</div>
	</div>
	<!-- end row -->

	<div class="row mb-4">
		<div class="">
			<div class="row">
				<div class="">
					<div class="card">
						<div class="card-body">
							<div class="d-flex align-items-center mb-3">
								<div class="avatar-xs me-3">
									<span
										class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
										<i class="bx bx-time-five"></i>
									</span>
								</div>
								<h5 class="font-size-16 mb-0">남은연차</h5>

							</div>

							<p class="mb-0" style="margin-left: 10px">${vo.hire_year }년차

							</p>
							<p class="mb-0" style="margin-left: 10px">연차 갯수 &nbsp;21 / 23</p>
							<h5 class="font-size-15">
								<span class="float-end">9%</span>
							</h5>
							<div class="progress animated-progess progress-md">
								<div class="progress-bar" role="progressbar" style="width: 9%"
									aria-valuenow="31" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="row mb-4">
		<div class="">
			<div class="row">
				<div class="">
					<div class="card">
						<div class="card-body">
							<div class="d-flex align-items-center mb-3">
								<div class="avatar-xs me-3">
									<span
										class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
										<i class="bx bx-time-five"></i>
									</span>
								</div>
								<div class="mt-3">
									<input style="width: 130px" id="holiday_start_btn" type="date" min="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"
										class="btn btn-light waves-effect" value="휴가 시작일" />
										 <input
										style="width: 130px" id="holiday_end_btn" type="date" min="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>"
										class="btn btn-light waves-effect" value="휴가 종료일" />
									<!-- </input> -->
				
									<ul>
										<li><select name='holiday_category' id="category">
												<c:forEach items="${codeList}" var="code">
													<option ${code_value eq code.code_value ? 'selected' : ''}
														value="${code.code_value }">${code.code_name }</option>
												</c:forEach>
										</select></li>
									</ul>
									<input id="holiday_submit_btn" type="button"
										class="btn btn-light waves-effect" value="휴가신청" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- end row -->
	<div class="row mb-4">
		<div class="col-xl-12">
			<div class="card">
				<div class="card-body">
					<div class="clearfix">
						<div class="card-body">
							<div class="d-flex align-items-center mb-3">
								<div class="avatar-xs me-3">
									<span
										class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
										<i class="bx bx-task"></i>
									</span>
								</div>
								<h5 class="font-size-16 mb-0">휴가 소진 내역</h5>

							</div>

							<!--  work_result table 에서 가져온다 -->
							<table class="table table-sm">
								<thead>
									<tr>
										<th scope="col">일자</th>
										<th scope="col">출근 시간</th>
										<th scope="col">퇴근 시간</th>
										<th scope="col">연차 종류</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${holiday_list}" var="hol">
										<tr>
											<td><fmt:formatDate value="${hol.work_date}"
													dateStyle="full" pattern="yyyy년MM월dd일" /></td>
											<c:if test="${not empty hol.start_work }">
												<td>${hol.start_work}</td>
												<td>${hol.end_work}</td>
											</c:if>
											<c:if test="${empty hol.start_work }">
												<td>-</td>
											</c:if>
											<c:if test="${empty hol.end_work }">
												<td>-</td>
											</c:if>
											<td>${hol.work_status}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row mb-5">
		<div class="col-xl-12">
			<div class="card">
				<div class="card-body">
					<div class="clearfix">
						<div class="card-body">
							<div class="d-flex align-items-center mb-3">
								<div class="avatar-xs me-3">
									<span
										class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
										<i class="bx bx-task"></i>
									</span>
								</div>
								<h5 class="font-size-16 mb-0">휴가 신청 내역</h5>

							</div>

							<!--  work_result table 에서 가져온다 -->
							<table class="table table-sm">
								<thead>
									<tr>
										<th scope="col">휴가 일자</th>
										<th scope="col">휴가 구분</th>
										<th scope="col">신청 일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${holiday_submit_list}" var="holE">
										<tr>
											<td><fmt:formatDate value="${holE.holiday_date}"
													dateStyle="full" pattern="yyyy년MM월dd일" /></td>
											<td>${holE.work_status}</td>
											<td><fmt:formatDate value="${holE.work_date}"
													dateStyle="full" pattern="yyyy년MM월dd일" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>


	/* const a = document.querySelector('#holiday_start_btn');
	const b = document.querySelector('#holiday_end_btn'); */
	const c = document.querySelector('#holiday_submit_btn');

	/* a.onclick = function() {
		$('#holiday_start_btn').datepicker({
			lang:'ko',
			dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
	        dayNamesMin: ['일','월','화','수','목','금','토'], 
	        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
		});

	}
	b.onclick = function() {
		$('#holiday_end_btn').datepicker({
			lang:'ko',
			dateFormat: 'yy-mm-dd',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
	        dayNamesMin: ['일','월','화','수','목','금','토'], 
	        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
			maxDate : new Date();
		});

	} */
	
	
	c.onclick = function() {
			
		$.ajax({
			url: 'holiday_submit',
			data :{
				start_holiday : $('#holiday_start_btn').val(),
				end_holiday : $('#holiday_end_btn').val(),
				work_code : $('#category').val()
				
			}, success : function(response){
				console.log(response)	
				alert('휴가 신청되었습니다');
			},error: function(req, text){
				alert('이미 신청된 휴가일입니다.');
				}		
			});
		}
</script>
</html>