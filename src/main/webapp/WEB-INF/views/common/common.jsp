<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- <h2 class="center hrlist">코드관리</h2> -->
<form action="list.cd">

<div class="card mb-4">
	<div class="card-header">                                
	    코드관리
	</div>
   <div class="card-body">
       <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
       	<div class="dataTable-top">
       		<div class="dataTable-dropdown">
       			<label>
       				<select class="dataTable-selector" name="membercode" onchange='$("form").submit()'>
       				<option value="all">인사전체코드</option>
						<c:forEach items='${common_code}' var='c'>
							<option ${code_title eq c.code_title ? 'selected' : ''} 
									value='${c.code_title}'>${c.code_title}
							</option>
						</c:forEach>
					</select>
    			</label>
      				
      				<label>
       				<select class="dataTable-selector">
       				<option value="10" selected="">10</option>
       				<option value="15">15</option>
       				<option value="20">20</option>
       				<option value="25">25</option>
       				</select> 
      				</label>
      				
      				<label>
       				<select class="dataTable-selector">
       				<option value="10" selected="">10</option>
       				<option value="15">15</option>
       				<option value="20">20</option>
       				<option value="25">25</option>
       				</select> 
      				</label>
      				
      				<label>
       				<select class="dataTable-selector">
       				<option value="10" selected="">10</option>
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
	     <th data-sortable="" style="width: 19.7333%;">
	    	<span class="dataTable-sorter">Name</span>
	    </th>
        <th data-sortable="" style="width: 29.1556%;">
        	<span class="dataTable-sorter">Position</span>
       	</th>
     	<th data-sortable="" style="width: 15.7333%;">
     		<span class="dataTable-sorter">Office</span>
   		</th>
   		<th data-sortable="" style="width: 8.97778%;">
   			<span class="dataTable-sorter">Age</span>
		</th>
		<th data-sortable="" style="width: 15.1111%;">
			<span class="dataTable-sorter">Start date</span>
		</th>
		<th data-sortable="" style="width: 11.2889%;">
			<span class="dataTable-sorter">Salary</span>
		</th>
		</tr>
	</thead>
            
            <tbody><tr><td>Tiger Nixon</td><td>System Architect</td><td>Edinburgh</td><td>61</td><td>2011/04/25</td><td>$320,800</td></tr><tr><td>Garrett Winters</td><td>Accountant</td><td>Tokyo</td><td>63</td><td>2011/07/25</td><td>$170,750</td></tr><tr><td>Ashton Cox</td><td>Junior Technical Author</td><td>San Francisco</td><td>66</td><td>2009/01/12</td><td>$86,000</td></tr><tr><td>Cedric Kelly</td><td>Senior Javascript Developer</td><td>Edinburgh</td><td>22</td><td>2012/03/29</td><td>$433,060</td></tr><tr><td>Airi Satou</td><td>Accountant</td><td>Tokyo</td><td>33</td><td>2008/11/28</td><td>$162,700</td></tr><tr><td>Brielle Williamson</td><td>Integration Specialist</td><td>New York</td><td>61</td><td>2012/12/02</td><td>$372,000</td></tr><tr><td>Herrod Chandler</td><td>Sales Assistant</td><td>San Francisco</td><td>59</td><td>2012/08/06</td><td>$137,500</td></tr><tr><td>Rhona Davidson</td><td>Integration Specialist</td><td>Tokyo</td><td>55</td><td>2010/10/14</td><td>$327,900</td></tr><tr><td>Colleen Hurst</td><td>Javascript Developer</td><td>San Francisco</td><td>39</td><td>2009/09/15</td><td>$205,500</td></tr><tr><td>Sonya Frost</td><td>Software Engineer</td><td>Edinburgh</td><td>23</td><td>2008/12/13</td><td>$103,600</td></tr></tbody>
        </table></div><div class="dataTable-bottom"><div class="dataTable-info">Showing 1 to 10 of 57 entries</div><nav class="dataTable-pagination"><ul class="dataTable-pagination-list"><li class="active"><a href="#" data-page="1">1</a></li><li class=""><a href="#" data-page="2">2</a></li><li class=""><a href="#" data-page="3">3</a></li><li class=""><a href="#" data-page="4">4</a></li><li class=""><a href="#" data-page="5">5</a></li><li class=""><a href="#" data-page="6">6</a></li><li class="pager"><a href="#" data-page="2">›</a></li></ul></nav></div></div>
    </div>
</div>

	<%-- <div class="w-px1600">
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
					
				</tr>
		</table>
	</div> --%>
</form>
</body>
</html>