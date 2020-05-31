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
$(document).ready(function(){
	  var user_string= '${user}';
	  
	  if(user_string === null|| user_string=== '' ){
		  $("#update").hide();
		  $("#saving").hide();
		  $("#id").val(null);
		  return;
	  }else {
	  	var user_obj = JSON.parse(user_string);
	  	$("#username").val(user_obj.username);
	  	$("#password").val(user_obj.password);
	  	$("#email").val(user_obj.email);
	  	$("#address").val(user_obj.address);
	  	$("#phone").val(user_obj.phone);
	  	$("#name").val(user_obj.name);
	  	$("#total_money").val(user_obj.total_money);
	  	$("#date_ranger").val(formatDate(user_obj.date_ranger));
	  	$("#id_number").val(user_obj.id_number);
	  	$("#id").val(user_obj.id);
	  	
	  	$("#insert").hide();
	  	
	  }
	  
	});
	
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}	



function doSubmit() {
	
	var account_num= Math.floor((Math.random() * 100000000000) + 1);
	
	if($("#username").val() == '') {
		alert('* required username')
	}else if($("#password").val() == '') {
		alert('* required password')
	}else if($("#email").val() == '') {
		alert('* required email')
	}else if($("#phone").val() == '') {
		alert('* required phone')
	}else if($("#address").val() == '') {
		alert('* required address')
	}else if($("#name").val() == '') {
		alert('* required name')
	}else if($("#total_money").val() == '') {
		alert('* required total_money')
	}else if($("#date_ranger").val() == '') {
		alert('* required date_ranger')
	}
	else {
		$.ajax({
	        url: "${context}/admin/save01.ajax",
	        type: 'post',
	        data: 'username=' + $("#username").val() + "&password=" + $("#password").val() + "&email=" + $("#email").val()
	        + "&phone=" + $("#phone").val()+ "&address=" + $("#address").val()+ "&name=" + $("#name").val()+ "&total_money=" + $("#total_money").val()
	        + "&date_ranger=" + $("#date_ranger").val()
	        + "&id_number=" + $("#id_number").val() 
	        + "&id=" + $("#id").val()
	        + "&account_number=" + account_num
	       ,
	        
	        cache: false,
	        success: function(response) {
	        		
	            	alert(response);
	    			
	       
	        },error : function(){
	            alert('fail');
	            return false;
	        }
	    }); 
	}	
}

function doChoose() {
	var id_user= $("#id").val();
	var url="${context}/admin/toTypeSaving/"+id_user;
	window.location.replace(url); 
	
}
</script>
    
</head>

<style>

.container1 {
	width: 70%;
	background-color: #f8f9fa;
	padding: 15px 0;
	margin: 45px auto;
	border-radius: 30px;
}

.col-right {
	padding-left: 40px;
}


.form-control {
	height: 50px;
	border-radius: 20px;
}

.btn {
	margin-top: 30px;
	height: 40px;
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
				<br>
				<h2 align="center" style="font-weight:bold;">USER INFORMATION</h2>		
				<hr>
				
				<div class="container1">
					<div class="row" style="margin-bottom: 20px;">
						<div class="col-sm-6 col-right">
							<label>UserName</label>
						    <input type="text" class="form-control" id="username" placeholder="Enter username">
					 	</div>
					 	
					 	<div class="col-sm-6" style="padding-right:45px;">
					    	<label for="exampleInputPassword1">Password</label>
					    	<input type="password" class="form-control" id="password" placeholder="Password">
						</div>
					</div>
					
					<div class="row" style="margin-bottom: 20px;">
						<div class="col-sm-6 col-right">
							<label for="username">Name</label>
					    	<input type="text" class="form-control" id="name" placeholder="Enter name">
						</div>
						
						<div class="col-sm-6 row">
						
							<div class="col-sm-6">
								<label for="username">ID Number</label>
						    	<input type="text" class="form-control" id="id_number" placeholder="Enter idNumber">
						 	</div>
					 	
						 	<div class="col-sm-6">
								<label for="username">Date ranger</label>
						    	<input type="date" class="form-control" id="date_ranger" placeholder="Enter date">
					 		</div>
					 	</div>
					</div>
					
					<div class="row" style="margin-bottom: 20px;">
						<div class="col-sm-6 col-right">
							<label for="username">Address</label>
					    	<input type="text" class="form-control" id="address" placeholder="Enter address">
					 	</div>
					 	
					 	<div class="col-sm-6 row">
					 	
						 	<div class="col-sm-6">
								<label for="username">Email</label>
						    	<input type="text" class="form-control" id="email" placeholder="Enter email">
						 	</div>
						 	
						 	<div class="col-sm-6">
								<label for="username">Phone</label>
						   	 	<input type="text" class="form-control" id="phone" placeholder="Enter phonenumber">
						 	</div>
					 	
					 	</div>
					 	
					</div>
					
					<div class="row" style="margin-bottom: 20px;">
						
						<div class="col-sm-6 col-right">
							<button id="insert" class="btn btn-success" onclick="doSubmit()">Submit</button>
							<button id="update" class="btn btn-primary" onclick="doSubmit()">Update</button>
							<button class="btn btn-warning" id="saving" onclick="doChoose()">To Saving</button>
							<a href="<c:url value = '/admin/list-user'/>">
							<button type="button" class="btn btn-info">Back</button>
							</a>
					 	</div>
					 	
					 	<div class="col-sm-6 row">
						 	<div class="col-sm-6">
						 	</div>
						 	<div class="col-sm-6">
								<label for="username">Total Money</label>
						    	<input type="number" class="form-control" id="total_money" placeholder="Enter money">
						 	</div>
					 	</div>
					 	
					 	<input type="hidden" id="account_number">
						<input type="hidden" id="id">
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
