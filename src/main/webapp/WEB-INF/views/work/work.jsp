<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input {
	display: none;
}
</style>
</head>
<body>
	<a action="work_end_input" method="post" id="input" />
	<div class="row">
		<div class="col-12">
			<div
				class="page-title-box d-sm-flex align-items-center justify-content-between">

				<h1 class="mb-sm-0 font-size-20" id="timesm">
					<i class="bx bx-buildings"></i>
				</h1>

				<div class="page-title-right">
					<ol class="breadcrumb m-0">
						<li class="breadcrumb-item">근태 /</li>
						<li class="breadcrumb-item active"><a href="holiday">
								휴무관리</a></li>
					</ol>
				</div>

			</div>
		</div>
	</div>
	<!-- end page title -->

	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-4">
							<div class="d-flex">
								<div class="flex-grow-1 align-self-center">
									<div class="text-muted">
										<p class="mb-2" id="times"></p>
										<h5 class="mb-1">${vo.name}</h5>
										<p class="mb-0">${vo.employee_id}/${vo.position_name}</p>
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

	<div class="row">

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
								<h5 class="font-size-16 mb-0">이번달 근무시간</h5>
							</div>
							<h5 class="font-size-15">
								<span class="float-end">61%</span>
							</h5>
							<div class="progress animated-progess progress-md">
								<div class="progress-bar" role="progressbar" style="width: 61%"
									aria-valuenow="61" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="">
								<div class="mt-3">
									<a id="start_btn" type="button"
										class="btn btn-light waves-effect ">출근하기</a> <input
										name="start_work" id="start_work">${wVo.start_work}

								</div>
								<div class="mt-2">
									<a id="end_btn" type="button"
										class="btn btn-light waves-effect">퇴근하기</a> <input
										name="end_work" id="end_work">${wVo.end_work}
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- end row -->
	<div class="row">
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
								<h5 class="font-size-16 mb-0">이번 주 근무</h5>
								
							</div>
							
							<!--  work_result table 에서 가져온다 -->
							<table class="table table-sm">
									<thead>
										<tr>
											<th scope="col">출근 일자</th>
											<th scope="col">출근시간</th>
											<th scope="col">퇴근시간</th>
											<th scope="col">근무 형태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${workList}" var="woR">
										<tr>
											<td><fmt:formatDate value="${woR.work_date}" dateStyle="full" pattern="yyyy년MM월dd일"/></td>
											<c:if test="${not empty woR.start_work }">
											<td>${woR.start_work}</td>
											<td>${woR.end_work}</td>
											</c:if>
											<c:if test="${empty woR.start_work }">
											<td>-</td>
											</c:if>
											<c:if test="${empty woR.end_work }">
											<td>-</td>
											</c:if>
											
											<td>${woR.work_status}</td>
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
	/* document.querySelector('#start_work');
	document.querySelector('#end_work'); */

	const a = document.querySelector('#start_btn');
	const b = document.querySelector('#end_btn');

	b.onclick = function() {
		/* document.querySelector('#end_work').innerText = '퇴근시간 : '+ timeString; */
		$('#end_work').val(
				new Date().getHours() + ':' + new Date().getMinutes() + ':'
						+ new Date().getSeconds());
		$('#input').submit();
		work_end_input();

	}
	a.onclick = function() {
		$('#start_work').val(
				new Date().getHours() + ':' + new Date().getMinutes() + ':'
						+ new Date().getSeconds());
		$('#input').submit();
		work_start_input();
		/* document.querySelector('#end_work').innerText = '퇴근시간 : '+ timeString; */
		/* work_start_input(); */
	}

	function work_end_input() {
		$.ajax({
			url : 'work_end_input',
			data : {
				end_work : $('#end_work').val()
			},
			success : function(response) {
				console.log(end_work);
				if (response)
					alert('퇴근 되었습니다');
			}
		});
	}

	function work_start_input() {
		$.ajax({
			url : 'work_start_input',
			data : {
				start_work : $('#start_work').val()
			},
			success : function(response) {
				console.log(start_work);
				if (response)
					alert('출근 되었습니다');

			},
			error : function(req, text) {
				alert('이미 출근되었습니다');
			}
		});
	}
</script>
</html>