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

<c:set var="context" value="${pageContext.request.contextPath}" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script>
function toSaving(id_type) {
	var id_user= '${id_user}';
	
	var url="${context}/admin/toFormSaving/"+id_user+"/"+id_type;
	window.location.replace(url); 
}

</script>

</head>

<style>

.container1 {
	width: 70%;
	
	padding: 15px 0;
	margin: 50px auto;
}

.type {
	background-color: #f8f9fa;
	border: 0.5px solid;
	height: 150px;
	border-radius: 30px;
	box-shadow: 2px 3px gray ;
	cursor :pointer;
	
}

.line{
	margin-left:10px;
}

.title{
	text-align: center;
	font-size: 22px;
	font-weight: bold;
	font-family: sans-serif;
	margin-top: 10px;
}

.desc {
	text-align: left;
	
}
</style>
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
				<button type="button" class="btn btn-primary" onclick="backToTypeSaving(${user.id })">BACK</button>
				<h2 align="center">TYPE OF SAVING</h2>
				<hr>
				<div class="container1">
				 
					<div class="row line">
					  	<c:forEach items="${types}" var="type"> 
							<div class="col-md-4 col-md-offset-1 type" onclick="toSaving(${type.getId()})">
								<div class="title">
									<p>${type.getNameSaving()}</p>
								</div>
								<hr>
								
								<div class="desc">
									<i>${type.getDesc()}</i>
								</div>
							</div>
							
								
								
						</c:forEach>			
					</div>
				
				</div>
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
