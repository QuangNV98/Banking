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
	localStorage.clear();
	var check='';
	var day_ass_temp;
	var interest_rate_temp;
	
	var total_recent= ${user.total_money };
	
	$('#init_total_money').text(total_recent.format(2));
	
	$('#list_rates').change(function () {
		 /*  alert($(this).val()); */
		check= $(this).val();
		var option_selected= $('#list_rates :selected').val();
		if(option_selected ==="none") {
			$('#money_asm').val('');
			$('#money_asm_temp').text('');
			$('#end_date').text('');
		}else {
		 
		  $.ajax({
		        url: '${context}/admin/getRate.ajax',
		        type: 'post',
		        data: 'id_rate=' + $(this).val(),
		        cache: false,
		        success: function(response) {    		
		            	console.log(response);
		            	showInfor(response);
		        },error : function(){
		            alert('fail');
		            return false;
		        }
		    }); 
		  }	 
		});
	
	$('#deposit').on('keyup', function () {

		if(check !== 'none') {
				
			var day_ass_temp = localStorage.getItem("day_ass_temp");
			var interest_rate_temp = localStorage.getItem("interest_rate_temp");
			/* var number= parseFloat($('#deposit').val())+parseFloat($('#cash').val()); */
			var number= parseFloat($('#deposit').val());
			
			var inter_money_temp= number *interest_rate_temp*(day_ass_temp/365);
			$('#money_asm').val(roundToTwo(inter_money_temp));
			$('#money_asm_temp').text(roundToTwo(inter_money_temp).format(2));
		}
	});
	
});

Number.prototype.format = function(n, x) {
    var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
    return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
};

function showInfor(rates) {
	var today = new Date();
	var day_str= today.getFullYear()+ '-' + ('0' + (today.getMonth()+1)).slice(-2) + '-'+('0' + today.getDate()).slice(-2);
	
	
	console.log(day_str);
	var total_day= new Date();
	var day_ass= rates.dayDefault*rates.period;
	
	total_day.setDate(today.getDate()+ day_ass);
	
	var total_day_str= total_day.getFullYear()+ '-' + ('0' + (total_day.getMonth()+1)).slice(-2) + '-'+('0' + total_day.getDate()).slice(-2);
	
	
	/* var deposit= parseFloat($('#deposit').val()) + parseFloat($('#cash').val()); */
	var deposit= parseFloat($('#deposit').val());
	$('#total_deposit').val(deposit);
	var inter_money= deposit* rates.interest_rate*(day_ass/365);
	console.log('lai',inter_money);
	
	/* day_ass_temp= day_ass;
	interest_rate_temp= rates.interest_rate;  */
	
	localStorage.setItem("day_ass_temp", day_ass);
	localStorage.setItem("interest_rate_temp", rates.interest_rate); 
	
	
	
	$('#money_asm').val(roundToTwo(inter_money));
	$('#money_asm_temp').text(roundToTwo(inter_money).format(2));
	$('#start_date').val(day_str);
	$('#end_date').text(total_day_str);
	
	
}
function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}

function makeStr(length) {
	   var result           = '';
	   var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
	   var charactersLength = characters.length;
	   for ( var i = 0; i < length; i++ ) {
	      result += characters.charAt(Math.floor(Math.random() * charactersLength));
	   }
	   return result;
	}

function doSave(id_user) {
	var rate_selected= $('#list_rates :selected').val();
	var num_saving= makeStr(2) + Math.floor((Math.random() * 1000000000) + 1);
	
	var depo_recent= parseFloat($('#deposit').val());
	var total_recent= parseFloat('${user.total_money }');
	if(depo_recent > total_recent) {
		alert('not enough money in your wallet!');
		return;
	}
	
	if(rate_selected ==="none" || $('#deposit').val() === null || $('#deposit').val() === '') {
		alert('Complete Info Please!');
		return;
	}else {
		
		$.ajax({
	        url: "${context}/admin/save02.ajax",
	        type: 'post',
	        data: 'id_user=' + id_user + '&total_deposit=' + $('#total_deposit').val() + '&id_rate=' + rate_selected
	        		+ '&start_date=' + $('#start_date').val() + '&end_date=' + $('#end_date').text()
	        		+ '&money_asm=' + $('#money_asm').val()
	        		+ '&num_saving=' + num_saving
	        		/* + '&cash=' + $('#cash').val() */
	        		+ '&deposit=' + $('#deposit').val(),
	        cache: false,
	        success: function(response) {    		
	            	alert(response); 
	            	callBackFunction();
	            	
	        },error : function(){
	            alert('fail');
	            return false;
	        }
	    }); 
	}
}

function callBackFunction() {
	var url="${context}/admin/list-saving";
	window.location.replace(url); 
}

function backToTypeSaving(id_user) {
	
	var url="${context}/admin/toTypeSaving/"+id_user;
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
	border-radius: 30px;
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
				
				<button type="button" class="btn btn-primary" onclick="backToTypeSaving(${user.id })">BACK</button>
						
				<h2 align="center">SAVING</h2>
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
						    	<span class="col-sm-8 text" id="init_total_money">${user.total_money }</span>
	 						 </div>	
	 						 
	 					
 						</div>		    
					 </div>
					  	
				</div>
				<hr>
					 
				<div class="row">
					<div class="col-sm-6"> 	
						<div style="padding-left: 65px;margin-bottom:10px;">
						    <label for="exampleInputPassword1">Deposit from account</label>
						    <input type="number" class="form-control" id="deposit" placeholder="Deposit..." value="0">
						</div>
						
						<!-- <div style="padding-left: 65px;">
						    <label for="exampleInputPassword1">Cash</label>
						    <input type="number" value="0" class="form-control" id="cash" placeholder="Cash...">
						</div> -->
						
						<input type="hidden" id="total_deposit">
						<br>
						 <div style="padding-left: 65px;">
					
							<label for="username">Interest Rate</label>
						    <select id="list_rates">
						    	<option value="none">-------</option>
								<c:forEach items="${rates}" var="r">
									<option value="${r.id}">${r.interest_rate}% on ${r.period} month</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-sm-6"> 	
						<div class="row" style="margin-left: 60px">
						 	<label class="col-sm-4">Money ASS(VND):</label>
						 	<input type="hidden" id="money_asm"></input>
						 	<span class="col-sm-6 text" id="money_asm_temp"></span>
						 </div>
						 
						  <div class="row" style="margin-left: 60px">
						 	<label class="col-sm-4">End Date:</label>
						 	<span class="col-sm-6 text" id=end_date></span>
						 	
						 </div>
					</div>
					
				</div>	 
					 
					
					 
					 
					
				<input type="hidden" class="form-control" id="start_date">
				
	
				<button class="btn btn-primary btn-save" id="saving" onclick="doSave(${user.id })">Submit</button>
			
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
