<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>ADMIN</title>

<!-- Bootstrap Core CSS -->
<c:url value="/static/admin/css/bootstrap.min.css" var="bootstrap"></c:url>
<link href="${bootstrap}" rel="stylesheet" type="text/css" media="all">

<!-- MetisMenu CSS -->
<c:url value="/static/admin/css/metisMenu.min.css" var="metisMenu"></c:url>
<link href="${metisMenu}" rel="stylesheet" type="text/css" media="all">

<!-- Timeline CSS -->
<c:url value="/static/admin/css/timeline.css" var="timeline"></c:url>
<link href="${timeline}" rel="stylesheet" type="text/css" media="all">

<!-- Custom CSS -->
<c:url value="/static/admin/css/startmin.css" var="startmin"></c:url>
<link href="${startmin}" rel="stylesheet" type="text/css" media="all">

<!-- Morris Charts CSS -->
<c:url value="/static/admin/css/startmin.css" var="morris.css"></c:url>
<link href="${morris}" rel="stylesheet" type="text/css" media="all">

<!-- Custom Fonts -->
<c:url value="/static/admin/css/font-awesome.min.css" var="font"></c:url>
<link href="${font}" rel="stylesheet" type="text/css" media="all">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

</script>

</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<jsp:include page="/WEB-INF/views/view-admin/include/header.jsp"></jsp:include>
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/view-admin/include/menu.jsp"></jsp:include>
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header" align="center">ADMIN</h1>
					</div>
				</div>
				<!-- ... Your content goes here ... -->
				<table class="table">
				  <caption>List of users</caption>
				  <span>
				  	<input id="myInput" type="text" placeholder="Search..">
				  </span>
				<br><br>
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Name</th>
				      <th scope="col">Num_Account</th>
				      <th scope="col">Num_Saving</th>
				      <th scope="col">Deposit</th>
				      <th scope="col">Interest rate in month</th>
				      <th scope="col">Start Date</th>
				      <th scope="col">End Date</th>
				    </tr>
				  </thead>
				  <tbody id="myTable">
				  	<c:forEach items="${savings}" var="saving">
							<tr>
								<td></td>
								<td>${saving.getUser().getName()}</td>
								<td>${saving.getUser().getAccount_number()}</td>
								<td>${saving.getNumSaving()}</td>
								<td>${saving.getDeposit()}</td>
								<td>${saving.getInterestRate().getInterest_rate()}% in ${saving.getInterestRate().getPeriod()} month</td>
								<td>${saving.getStartDate()}</td>
								<td>${saving.getEndDate()}</td>
								<td><a
									href="<c:url value = '/admin/toDetailSaving/${saving.getNumSaving()}'/>">Detail</a></td>
							</tr>
							
					</c:forEach>
				  
				  </tbody>
				</table>
				
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<c:url value="/static/admin/js/jquery.min.js" var="jquery"></c:url>
	<script src="${jquery}"></script>

	<!-- Bootstrap Core JavaScript -->
	<c:url value="/static/admin/js/bootstrap.min.js" var="bootstrap"></c:url>
	<script src="${bootstrap}"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<c:url value="/static/admin/js/metisMenu.min.js" var="metisMenujs"></c:url>
	<script src="${metisMenujs}"></script>

	<!-- Custom Theme JavaScript -->
	<c:url value="/static/admin/js/startmin.js" var="startmin"></c:url>
	<script src="${startmin}"></script>


</body>
</html>
