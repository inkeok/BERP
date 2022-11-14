<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<li class="breadcrumb-item">근태</li>
						<li class="breadcrumb-item active">근태관리</li>
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
										<p class="mb-0">${vo.employee_id}/ ${vo.position_name}</p>
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
									  <a id ="start_btn" type="button" class="btn btn-light waves-effect " >출근하기</a><input name="start_work" id="start_work"
										<fmt:formatDate value="${wVo.start_work}" pattern="HH:mm:ss"/>>
									<fmt:formatDate value="${wVo.start_work}" pattern="HH:mm:ss" />
							
								</div>
								<div class="mt-2">
									  <a id = "end_btn" type="button" class="btn btn-light waves-effect" >퇴근하기</a><input name="end_work" id="end_work"
										<fmt:formatDate value="${wVo.end_work}" pattern="HH:mm:ss"/>>
									<fmt:formatDate value="${wVo.end_work}" pattern="HH:mm:ss" />
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


							<div class="mt-4">
								<div data-simplebar="init" style="max-height: 400px;">
									<div class="simplebar-wrapper" style="margin: 0px;">
										<div class="simplebar-height-auto-observer-wrapper">
											<div class="simplebar-height-auto-observer"></div>
										</div>
										<div class="simplebar-mask">
											<div class="simplebar-offset"
												style="right: -17px; bottom: 0px;">
												<div class="simplebar-content-wrapper"
													style="height: auto; overflow: hidden scroll;">
													<div class="simplebar-content" style="padding: 0px;">

														<div class="table-wrapper">
															<div class="table-responsive fixed-solution"
																data-pattern="priority-columns">
																<div class="sticky-table-header"
																	style="visibility: hidden; width: auto; top: -4.40625px;">
																	<table
																		class="table table-nowrap align-middle table-hover mb-0"
																		id="id3c6e7ddbeb24f-clone">
																		<tbody>
																			<tr>

																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<h5 class="text-truncate font-size-14 mb-1">
																						<a href="javascript: void(0);" class="text-dark">Skote
																							Saas Dashboard</a>
																					</h5>
																					<p class="text-muted mb-0">Assigned to Mark</p>
																				</td>
																				<td style="width: 90px;" data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div>
																						<ul class="list-inline mb-0 font-size-16">
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-success p-1"><i
																									class="bx bxs-edit-alt"></i></a></li>
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-danger p-1"><i
																									class="bx bxs-trash"></i></a></li>
																						</ul>
																					</div>
																				</td>
																			</tr>

																			<tr>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div class="form-check">
																						<input class="form-check-input" type="checkbox"
																							id="tasklistCheck02-clone"> <label
																							class="form-check-label" for="tasklistCheck02"></label>
																					</div>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<h5 class="text-truncate font-size-14 mb-1">
																						<a href="javascript: void(0);" class="text-dark">New
																							Landing UI</a>
																					</h5>
																					<p class="text-muted mb-0">Assigned to Team A</p>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div>
																						<ul class="list-inline mb-0 font-size-16">
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-success p-1"><i
																									class="bx bxs-edit-alt"></i></a></li>
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-danger p-1"><i
																									class="bx bxs-trash"></i></a></li>
																						</ul>
																					</div>
																				</td>
																			</tr>

																			<tr>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div class="form-check">
																						<input class="form-check-input" type="checkbox"
																							id="tasklistCheck02-clone"> <label
																							class="form-check-label" for="tasklistCheck02"></label>
																					</div>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<h5 class="text-truncate font-size-14 mb-1">
																						<a href="javascript: void(0);" class="text-dark">Brand
																							logo design</a>
																					</h5>
																					<p class="text-muted mb-0">Assigned to Janis</p>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div>
																						<ul class="list-inline mb-0 font-size-16">
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-success p-1"><i
																									class="bx bxs-edit-alt"></i></a></li>
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-danger p-1"><i
																									class="bx bxs-trash"></i></a></li>
																						</ul>
																					</div>
																				</td>
																			</tr>

																			<tr>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div class="form-check">
																						<input class="form-check-input" type="checkbox"
																							id="tasklistCheck04-clone"> <label
																							class="form-check-label" for="tasklistCheck04"></label>
																					</div>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<h5 class="text-truncate font-size-14 mb-1">
																						<a href="javascript: void(0);" class="text-dark">Blog
																							Template UI</a>
																					</h5>
																					<p class="text-muted mb-0">Assigned to Dianna</p>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div>
																						<ul class="list-inline mb-0 font-size-16">
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-success p-1"><i
																									class="bx bxs-edit-alt"></i></a></li>
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-danger p-1"><i
																									class="bx bxs-trash"></i></a></li>
																						</ul>
																					</div>
																				</td>
																			</tr>

																			<tr>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div class="form-check">
																						<input class="form-check-input" type="checkbox"
																							id="tasklistCheck05-clone"> <label
																							class="form-check-label" for="tasklistCheck05"></label>
																					</div>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<h5 class="text-truncate font-size-14 mb-1">
																						<a href="javascript: void(0);" class="text-dark">Multipurpose
																							Landing</a>
																					</h5>
																					<p class="text-muted mb-0">Assigned to Team B</p>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div>
																						<ul class="list-inline mb-0 font-size-16">
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-success p-1"><i
																									class="bx bxs-edit-alt"></i></a></li>
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-danger p-1"><i
																									class="bx bxs-trash"></i></a></li>
																						</ul>
																					</div>
																				</td>
																			</tr>
																			<tr>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div class="form-check">
																						<input class="form-check-input" type="checkbox"
																							id="tasklistCheck06-clone"> <label
																							class="form-check-label" for="tasklistCheck06"></label>
																					</div>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<h5 class="text-truncate font-size-14 mb-1">
																						<a href="javascript: void(0);" class="text-dark">Redesign
																							- Landing page</a>
																					</h5>
																					<p class="text-muted mb-0">Assigned to Jerry</p>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div>
																						<ul class="list-inline mb-0 font-size-16">
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-success p-1"><i
																									class="bx bxs-edit-alt"></i></a></li>
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-danger p-1"><i
																									class="bx bxs-trash"></i></a></li>
																						</ul>
																					</div>
																				</td>
																			</tr>
																			<tr>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div class="form-check">
																						<input class="form-check-input" type="checkbox"
																							id="tasklistCheck07-clone"> <label
																							class="form-check-label" for="tasklistCheck07"></label>
																					</div>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<h5 class="text-truncate font-size-14 mb-1">
																						<a href="javascript: void(0);" class="text-dark">Skote
																							Crypto Dashboard</a>
																					</h5>
																					<p class="text-muted mb-0">Assigned to Eric</p>
																				</td>
																				<td data-org-colspan="1"
																					data-columns="id3c6e7ddbeb24f-col-undefined">
																					<div>
																						<ul class="list-inline mb-0 font-size-16">
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-success p-1"><i
																									class="bx bxs-edit-alt"></i></a></li>
																							<li class="list-inline-item"><a
																								href="javascript: void(0);"
																								class="text-danger p-1"><i
																									class="bx bxs-trash"></i></a></li>
																						</ul>
																					</div>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<table
																	class="table table-nowrap align-middle table-hover mb-0"
																	style="height: 550px;">
																	<tbody>
																		<tr>
																			<td style="width: 50px;" data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<div class="form-check">
																					<input class="form-check-input" type="checkbox"
																						id="tasklistCheck01"> <label
																						class="form-check-label" for="tasklistCheck01"></label>
																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined"
																				id="todaysp">
																				<h5 class="text-truncate font-size-16 mb-1">
																					<a href="javascript: void(0);" class="text-dark"
																						id="week1"></a>&nbsp; <span
																						class="badge badge-pill badge-soft-success font-size-12"
																						id="today1">오늘</span>
																				</h5>

																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">

																				<div class="d-flex flex-wrap gap-3">
																					<!--  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
		                                                    data-bs-whatever="@mdo">Open modal for @mdo</button> -->
																					<a href="#" class="text-dark font-size-16"
																						data-bs-toggle="modal"
																						data-bs-target="#exampleModal"
																						data-bs-whatever="@mdo"> <span
																						class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																						&nbsp;${list.get(0).getWorksttsScTm()}
																					</a>

																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				${list.get(0).getWorksttsTm()} 시간</td>

																		</tr>
																		<tr>
																			<td style="width: 50px;" data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<div class="form-check">
																					<input class="form-check-input" type="checkbox"
																						id="tasklistCheck01"> <label
																						class="form-check-label" for="tasklistCheck01"></label>
																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<h5 class="text-truncate font-size-16 mb-1">
																					<a href="javascript: void(0);" class="text-dark"
																						id="week2"> </a>&nbsp;<span
																						class="badge badge-pill badge-soft-success font-size-12"
																						id="today2">오늘</span>
																				</h5>

																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">

																				<div class="d-flex flex-wrap gap-3">
																					<!--  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
		                                                    data-bs-whatever="@mdo">Open modal for @mdo</button> -->
																					<a href="#" class="text-dark font-size-16"
																						data-bs-toggle="modal"
																						data-bs-target="#exampleModal"
																						data-bs-whatever="@mdo"> <span
																						class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																						&nbsp;${list.get(1).getWorksttsScTm()}
																					</a>

																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				${list.get(1).getWorksttsTm()} 시간</td>

																		</tr>

																		<tr>
																			<td style="width: 50px;" data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<div class="form-check">
																					<input class="form-check-input" type="checkbox"
																						id="tasklistCheck01"> <label
																						class="form-check-label" for="tasklistCheck01"></label>
																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<h5 class="text-truncate font-size-16 mb-1">
																					<a href="javascript: void(0);" class="text-dark"
																						id="week3"> </a>&nbsp;<span
																						class="badge badge-pill badge-soft-success font-size-12"
																						id="today3">오늘</span>
																				</h5>

																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">

																				<div class="d-flex flex-wrap gap-3">
																					<!--  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
		                                                    data-bs-whatever="@mdo">Open modal for @mdo</button> -->
																					<a href="#" class="text-dark font-size-16"
																						data-bs-toggle="modal"
																						data-bs-target="#exampleModal"
																						data-bs-whatever="@mdo"> <span
																						class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																						&nbsp;${list.get(2).getWorksttsScTm()}
																					</a>

																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				${list.get(2).getWorksttsTm()} 시간</td>

																		</tr>

																		<tr>
																			<td style="width: 50px;" data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<div class="form-check">
																					<input class="form-check-input" type="checkbox"
																						id="tasklistCheck01"> <label
																						class="form-check-label" for="tasklistCheck01"></label>
																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<h5 class="text-truncate font-size-16 mb-1">
																					<a href="javascript: void(0);" class="text-dark"
																						id="week4"> </a>&nbsp;<span
																						class="badge badge-pill badge-soft-success font-size-12"
																						id="today4">오늘</span>
																				</h5>

																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">

																				<div class="d-flex flex-wrap gap-3">
																					<!--  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
		                                                    data-bs-whatever="@mdo">Open modal for @mdo</button> -->
																					<a href="#" class="text-dark font-size-16"
																						data-bs-toggle="modal"
																						data-bs-target="#exampleModal"
																						data-bs-whatever="@mdo"> <span
																						class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																						&nbsp;${list.get(3).getWorksttsScTm()}
																					</a>

																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				${list.get(3).getWorksttsTm()} 시간</td>

																		</tr>

																		<tr>
																			<td style="width: 50px;" data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<div class="form-check">
																					<input class="form-check-input" type="checkbox"
																						id="tasklistCheck01"> <label
																						class="form-check-label" for="tasklistCheck01"></label>
																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<h5 class="text-truncate font-size-16 mb-1">
																					<a href="javascript: void(0);" class="text-dark"
																						id="week5"> </a>&nbsp;<span
																						class="badge badge-pill badge-soft-success font-size-12"
																						id="today5">오늘</span>
																				</h5>

																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">

																				<div class="d-flex flex-wrap gap-3">
																					<!--  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
		                                                    data-bs-whatever="@mdo">Open modal for @mdo</button> -->
																					<a href="#" class="text-dark font-size-16"
																						data-bs-toggle="modal"
																						data-bs-target="#exampleModal"
																						data-bs-whatever="@mdo"> <span
																						class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																						&nbsp;${list.get(4).getWorksttsScTm()}
																					</a>

																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				${list.get(4).getWorksttsTm()} 시간</td>

																		</tr>

																		<tr>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<div class="form-check">
																					<input class="form-check-input" type="checkbox"
																						id="tasklistCheck06"> <label
																						class="form-check-label" for="tasklistCheck06"></label>
																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<h5 class="text-truncate font-size-16 mb-1">
																					<a href="javascript: void(0);" class="text-dark"
																						id="week6"> </a>&nbsp;<span
																						class="badge badge-pill badge-soft-success font-size-12"
																						id="today6">오늘</span>
																				</h5>

																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<div>
																					<span
																						class="badge badge-pill badge-soft-success font-size-12">쉬는날</span>
																				</div>
																			</td>
																		</tr>
																		<tr>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<div class="form-check">
																					<input class="form-check-input" type="checkbox"
																						id="tasklistCheck07"> <label
																						class="form-check-label" for="tasklistCheck07"></label>
																				</div>
																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined">
																				<h5 class="text-truncate font-size-16 mb-1">
																					<a href="javascript: void(0);" class="text-dark"
																						id="week0"> </a><span
																						class="badge badge-pill badge-soft-success font-size-12"
																						id="today0">오늘</span>
																				</h5>

																			</td>
																			<td data-org-colspan="1"
																				data-columns="id3c6e7ddbeb24f-col-undefined"><span
																				class="badge badge-pill badge-soft-success font-size-12">쉬는날</span>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="simplebar-placeholder"
											style="width: auto; height: 800px;"></div>
									</div>
									<div class="simplebar-track simplebar-horizontal"
										style="visibility: hidden;">
										<div class="simplebar-scrollbar"
											style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
									</div>
									<div class="simplebar-track simplebar-vertical"
										style="visibility: visible;">
										<div class="simplebar-scrollbar"
											style="height: 20px; transform: translate3d(0px, 134px, 0px); display: block;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<div class="card-body">

							<ul class="nav nav-pills nav-justified" role="tablist">

								<li class="nav-item waves-effect waves-light"><a
									class="nav-link active" data-bs-toggle="tab" href="#profile-1"
									role="tab"> <span class="d-block d-sm-none"><i
											class="far fa-user"></i></span> <span class="d-none d-sm-block">연차</span>
								</a></li>
								<li class="nav-item waves-effect waves-light"><a
									class="nav-link" data-bs-toggle="tab" href="#messages-1"
									role="tab"> <span class="d-block d-sm-none"><i
											class="far fa-envelope"></i></span> <span class="d-none d-sm-block">외근</span>
								</a></li>
								<li class="nav-item waves-effect waves-light"><a
									class="nav-link" data-bs-toggle="tab" href="#settings-1"
									role="tab"> <span class="d-block d-sm-none"><i
											class="fas fa-cog"></i></span> <span class="d-none d-sm-block">원격근무</span>
								</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content p-3 text-muted">

								<div class="tab-pane active" id="profile-1" role="tabpanel">
									<i class="bx bx-time-five"></i> <select class="form-select se">
										<option>오전반차</option>
										<option>오후반차</option>
										<option>연차</option>
									</select> <br> <i class="bx bx-edit-alt"></i> <input id="" name=""
										placeholder="휴가 사유" class="form-control se" type="text"
										value="">
								</div>

								<div class="tab-pane" id="messages-1" role="tabpanel">
									<i class="bx bx-time-five"></i> <select id="" name="" title=""
										tabindex="-1" aria-hidden="true" data-select2-id="4"
										class="form-control select2 select2-hidden-accessible se">
										<option value="">오전 9:00</option>
										<option value="">오전 9:30</option>
										<option value="">오전 10:00</option>
										<option value="">오전 10:30</option>
										<option value="">오전 11:00</option>
										<option value="">오전 11:30</option>
									</select> &nbsp;-&nbsp; <select id="" name="" title="" tabindex="-1"
										aria-hidden="true" data-select2-id="4"
										class="form-control select2 select2-hidden-accessible se">
										<option value="">오후 12:00</option>
										<option value="">오후 12:30</option>
										<option value="">오후 01:00</option>
										<option value="">오후 01:30</option>
										<option value="">오후 02:00</option>
										<option value="">오후 02:30</option>
										<option value="">오후 03:00</option>
										<option value="">오후 03:30</option>
										<option value="">오후 04:00</option>
										<option value="">오후 04:30</option>
										<option value="">오후 05:00</option>
										<option value="">오후 05:30</option>
										<option value="">오후 06:00</option>
										<option value="">오후 06:30</option>
										<option value="">오후 07:00</option>
										<option value="">오후 07:30</option>
										<option value="">오후 08:00</option>
										<option value="">오후 08:30</option>
										<option value="">오후 09:00</option>
										<option value="">오후 09:30</option>
										<option value="">오후 10:00</option>
										<option value="">오후 10:30</option>
									</select>

								</div>
								<div class="tab-pane" id="settings-1" role="tabpanel">
									<i class="bx bx-time-five"></i> <select id="" name="" title=""
										tabindex="-1" aria-hidden="true" data-select2-id="4"
										class="form-control select2 select2-hidden-accessible se">
										<option value="">오전 9:00</option>
										<option value="">오전 9:30</option>
										<option value="">오전 10:00</option>
										<option value="">오전 10:30</option>
										<option value="">오전 11:00</option>
										<option value="">오전 11:30</option>
									</select> &nbsp;-&nbsp; <select id="" name="" title="" tabindex="-1"
										aria-hidden="true" data-select2-id="4"
										class="form-control select2 select2-hidden-accessible se">
										<option value="">오후 12:00</option>
										<option value="">오후 12:30</option>
										<option value="">오후 01:00</option>
										<option value="">오후 01:30</option>
										<option value="">오후 02:00</option>
										<option value="">오후 02:30</option>
										<option value="">오후 03:00</option>
										<option value="">오후 03:30</option>
										<option value="">오후 04:00</option>
										<option value="">오후 04:30</option>
										<option value="">오후 05:00</option>
										<option value="">오후 05:30</option>
										<option value="">오후 06:00</option>
										<option value="">오후 06:30</option>
										<option value="">오후 07:00</option>
										<option value="">오후 07:30</option>
										<option value="">오후 08:00</option>
										<option value="">오후 08:30</option>
										<option value="">오후 09:00</option>
										<option value="">오후 09:30</option>
										<option value="">오후 10:00</option>
										<option value="">오후 10:30</option>
									</select>

								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">근무 등록하기</button>
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
				//location = 'work';
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
				/* location = 'work'; */
			}
		});
	}
</script>
</html>