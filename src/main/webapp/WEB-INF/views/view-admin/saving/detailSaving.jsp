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
	
	
	
});

function backToListSavings() {
	var url="${context}/admin/list-saving";
	window.location.replace(url); 
}

function doWithDrawal() {
	var interest_real;
	var today = new Date();
	var day_str= today.getFullYear()+ '-' + ('0' + (today.getMonth()+1)).slice(-2) + '-'+('0' + today.getDate()).slice(-2);
	
	if(day_str == '${saving.endDate}') {
		interest_real= parseFloat('${saving.deposit }') + parseFloat('${saving.interestAsm}' );	
	}else {
		var startDate_str= '${saving.startDate }';
		var total_day =  Math.floor(( Date.parse(day_str) - Date.parse(startDate_str) ) / 86400000); 
		
		interest_real= parseFloat('${saving.deposit }') * parseFloat('${percent_pre.percent }') * (total_day/365);
	}
	
	if (confirm('Are you sure you want to withdrawal?')) {
		$.ajax({
	        url: "${context}/admin/withDrawal.ajax",
	        type: 'post',
	        data: 'interest_real=' + interest_real + '&num_saving=' + '${saving.numSaving}' ,
	        cache: false,
	        success: function(response) {    		
	            	alert(response); 
	            	callBackFunction();
	            	
	        },error : function(){
	            alert('fail');
	            return false;
	        }
	    });
	} else {
	    
	}
}

function callBackFunction() {
	var url="${context}/admin/list-saving";
	window.location.replace(url); 
}
</script>
    
    
</head>

<style>
.infor {
	text-align: center;
	
}

.container1 {
	width: 70%;
	background-color: #f8f9fa;
	padding: 15px 0;
	margin: 50px auto;
}

.infor-detail {
	text-align: left;
	padding-left: 75px;
}

.text {
	font-style: italic;
}

h3 {
  text-decoration: underline;
}

.line {
	padding-bottom: 4px;
}

.btn-save {
	margin-left: 320px;
	margin-top: 25px;
}

input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
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
				
				<button type="button" class="btn btn-primary" onclick="backToListSavings()">BACK</button>
						
				<h2 align="center">Saving</h2>
				<hr>
				<div class="container1">
				<div class="row infor">
					
					<div class="col-sm-6"> 	
					<h3>Customer Information</h3>	
					<div class="infor-detail">	
						<div class="row line">	
							<label class="col-sm-4">Name:</label>
					    	<span class="col-sm-8 text">${user.name }</span>
 						 </div>
						<div class="row line">	
							<label class="col-sm-4">Phone:</label>
					    	<span class="col-sm-8 text">${user.phone }</span>
 						 </div>
 						 <div class="row line">	
							<label class="col-sm-4">Email:</label>
					    	<span class="col-sm-8 text">${user.email }</span>
 						 </div>
 						  <div class="row line">	
							<label class="col-sm-4">Address:</label>
					    	<span class="col-sm-8 text">${user.address }</span>
 						 </div>
 						 <div class="row line">	
							<label class="col-sm-4">IDNumber:</label>
					    	<span class="col-sm-8 text">${user.id_number }</span>
 						 </div>
 					 </div>	
					 </div>
					 
					 <div class="col-sm-6">
					 	<h3>Account Information</h3>
					 	<div class="infor-detail">	
					 	
						 	<div class="row line">	
								<label class="col-sm-4">Account Number:</label>
						    	<span class="col-sm-8 text">${user.account_number }</span>
	 						 </div>
	 						 <div class="row line">	
								<label class="col-sm-4">Total Money:</label>
						    	<span class="col-sm-8 text">${user.total_money }</span>
	 						 </div>	
	 						 
	 					
 						</div>		    
					 </div>
					  	
				</div>
				<hr>
					 
				<div class="row">
					<div class="col-sm-6"> 	
						<div style="padding-left: 65px;margin-bottom:10px;">
						    <label for="exampleInputPassword1">Deposit from account</label>
						    <input type="number" value="${saving.deposit }" class="form-control" id="deposit" placeholder="Deposit..." disabled="disabled">
						</div>
						<br>
						 <div style="padding-left: 65px;margin-bottom:10px;">
					
							<label for="username">Interest Rate: </label>
						    <span class="text">${rate.interest_rate }% on ${rate.period } month</span>
						</div>
						
						<div style="padding-left: 65px;">
					
							<label for="username">Type Saving: </label>
						    <span class="text">${type.nameSaving }</span>
						</div>
					</div>
					<div class="col-sm-6"> 	
						<div class="row" style="margin-left: 60px">
						 	<label class="col-sm-4">Money ASS(VND):</label>
						 	<span class="col-sm-6 text" id="money_asm">${saving.interestAsm}</span>
						 	
						 </div>
						 
						 <div class="row" style="margin-left: 60px">
						 	<label class="col-sm-4">Start Date:</label>
						 	<span class="col-sm-6 text" id=start_date>${saving.startDate}</span>
						 	
						 </div>
						 
						  <div class="row" style="margin-left: 60px">
						 	<label class="col-sm-4">End Date:</label>
						 	<span class="col-sm-6 text" id=end_date>${saving.endDate}</span>
						 	
						 </div>
					</div>
					
				</div>	 
					 
					
					 
					 
					
				<input type="hidden" class="form-control" id="start_date">
				
	
				<button class="btn btn-primary btn-save" id="saving" onclick="doWithDrawal()">Withdrawal</button>
			
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
