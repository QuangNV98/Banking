<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Banking</title>

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
<c:set var="context" value="${pageContext.request.contextPath}" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>

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
				<br>
				<h2 align="center">Interest Rate</h2>
				
				<hr>
				<form:form id="add-user-form" action="">
					<div class="form-group">
						<label>Period</label>
					    <input type="text" class="form-control" id="period" placeholder="Enter period">
					 </div>
					 
					<div class="form-group">
					    <label>Interest Rate</label>
					    <input type="number" class="form-control" id="interest_rate" placeholder="rate..." disabled="disabled">
					</div>
					 
					 <div class="form-group">
						<label for="username">Date changed</label>
					    <input type="date" class="form-control" id="date_ranger" disabled="disabled">
					 </div>
					

				</form:form>
				<button id="insert" class="btn btn-primary" onclick="doSubmit()">Submit</button>
				<button id="update" class="btn btn-primary" onclick="doUpdate()">Update</button>
				
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
